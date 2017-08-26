<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double glgz=0;
double gwgz=0;
double jbgz=0;
double jtbt=0;
double cb=0;
double dhbt=0;
double yjsxe=0;
double jj=0;
double qtbt=0;
double qtkk=0;
double tc=0;
double ksk=0;
String bz=null;
double sqgz=0;
double shgz=0;
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工龄工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gwgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗位工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jbgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[底薪]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jtbt不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交通补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每日餐补]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dhbt不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电话补]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjsxe");
try{
	if (!(ls.equals("")))  yjsxe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsxe不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣保费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jj");
try{
	if (!(ls.equals("")))  jj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtbt");
try{
	if (!(ls.equals("")))  qtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtbt不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtkk");
try{
	if (!(ls.equals("")))  qtkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtkk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tc");
try{
	if (!(ls.equals("")))  tc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tc不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ksk");
try{
	if (!(ls.equals("")))  ksk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣税款]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("sqgz");
try{
	if (!(ls.equals("")))  sqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税前工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shgz");
try{
	if (!(ls.equals("")))  shgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税后工资]类型转换发生意外:"+e);
	return;
}
String wherexh=null;
String whereygbh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_yggzb set glgz=?,gwgz=?,jbgz=?,jtbt=?,cb=?,dhbt=?,yjsxe=?,jj=?,qtbt=?,qtkk=?,tc=?,ksk=?,bz=?,sqgz=?,shgz=? ";
	ls_sql+=" where  (xh='"+wherexh+"') and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,glgz);
	ps.setDouble(2,gwgz);
	ps.setDouble(3,jbgz);
	ps.setDouble(4,jtbt);
	ps.setDouble(5,cb);
	ps.setDouble(6,dhbt);
	ps.setDouble(7,yjsxe);
	ps.setDouble(8,jj);
	ps.setDouble(9,qtbt);
	ps.setDouble(10,qtkk);
	ps.setDouble(11,tc);
	ps.setDouble(12,ksk);
	ps.setString(13,bz);
	ps.setDouble(14,sqgz);
	ps.setDouble(15,shgz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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