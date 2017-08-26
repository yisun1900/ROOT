<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String fxmbh=cf.GB2Uni(request.getParameter("fxmbh"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));


String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
String gycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));


ls=request.getParameter("clbj");
try{
	if (!(ls.equals("")))  clbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rgbj");
try{
	if (!(ls.equals("")))  rgbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxbj");
try{
	if (!(ls.equals("")))  jxbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算价]类型转换发生意外:"+e);
	return;
}
gycl=cf.GB2Uni(request.getParameter("gycl"));


String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));

double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
ls=request.getParameter("zcf");
try{
	if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shf");
try{
	if (!(ls.equals("")))  shf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysf");
try{
	if (!(ls.equals("")))  ysf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="insert into bj_jzbjcfb (bjbbh,dqbm,bjjbbm,fxmbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm   ,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,gycl,flmcgg   ,lrr,lrsj,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,fxmbh);
	ps.setString(5,xmbh);
	ps.setString(6,xmmc);
	ps.setString(7,xmdlbm);
	ps.setString(8,xmxlbm);
	ps.setString(9,smbm);
	ps.setString(10,jldwbm);

	ps.setDouble(11,clbj);
	ps.setDouble(12,rgbj);
	ps.setDouble(13,jxbj);
	ps.setDouble(14,zcf);
	ps.setDouble(15,shf);
	ps.setDouble(16,ysf);
	ps.setDouble(17,qtf);
	ps.setDouble(18,bj);
	ps.setString(19,gycl);
	ps.setString(20,flmcgg);

	ps.setString(21,lrr);
	ps.setDate(22,lrsj);
	ps.setString(23,bz);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>