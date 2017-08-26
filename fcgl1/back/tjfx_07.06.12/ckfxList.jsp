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
	if (!(fgs.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+fgs+"')";

	String cksj=null;
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (cl_ckd.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}
	String cksj2=null;
	cksj2=request.getParameter("cksj2");
	if (cksj2!=null)
	{
		cksj2=cksj2.trim();
		if (!(cksj2.equals("")))	wheresql+="  and (cl_ckd.cksj<=TO_DATE('"+cksj2+"','YYYY/MM/DD'))";
	}

	String leixing=null;
	leixing=request.getParameter("leixing");
	if (leixing.equals("1"))
	{
		wheresql+=" and  (cl_ckmx.leixing='"+leixing+"') ";
	}
	else if (leixing.equals("2"))
	{
		wheresql+=" and  (cl_ckmx.leixing='"+leixing+"') ";
	}


	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_ckmx.cldlmc='"+cldlmc+"') ";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_ckmx.clgg='"+clgg+"') ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_ckmx.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_ckmx.clmc='"+clmc+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_ckmx.lrjsfs='"+lrjsfs+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_ckmx.jldwmc='"+jldwmc+"')";
	}
%>

<center><DIV><b>出库查询统计（<%=cksj%>--<%=cksj2%>）</b></DIV></center>&nbsp;<br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="3%"><B>序号</b></td>
		<td width="10%"><B>材料名称</b></td>
		<td width="10%"><B>材料规格</b></td>
		<td width="5%"><B>计量单位</b></td>
		<td width="6%"><B>分公司材料单价</b></td>
		<td width="6%"><B>出库价</b></td>
		<td width="6%"><B>本期出库数量</b></td>
		<td width="9%"><B>本期出库金额</b></td>
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

double zjcksl=0;
double zjckje=0;

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

		double xjcksl=0;
		double xjckje=0;

		double fgsdj=0;
		double gdj=0;

		double cksl=0;
		double ckje=0;

		ls_sql="SELECT cl_ckmx.clbm,clmc,clgg,jldwmc,DECODE(cl_ckmx.lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,cl_ckmx.fgsdj,cl_ckmx.gdj,sum(cl_ckmx.cksl) cksl,sum(cl_ckmx.ckje) ckje";
		ls_sql+=" from cl_ckmx,cl_ckd  ";
		ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
		ls_sql+=" and cl_ckmx.cldlmc='"+cldlmc+"'";
		ls_sql+=" and cl_ckd.ckzt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by cl_ckmx.clbm,clmc,clgg,jldwmc,cl_ckmx.lrjsfs,cl_ckmx.fgsdj,cl_ckmx.gdj";
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
			fgsdj=rs.getDouble("fgsdj");
			gdj=rs.getDouble("gdj");
			cksl=rs.getDouble("cksl");
			ckje=rs.getDouble("ckje");

			row++;

			xjcksl+=cksl;
			xjckje+=ckje;

			zjcksl+=cksl;
			zjckje+=ckje;

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
				<td ><%=fgsdj%></td>
				<td ><%=gdj%></td>
				<td ><%=cksl%></td>
				<td ><%=ckje%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		xjcksl=cf.doubleTrim(xjcksl);
		xjckje=cf.doubleTrim(xjckje);

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>[<%=cldlmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=xjcksl%></td>
			<td ><%=xjckje%></td>
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

zjcksl=cf.doubleTrim(zjcksl);
zjckje=cf.doubleTrim(zjckje);
%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="4"><B>总  计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=zjcksl%></td>
	<td ><%=zjckje%></td>
</tr>
</table>
</body>
</html>
