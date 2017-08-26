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
	String lrsj=request.getParameter("lrsj");
	String lrsj2=request.getParameter("lrsj2");

	String tj_cldlmc=null;
	String tj_clgg=null;
	String tj_clbm=null;
	String tj_clmc=null;
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
		if (!(tj_clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+tj_clgg+"') ";
	}
	tj_clbm=request.getParameter("clbm");
	if (tj_clbm!=null)
	{
		tj_clbm=cf.GB2Uni(tj_clbm);
		if (!(tj_clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+tj_clbm+"')";
	}
	tj_clmc=request.getParameter("clmc");
	if (tj_clmc!=null)
	{
		tj_clmc=cf.GB2Uni(tj_clmc);
		if (!(tj_clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+tj_clmc+"')";
	}
	tj_jldwmc=request.getParameter("jldwmc");
	if (tj_jldwmc!=null)
	{
		tj_jldwmc=cf.GB2Uni(tj_jldwmc);
		if (!(tj_jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+tj_jldwmc+"')";
	}

%>
<BR><center><b>订单统计
<BR>打印时间：（<%=lrsj%>－－<%=lrsj2%>）
</b></center><br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="10%"><B>序号</b></td>
		<td width="30%"><B>材料名称</b></td>
		<td width="20%"><B>材料规格</b></td>
		<td width="15%"><B>订货数量</b></td>
		<td width="10%"><B>计量单位</b></td>
		<td width="15%"><B>订货金额</b></td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String cldlmc=null;
String clbm=null;//材料编码
String clmc=null;//材料名称
String clgg=null;//材料规格
String jldwmc=null;//计量单位
double ddsl=0;//订单材料数量
double ddje=0;//订单金额
double dlxjddsl=0;//订单材料小计数量
double dlxjddje=0;//订单小计金额
double zjddsl=0;//订单材料小计数量
double zjddje=0;//订单小计金额
double gdj=0;

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

		dlxjddsl=0;
		dlxjddje=0;

		ls_sql="SELECT distinct cl_clbm.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc";
		ls_sql+=" FROM cl_clbm";
		ls_sql+=" where cldlmc='"+cldlmc+"'"; 
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ddsl=0;
			ddje=0;

			clbm=cf.fillNull(rs1.getString("clbm"));
			clmc=cf.fillNull(rs1.getString("clmc"));
			clgg=cf.fillNull(rs1.getString("clgg"));
			jldwmc=cf.fillNull(rs1.getString("jldwmc"));
			row++;

			ls_sql="select sum(cl_clsgmx.shsl),sum(cl_clsgmx.shsl*cl_clsgmx.cjjsj)";
			ls_sql+=" from cl_clsgmx,cl_clsgd  ";
			ls_sql+=" where cl_clsgmx.sgph=cl_clsgd.sgph  ";
			ls_sql+=" and cl_clsgmx.clbm='"+clbm+"' ";
			ls_sql+=" and cl_clsgd.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD') and cl_clsgd.lrsj<=TO_DATE('"+lrsj2+"','YYYY-MM-DD')";//注意起点不包括等于
			ls_sql+=" and cl_clsgd.sgzt not in('1','2','9') ";//注意起点不包括等于
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{

				ddsl=rs2.getDouble(1);
				ddje=rs2.getDouble(2);
			}
			rs2.close();
			ps2.close();

			dlxjddsl+=ddsl;
			dlxjddje+=ddje;
			zjddsl+=ddsl;
			zjddje+=ddje;


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
				<td ><%=clmc%></td>
				<td ><%=clgg%></td>
				<td ><%=cf.formatDouble(ddsl)%></td>
				<td ><%=jldwmc%></td>
				<td ><%=cf.formatDouble(ddje)%></td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();
		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>[<%=cldlmc%>]小计</B></td>
			<td><%=cf.formatDouble(dlxjddsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(dlxjddje)%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>[总计]</B></td>
			<td ><%=cf.formatDouble(zjddsl)%></td>
			<td>&nbsp;</td>
			<td ><%=cf.formatDouble(zjddje)%></td>
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
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>
