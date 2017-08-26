<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long lrxh=0;
String tsjlh=null;
String clmc=null;
double sl=0;
double dj=0;
double clf=0;
String llr=null;
java.sql.Date llsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("lrxh");
try{
	if (!(ls.equals("")))  lrxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入序号]类型转换发生意外:"+e);
	return;
}
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
clmc=cf.GB2Uni(request.getParameter("clmc"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
llr=cf.GB2Uni(request.getParameter("llr"));
ls=request.getParameter("llsj");
try{
	if (!(ls.equals("")))  llsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[llsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领料时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_wxclfmx ( lrxh,tsjlh,clmc,sl,dj,clf,llr,llsj,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,lrxh);
	ps.setString(2,tsjlh);
	ps.setString(3,clmc);
	ps.setDouble(4,sl);
	ps.setDouble(5,dj);
	ps.setDouble(6,clf);
	ps.setString(7,llr);
	ps.setDate(8,llsj);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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