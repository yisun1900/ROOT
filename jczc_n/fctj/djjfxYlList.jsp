<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	String wheresql="";

	String ssfgs=cf.GB2Uni(request.getParameter("fgs"));
	String dysj=request.getParameter("dysj");
	String dysj2=request.getParameter("dysj2");
	String xzjg=request.getParameter("xzjg");
	String fgsmc=null;
	String cldlmc=null;
	String clgg=null;
	String clbm=null;
	String clmc=null;
	String lrjsfs=null;
	String jldwmc=null;

	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"') ";
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
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}

	Connection conn0  = null;
	PreparedStatement ps0=null;
	ResultSet rs0=null;
try {
	conn0=cf.getConnection();
	String ls_sql1=null;

	ls_sql1="select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'";
	ps0=conn0.prepareStatement(ls_sql1);  
	rs0=ps0.executeQuery();
	if (rs0.next())
	{
		fgsmc=rs0.getString(2);
	} 
	rs0.close();
	ps0.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs0 != null) rs0.close(); 
		if (ps0 != null) ps0.close(); 
		if (conn0 != null) cf.close(conn0); 
	}
	catch (Exception e){
		if (conn0 != null) cf.close(conn0); 
	}
}

%>

<center><b>代金券统计（<%=fgsmc%>）
<BR>打印时间：（<%=dysj%>－－<%=dysj2%>）
</b></center><br>
<DIV onselectstart="return false" class="STYLE_DIV">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
	<tr bgcolor="CCCCCC" align="center"  class="STYLE_TR"> 
		<td width="6%" class="STYLE2"><B>序号</b></td>
		<td width="18%" class="STYLE2"><B>材料名称</b></td>
		<td width="9%" class="STYLE2"><B>所属大类</b></td>
		<td width="18%" class="STYLE2"><B>材料规格</b></td>
		<td width="10%" class="STYLE2"><B>计量单位</b></td>
		<td width="10%" class="STYLE2"><B>分公司材料单价</b></td>
		<td width="10%" class="STYLE2"><B>工队价</b></td>
		<td width="12%" class="STYLE2"><B>所开数量</b></td>
		<td width="16%" class="STYLE2"><B>所开金额</b></td>
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

double zjdjjsl=0;
double zjdjjje=0;

try {
	conn=cf.getConnection();

	String bgcolor="";


	int row=0;

	ls_sql="SELECT cldlmc";
	ls_sql+=" FROM cl_cldlbm";
    ls_sql+=" order by cldlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		cldlmc=cf.fillNull(rs2.getString("cldlmc"));

		double xjdjjsl=0;
		double xjdjjje=0;

		double fgsdj=0;
		double gdj=0;

		ls_sql="SELECT cl_clbm.clbm,clmc,clgg,cldlmc,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,cl_jgmx.fgsdj,cl_jgmx.gdj";
		ls_sql+=" FROM cl_clbm,cl_jgmx";
		ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_clbm.cldlmc='"+cldlmc+"' and cl_jgmx.dwbh='"+ssfgs+"'";
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
			lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
			fgsdj=rs.getDouble("fgsdj");
			gdj=rs.getDouble("gdj");

			row++;

			double djjsl=0;
			double djjje=0;
			ls_sql="select sum(cl_djjmx.sjsl),sum(cl_djjmx.sjje)";
			ls_sql+=" from cl_djjmx,cl_djj  ";
			ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh  ";
			ls_sql+=" and cl_djj.dwbh='"+ssfgs+"'  ";
			ls_sql+=" and cl_djjmx.clbm='"+clbm+"' ";
			ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";//注意起点不包括等于
			ls_sql+=" group by cl_djj.czzt";//注意起点不包括等于
			ls_sql+=" having cl_djj.czzt='3' ";//注意起点不包括等于
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				djjsl=rs1.getDouble(1);
				djjje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			djjje=cf.doubleTrim(djjje);


			xjdjjsl+=djjsl;
			xjdjjje+=djjje;

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
				<td ><%=clmc%></td>
				<td ><%=cldlmc%></td>
				<td ><%=clgg%></td>
				<td ><%=jldwmc%></td>
				<td ><%=fgsdj%></td>
				<td ><%=gdj%></td>
				<td ><%=djjsl%></td>
				<td ><%=djjje%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		xjdjjsl=cf.doubleTrim(xjdjjsl);
		xjdjjje=cf.doubleTrim(xjdjjje);

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>[<%=cldlmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=xjdjjsl%></td>
			<td ><%=xjdjjje%></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

zjdjjsl=cf.doubleTrim(zjdjjsl);
zjdjjje=cf.doubleTrim(zjdjjje);
%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="4"><B>总  计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=zjdjjsl%></td>
	<td ><%=zjdjjje%></td>
</tr>
</table>
</body>
</html>