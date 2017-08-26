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

	String cldlmc=null;
	String clgg=null;
	String clbm=null;
	String clmc=null;
	String lrjsfs=null;
	String jldwmc=null;
	String fgsmc=null;

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

<center><DIV><b>库存分析（<%=fgsmc%>）</b></DIV></center>&nbsp;<br>
<DIV onselectstart="return false" class="STYLE_DIV">
      <table border="1" width="180%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
	<tr bgcolor="CCCCCC" align="center" class="STYLE_TR"> 
		<td width="3%" class="STYLE1"><B>序号</b></td>
		<td width="9%" class="STYLE1"><B>材料名称</b></td>
		<td width="9%" class="STYLE1"><B>所属大类</b></td>
		<td width="9%" class="STYLE2"><B>材料规格</b></td>
		<td width="4%" class="STYLE2"><B>计量单位</b></td>
		<td width="6%" class="STYLE2"><B>分公司材料单价</b></td>
		<td width="5%" class="STYLE2"><B>工队价</b></td>
		<td width="6%" class="STYLE2"><B>上期库存数量</b></td>
		<td width="9%" class="STYLE2"><B>上期库存金额</b></td>
		<td width="6%" class="STYLE2"><B>本期入库数量</b></td>
		<td width="8%" class="STYLE2"><B>本期入库金额</b></td>
		<td width="5%" class="STYLE2"><B>本期出库数量</b></td>
		<td width="8%" class="STYLE2"><B>本期出库金额</b></td>
		<td width="6%" class="STYLE2"><B>库存数量</b></td>
		<td width="8%" class="STYLE2"><B>库存金额</b></td>
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

double zjsqkcsl=0;
double zjsqkcje=0;
double zjsumrk=0;
double zjsumrkje=0;
double zjsumck=0;
double zjsumckje=0;
double zjkcsl=0;
double zjkcje=0;

try {
	conn=cf.getConnection();

	String bgcolor="";

	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

	int row=0;

	ls_sql="SELECT cldlmc";
	ls_sql+=" FROM cl_cldlbm";
    ls_sql+=" order by cldlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		cldlmc=cf.fillNull(rs2.getString("cldlmc"));

		double xjsqkcsl=0;
		double xjsqkcje=0;
		double xjsumrk=0;
		double xjsumrkje=0;
		double xjsumck=0;
		double xjsumckje=0;
		double xjkcsl=0;
		double xjkcje=0;

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

			double sqkcsl=0;
			double sqkcje=0;
			ls_sql="select cl_ydjzmx.kcsl ";
			ls_sql+=" from cl_ydjzmx,cl_ydjz ";
			ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+ssfgs+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sqkcsl=rs1.getDouble("kcsl");
			}
			rs1.close();
			ps1.close();

			sqkcje=fgsdj*sqkcsl;
		
			double sumrk=0;
			double sumrkje=0;
			ls_sql="select sum(rksl),sum(cl_rkmx.rkje)  ";
			ls_sql+=" from cl_rkmx,cl_rkd  ";
			ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
			ls_sql+=" and cl_rkd.dwbh='"+ssfgs+"'  ";
			ls_sql+=" and clbm='"+clbm+"' ";
			ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//注意起点不包括等于
			ps1= conn.prepareStatement(ls_sql);
			ps1.setDate(1,sqjzrq);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sumrk=rs1.getDouble(1);
				sumrkje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			double sumck=0;
			double sumckje=0;
			ls_sql="select sum(cksl),sum(cl_ckmx.ckje) ckje  ";
			ls_sql+=" from cl_ckmx,cl_ckd  ";
			ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
			ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"' ";
			ls_sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckmx.leixing='1' ";
			ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//注意起点不包括等于
			ps1= conn.prepareStatement(ls_sql);
			ps1.setDate(1,sqjzrq);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sumck=rs1.getDouble(1);
				sumckje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();


			double kcsl=0;
			double kcje=0;
			kcsl=cf.doubleTrim(sqkcsl+sumrk-sumck);
			kcje=cf.doubleTrim(kcsl*fgsdj);

			sqkcje=cf.doubleTrim(sqkcje);
			sumrkje=cf.doubleTrim(sumrkje);
			sumckje=cf.doubleTrim(sumckje);

			xjsqkcsl+=sqkcsl;
			xjsqkcje+=sqkcje;
			xjsumrk+=sumrk;
			xjsumrkje+=sumrkje;
			xjsumck+=sumck;
			xjsumckje+=sumckje;
			xjkcsl+=kcsl;
			xjkcje+=kcje;

			zjsqkcsl+=sqkcsl;
			zjsqkcje+=sqkcje;
			zjsumrk+=sumrk;
			zjsumrkje+=sumrkje;
			zjsumck+=sumck;
			zjsumckje+=sumckje;
			zjkcsl+=kcsl;
			zjkcje+=kcje;

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
		
			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td  class="STYLE3"><%=row%></td>
				<td  class="STYLE3"><%=clmc%></td>
				<td  class="STYLE3"><%=cldlmc%></td>
				<td  class="STYLE4"><%=clgg%></td>
				<td  class="STYLE4"><%=jldwmc%></td>
				<td  class="STYLE4"><%=fgsdj%></td>
				<td  class="STYLE4"><%=gdj%></td>
				<td  class="STYLE4"><%=sqkcsl%></td>
				<td  class="STYLE4"><%=sqkcje%></td>
				<td  class="STYLE4"><%=sumrk%></td>
				<td  class="STYLE4"><%=sumrkje%></td>
				<td  class="STYLE4"><%=sumck%></td>
				<td  class="STYLE4"><%=sumckje%></td>
				<td  class="STYLE4"><%=kcsl%></td>
				<td  class="STYLE4"><%=kcje%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		xjsqkcsl=cf.doubleTrim(xjsqkcsl);
		xjsqkcje=cf.doubleTrim(xjsqkcje);
		xjsumrk=cf.doubleTrim(xjsumrk);
		xjsumrkje=cf.doubleTrim(xjsumrkje);
		xjsumck=cf.doubleTrim(xjsumck);
		xjsumckje=cf.doubleTrim(xjsumckje);
		xjkcsl=cf.doubleTrim(xjkcsl);
		xjkcje=cf.doubleTrim(xjkcje);

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3" class="STYLE3"><B>[<%=cldlmc%>]小计</B></td>
			<td  class="STYLE4">&nbsp;</td>
			<td  class="STYLE4">&nbsp;</td>
			<td  class="STYLE4">&nbsp;</td>
			<td  class="STYLE4">&nbsp;</td>
			<td  class="STYLE4"><%=xjsqkcsl%></td>
			<td  class="STYLE4"><%=xjsqkcje%></td>
			<td  class="STYLE4"><%=xjsumrk%></td>
			<td  class="STYLE4"><%=xjsumrkje%></td>
			<td  class="STYLE4"><%=xjsumck%></td>
			<td  class="STYLE4"><%=xjsumckje%></td>
			<td  class="STYLE4"><%=xjkcsl%></td>
			<td  class="STYLE4"><%=xjkcje%></td>
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

zjsqkcsl=cf.doubleTrim(zjsqkcsl);
zjsqkcje=cf.doubleTrim(zjsqkcje);
zjsumrk=cf.doubleTrim(zjsumrk);
zjsumrkje=cf.doubleTrim(zjsumrkje);
zjsumck=cf.doubleTrim(zjsumck);
zjsumckje=cf.doubleTrim(zjsumckje);
zjkcsl=cf.doubleTrim(zjkcsl);
zjkcje=cf.doubleTrim(zjkcje);
%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="3" class="STYLE3"><B>总  计</B></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4"><%=zjsqkcsl%></td>
	<td  class="STYLE4"><%=zjsqkcje%></td>
	<td  class="STYLE4"><%=zjsumrk%></td>
	<td  class="STYLE4"><%=zjsumrkje%></td>
	<td  class="STYLE4"><%=zjsumck%></td>
	<td  class="STYLE4"><%=zjsumckje%></td>
	<td  class="STYLE4"><%=zjkcsl%></td>
	<td  class="STYLE4"><%=zjkcje%></td>
</tr>
</table>
</DIV>
</body>
</html>