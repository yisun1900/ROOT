<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	String wheresql="";
	String wheresql1="";

	String ssfgs=cf.GB2Uni(request.getParameter("fgs"));
	String dysj=request.getParameter("dysj");
	String dysj2=request.getParameter("dysj2");
	String xzjg=request.getParameter("xzjg");

	String tj_cldlmc=null;
	String tj_clgg=null;
	String tj_clbm=null;
	String tj_clmc=null;
	String tj_lrjsfs=null;
	String tj_jldwmc=null;
	tj_cldlmc=request.getParameter("cldlmc");
	if (tj_cldlmc!=null)
	{
		tj_cldlmc=cf.GB2Uni(tj_cldlmc);
		if (!(tj_cldlmc.equals("")))	wheresql1+=" and  (cl_cldlbm.cldlbm='"+tj_cldlmc+"') ";
	}
	tj_clgg=request.getParameter("clgg");
	if (tj_clgg!=null)
	{
		tj_clgg=cf.GB2Uni(tj_clgg);
		if (!(tj_clgg.equals("")))	wheresql+=" and  (cl_djjmx.clgg='"+tj_clgg+"') ";
	}
	tj_clbm=request.getParameter("clbm");
	if (tj_clbm!=null)
	{
		tj_clbm=cf.GB2Uni(tj_clbm);
		if (!(tj_clbm.equals("")))	wheresql+=" and  (cl_djjmx.clbm='"+tj_clbm+"')";
	}
	tj_clmc=request.getParameter("clmc");
	if (tj_clmc!=null)
	{
		tj_clmc=cf.GB2Uni(tj_clmc);
		if (!(tj_clmc.equals("")))	wheresql+=" and  (cl_djjmx.clmc='"+tj_clmc+"')";
	}

	tj_lrjsfs=request.getParameter("lrjsfs");
	if (tj_lrjsfs!=null)
	{
		tj_lrjsfs=cf.GB2Uni(tj_lrjsfs);
		if (!(tj_lrjsfs.equals("")))	wheresql+=" and  (cl_djjmx.lrjsfs='"+tj_lrjsfs+"')";
	}
	tj_jldwmc=request.getParameter("jldwmc");
	if (tj_jldwmc!=null)
	{
		tj_jldwmc=cf.GB2Uni(tj_jldwmc);
		if (!(tj_jldwmc.equals("")))	wheresql+=" and  (cl_djjmx.jldwmc='"+tj_jldwmc+"')";
	}

%>
<BR><center><b>代金券统计
<BR>统计时间：（<%=dysj%>－－<%=dysj2%>）
</b></center><br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="8%"><B>序号</b></td>
		<td width="12%"><B>材料编码</b></td>
		<td width="25%"><B>材料名称</b></td>
		<td width="15%"><B>材料规格</b></td>
		<td width="15%"><B>所开数量</b></td>
		<td width="10%"><B>计量单位</b></td>
		<td width="15%"><B>所开金额</b></td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String cldlmc=null;
String clbm=null;//材料编码
String clmc=null;//材料名称
String clgg=null;//材料规格
String jldwmc=null;//计量单位
double djjsl=0;//代金券材料数量
double djjje=0;//代金券金额
double dlxjdjjsl=0;//代金券材料小计数量
double dlxjdjjje=0;//代金券小计金额
double zjdjjsl=0;//代金券材料小计数量
double zjdjjje=0;//代金券小计金额

int row=0;
String bgcolor="";

try {

	conn=cf.getConnection();
	ls_sql="SELECT cldlmc";
	ls_sql+=" FROM cl_cldlbm where 1=1 ";
	ls_sql+=wheresql1;
	ls_sql+=" order by cldlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		dlxjdjjsl=0;
		dlxjdjjje=0;

		
		ls_sql="select cl_djjmx.clbm,clmc,clgg,jldwmc,sum(cl_djjmx.sjsl) djjsl,sum(cl_djjmx.sjje) djjje";
		ls_sql+=" from cl_djjmx,cl_djj  ";
		ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh  ";
		ls_sql+=" and cl_djjmx.cldlmc='"+cldlmc+"' ";

		ls_sql+=" and (";

		ls_sql+=" ( cl_djj.sfjm='2' and cl_djj.shzt='3' and cl_djj.ejshjl='1' ";//1：不申请；2：申请减免,//1:未审核;2: 一级审核;3:二级审核
		ls_sql+=" and cl_djj.ejshsj>=TO_DATE('"+dysj+"','YYYY-MM-DD') ";
		ls_sql+=" and cl_djj.ejshsj<=TO_DATE('"+dysj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
		ls_sql+=" and cl_djj.czzt!='8' )";


		ls_sql+=" OR ";
		ls_sql+=" ( cl_djj.sfjm='1' ";
		ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') ";
		ls_sql+=" and cl_djj.dysj<=TO_DATE('"+dysj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
		ls_sql+=" and cl_djj.czzt='3' )";
		
		ls_sql+=" )";
	
		ls_sql+=wheresql;
		ls_sql+=" group by cl_djjmx.clbm,clmc,clgg,jldwmc";
		ls_sql+=" order by clbm ";
	
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			clbm=cf.fillNull(rs1.getString("clbm"));
			clmc=cf.fillNull(rs1.getString("clmc"));
			clgg=cf.fillNull(rs1.getString("clgg"));
			jldwmc=cf.fillNull(rs1.getString("jldwmc"));
			djjsl=rs1.getDouble("djjsl");
			djjje=rs1.getDouble("djjje");

			row++;

	
			dlxjdjjsl+=djjsl;
			dlxjdjjje+=djjje;
			zjdjjsl+=djjsl;
			zjdjjje+=djjje;

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td ><%=row%></td>
				<td ><%=clbm%></td>
				<td ><%=clmc%></td>
				<td ><%=clgg%></td>
				<td ><%=cf.formatDouble(djjsl)%></td>
				<td ><%=jldwmc%></td>
				<td ><%=cf.formatDouble(djjje)%></td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();
		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>[<%=cldlmc%>]小计</B></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(dlxjdjjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(dlxjdjjje)%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>[总计]</B></td>
			<td>&nbsp;</td>
			<td ><%=cf.formatDouble(zjdjjsl)%></td>
			<td>&nbsp;</td>
			<td ><%=cf.formatDouble(zjdjjje)%></td>
		</tr>
		<%

}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>



