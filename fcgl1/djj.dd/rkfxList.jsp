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


	String cldlmc=null;
	String clgg=null;
	String clbm=null;
	String clmc=null;
	String lrjsfs=null;
	String jldwmc=null;

	String fgs=cf.GB2Uni(request.getParameter("fgs"));
	if (!(fgs.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+fgs+"')";

	String rksj=null;
	rksj=request.getParameter("rksj");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (cl_rkd.rksj>=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	String rksj2=null;
	rksj2=request.getParameter("rksj2");
	if (rksj2!=null)
	{
		rksj2=rksj2.trim();
		if (!(rksj2.equals("")))	wheresql+="  and (cl_rkd.rksj<=TO_DATE('"+rksj2+"','YYYY/MM/DD'))";
	}


	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_rkmx.cldlmc='"+cldlmc+"') ";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_rkmx.clgg='"+clgg+"') ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_rkmx.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_rkmx.clmc='"+clmc+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_rkmx.lrjsfs='"+lrjsfs+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_rkmx.jldwmc='"+jldwmc+"')";
	}
%>

<center><DIV><b>入库查询统计（<%=rksj%>--<%=rksj2%>）</b></DIV></center>&nbsp;<br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="3%"><B>序号</b></td>
		<td width="10%"><B>材料名称</b></td>
		<td width="10%"><B>材料规格</b></td>
		<td width="5%"><B>计量单位</b></td>
		<td width="6%"><B>入库价</b></td>
		<td width="6%"><B>本期入库数量</b></td>
		<td width="9%"><B>本期入库金额</b></td>
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

double zjrksl=0;
double zjrkje=0;

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

		double xjrksl=0;
		double xjrkje=0;

		double fgsdj=0;
		double rkdj=0;

		double rksl=0;
		double rkje=0;

		ls_sql="SELECT cl_rkmx.clbm,clmc,clgg,jldwmc,DECODE(cl_rkmx.lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,cl_rkmx.rkdj,sum(cl_rkmx.rksl) rksl,sum(cl_rkmx.rkje) rkje";
		ls_sql+=" from cl_rkmx,cl_rkd  ";
		ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
		ls_sql+=" and cl_rkmx.cldlmc='"+cldlmc+"'";
		ls_sql+=" and cl_rkd.rkzt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by cl_rkmx.clbm,clmc,clgg,jldwmc,cl_rkmx.lrjsfs,cl_rkmx.rkdj";
		ls_sql+=" order by clbm ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			clgg=cf.fillNull(rs.getString("clgg"));
			jldwmc=cf.fillNull(rs.getString("jldwmc"));
			lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
			rkdj=rs.getDouble("rkdj");
			rksl=rs.getDouble("rksl");
			rkje=rs.getDouble("rkje");

			row++;

			xjrksl+=rksl;
			xjrkje+=rkje;

			zjrksl+=rksl;
			zjrkje+=rkje;

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
				<td ><%=rkdj%></td>
				<td ><%=rksl%></td>
				<td ><%=rkje%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		xjrksl=cf.doubleTrim(xjrksl);
		xjrkje=cf.doubleTrim(xjrkje);

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>[<%=cldlmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td ><%=xjrksl%></td>
			<td ><%=xjrkje%></td>
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

zjrksl=cf.doubleTrim(zjrksl);
zjrkje=cf.doubleTrim(zjrkje);
%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="4"><B>总  计</B></td>
	<td >&nbsp;</td>
	<td ><%=zjrksl%></td>
	<td ><%=zjrkje%></td>
</tr>
</table>
</body>
</html>