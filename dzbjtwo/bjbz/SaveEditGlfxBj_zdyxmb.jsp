<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ls=null;
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
double sgdbj=0;

String gycl=cf.GB2Uni(request.getParameter("gycl"));


dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

ls=request.getParameter("clcb");
try{
	if (!(ls.equals("")))  clcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clcb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rgcb");
try{
	if (!(ls.equals("")))  rgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgcb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxcb");
try{
	if (!(ls.equals("")))  jxcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxcb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbenj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}

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
ls=request.getParameter("sgdbj");
try{
	if (!(ls.equals("")))  sgdbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程基础报价]类型转换发生意外:"+e);
	return;
}

java.sql.Date zdyxmyxq=null;
ls=request.getParameter("zdyxmyxq");
try{
	if (!(ls.equals("")))  zdyxmyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zdyxmyxq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自定义项目有效期]类型转换发生意外:"+e);
	return;
}

String xmbh=request.getParameter("xmbh");
String lrr=request.getParameter("lrr");
String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sfxycl=cf.GB2Uni(request.getParameter("sfxycl"));
String sfxyyjd=cf.GB2Uni(request.getParameter("sfxyyjd"));

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
String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
double sgcbj=0;
ls=request.getParameter("sgcbj");
try{
	if (!(ls.equals("")))  sgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgcbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工成本价]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update bj_zdyxmb set xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?,clbj=?,rgbj=?,jxbj=?,zcf=?,shf=?   ,ysf=?,qtf=?,bj=?,sgdbj=?,gycl=?,zdyxmyxq=?,flmcgg=?,bz=?,sfxycl=?,sfxyyjd=?,xmflbm=?,sgcbj=? ";
	ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmmc);
	ps.setString(2,xmdlbm);
	ps.setString(3,xmxlbm);
	ps.setString(4,smbm);
	ps.setString(5,jldwbm);
	ps.setDouble(6,clbj);
	ps.setDouble(7,rgbj);
	ps.setDouble(8,jxbj);
	ps.setDouble(9,zcf);
	ps.setDouble(10,shf);

	ps.setDouble(11,ysf);
	ps.setDouble(12,qtf);
	ps.setDouble(13,bj);
	ps.setDouble(14,sgdbj);
	ps.setString(15,gycl);
	ps.setDate(16,zdyxmyxq);
	ps.setString(17,flmcgg);
	ps.setString(18,bz);
	ps.setString(19,sfxycl);
	ps.setString(20,sfxyyjd);
	ps.setString(21,xmflbm);
	ps.setDouble(22,sgcbj);

	ps.executeUpdate();
	ps.close();

	ls_sql =" delete from bj_zdyxmb ";
	ls_sql+=" where zdyxmyxq<SYSDATE-90";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
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