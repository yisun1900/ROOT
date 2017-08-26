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

	String cldlmc=null;
	String clgg=null;
	String clbm=null;
	String clmc=null;
	String jldwmc=null;

	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql1+=" and  (cl_cldlbm.cldlbm='"+cldlmc+"') ";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+clgg+"') ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+clmc+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}
%>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

double jtzjddsl=0;
double jtzjddje=0;

try {
	conn=cf.getConnection();

	String bgcolor="";
	String dwbh="";
	String dwmc="";

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!ssfgs.equals(""))
	{
		ls_sql+=" and dwbh='"+ssfgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		dwbh=cf.fillNull(rs3.getString("dwbh"));
		dwmc=cf.fillNull(rs3.getString("dwmc"));

		int row=0;
		double zjddsl=0;
		double zjddje=0;


		%>
		<BR><center><b>订单统计（<%=dwmc%>）
		<BR>打印时间：（<%=lrsj%>－－<%=lrsj2%>）
		</b></center><br>
		<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
			<tr bgcolor="CCCCCC" align="center"> 
				<td width="8%"><B>序号</b></td>
				<td width="20%"><B>材料名称</b></td>
				<td width="20%"><B>材料规格</b></td>
				<td width="12%"><B>计量单位</b></td>
				<td width="12%"><B>厂家结算价</b></td>
				<td width="12%"><B>所开数量</b></td>
				<td width="16%"><B>所开金额</b></td>
			</tr>
		<%
		
		ls_sql="SELECT cldlmc";
		ls_sql+=" FROM cl_cldlbm where 1=1 ";
		ls_sql+=wheresql1;
		ls_sql+=" order by cldlbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			cldlmc=cf.fillNull(rs2.getString("cldlmc"));

			double xjddsl=0;
			double xjddje=0;
			double gdj=0;

			ls_sql="SELECT distinct cl_clbm.clbm,clmc,clgg,cldlmc,jldwmc,cl_jgmx.cjjsj";
			ls_sql+=" FROM cl_clbm,cl_jgmx";
			ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_clbm.cldlmc='"+cldlmc+"' and cl_jgmx.dwbh='"+dwbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" order by cldlmc,clbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillNull(rs.getString("clmc"));
				clgg=cf.fillNull(rs.getString("clgg"));
				cldlmc=cf.fillNull(rs.getString("cldlmc"));
				jldwmc=cf.fillNull(rs.getString("jldwmc"));
				gdj=rs.getDouble("cjjsj");

				row++;

				double ddsl=0;
				double ddje=0;
				ls_sql="select sum(cl_clsgmx.shsl)";
				ls_sql+=" from cl_clsgmx,cl_clsgd  ";
				ls_sql+=" where cl_clsgmx.sgph=cl_clsgd.sgph  ";
				ls_sql+=" and cl_clsgd.dwbh='"+dwbh+"'  ";
				ls_sql+=" and cl_clsgmx.clbm='"+clbm+"' ";
				ls_sql+=" and cl_clsgd.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD') and cl_clsgd.lrsj<=TO_DATE('"+lrsj2+"','YYYY-MM-DD')";//注意起点不包括等于
				ls_sql+=" and cl_clsgd.sgzt not in('1','2','9') ";//注意起点不包括等于
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddsl=rs1.getDouble(1);
					//ddje=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				ddje=ddsl*gdj;


				xjddsl+=ddsl;
				xjddje+=ddje;

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
					<td ><%=jldwmc%></td>
					<td ><%=gdj%></td>
					<td ><%=ddsl%></td>
					<td ><%=ddje%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();

			xjddsl=cf.doubleTrim(xjddsl);
			//xjddje=cf.doubleTrim(xjddje);

			%>
			<tr bgcolor="E8E8FF" align="center">
				<td colspan="3"><B>[<%=cldlmc%>]小计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td ><%=xjddsl%></td>
				<td ><%=xjddje%></td>
			</tr>
			<%
		}
		rs2.close();
		ps2.close();

		zjddsl=cf.doubleTrim(zjddsl);
		zjddje=cf.doubleTrim(zjddje);

		jtzjddsl+=zjddsl;
		jtzjddje+=zjddje;

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>总  计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=zjddsl%></td>
			<td ><%=zjddje%></td>
		</tr>
		</table>
		<%
	}
		rs3.close();//田加 开始没有
		ps3.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

	<P>
	<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="E8E8FF" align="center">
		<td ><B>全部总计</B></td>
		<td width="10%" >&nbsp;</td>
		<td width="10%" >&nbsp;</td>
		<td width="12%" ><%=jtzjddsl%></td>
		<td width="16%" ><%=jtzjddje%></td>
	</tr>
	</table>
</body>
</html>
