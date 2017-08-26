<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jssj=null;
String jsr=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double kcfy=0;
double jsje=0;
String jssm=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("cbzj");
try{
	if (!(ls.equals("")))  cbzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cbzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ycfzj");
try{
	if (!(ls.equals("")))  ycfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ycfzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtfzj");
try{
	if (!(ls.equals("")))  qtfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtfzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kcfy");
try{
	if (!(ls.equals("")))  kcfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kcfy]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣除费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算金额]类型转换发生意外:"+e);
	return;
}
jssm=cf.GB2Uni(request.getParameter("jssm"));
String cwzq=cf.GB2Uni(request.getParameter("cwzq"));
double fk=0;
ls=request.getParameter("fk");
try{
	if (!(ls.equals("")))  fk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款]类型转换发生意外:"+e);
	return;
}
double kzbjbl=0;
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金比例]类型转换发生意外:"+e);
	return;
}
double kzbjje=0;
ls=request.getParameter("kzbjje");
try{
	if (!(ls.equals("")))  kzbjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金金额]类型转换发生意外:"+e);
	return;
}
double qtkk=0;
ls=request.getParameter("qtkk");
try{
	if (!(ls.equals("")))  qtkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它扣款]类型转换发生意外:"+e);
	return;
}


String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_gysjs set jssj=?,jsr=?,kcfy=?,jsje=?,jssm=?,cwzq=?,fk=?,kzbjbl=?,kzbjje=?,qtkk=? ";
	ls_sql+=" where jsjlh="+jsjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jssj);
	ps.setString(2,jsr);
	ps.setDouble(3,kcfy);
	ps.setDouble(4,jsje);
	ps.setString(5,jssm);
	ps.setString(6,cwzq);
	ps.setDouble(7,fk);
	ps.setDouble(8,kzbjbl);
	ps.setDouble(9,kzbjje);
	ps.setDouble(10,qtkk);
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
	out.print("<BR>出错:" + e);
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