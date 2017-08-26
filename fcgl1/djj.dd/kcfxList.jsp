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

	String ssfgs=cf.GB2Uni(request.getParameter("fgs"));

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
%>

<center><DIV><b>库存分析（<%=ssfgs%>）</b></DIV></center>&nbsp;<br>
<table width="120%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="3%"><B>序号</b></td>
		<td width="10%"><B>材料名称</b></td>
		<td width="10%"><B>材料规格</b></td>
		<td width="5%"><B>计量单位</b></td>
		<td width="6%"><B>分公司材料单价</b></td>
		<td width="6%"><B>工队价</b></td>
		<td width="6%"><B>上期库存数量</b></td>
		<td width="9%"><B>上期库存金额</b></td>
		<td width="6%"><B>本期入库数量</b></td>
		<td width="9%"><B>本期入库金额</b></td>
		<td width="6%"><B>本期出库数量</b></td>
		<td width="9%"><B>本期出库金额</b></td>
		<td width="6%"><B>库存数量</b></td>
		<td width="9%"><B>库存金额</b></td>
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
			ls_sql="select nvl(sum(rksl),0)  ";
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
			}
			rs1.close();
			ps1.close();

			sumrkje=sumrk*fgsdj;

			double sumck=0;
			double sumckje=0;
			ls_sql="select nvl(sum(cksl),0)  ";
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
			}
			rs1.close();
			ps1.close();

			sumckje=sumck*gdj;


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
				<td ><%=row%></td>
				<td ><%=clmc%></td>
				<td ><%=clgg%></td>
				<td ><%=jldwmc%></td>
				<td ><%=fgsdj%></td>
				<td ><%=gdj%></td>
				<td ><%=sqkcsl%></td>
				<td ><%=sqkcje%></td>
				<td ><%=sumrk%></td>
				<td ><%=sumrkje%></td>
				<td ><%=sumck%></td>
				<td ><%=sumckje%></td>
				<td ><%=kcsl%></td>
				<td ><%=kcje%></td>
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
			<td colspan="4"><B>[<%=cldlmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=xjsqkcsl%></td>
			<td ><%=xjsqkcje%></td>
			<td ><%=xjsumrk%></td>
			<td ><%=xjsumrkje%></td>
			<td ><%=xjsumck%></td>
			<td ><%=xjsumckje%></td>
			<td ><%=xjkcsl%></td>
			<td ><%=xjkcje%></td>
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
	<td colspan="4"><B>总  计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=zjsqkcsl%></td>
	<td ><%=zjsqkcje%></td>
	<td ><%=zjsumrk%></td>
	<td ><%=zjsumrkje%></td>
	<td ><%=zjsumck%></td>
	<td ><%=zjsumckje%></td>
	<td ><%=zjkcsl%></td>
	<td ><%=zjkcje%></td>
</tr>
</table>
</body>
</html>