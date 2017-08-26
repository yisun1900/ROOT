<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double tskddje=0;
double tskzdje=0;
double tskxdje=0;
double tsjcdd=0;
double tsjczd=0;
double tsjcxd=0;
double kjddze=0;
double kjzdze=0;
double kjxdze=0;
double kjdze=0;
String djbz=null;
String bz=null;
ls=request.getParameter("tskddje");
try{
	if (!(ls.equals("")))  tskddje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tskddje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣大单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tskzdje");
try{
	if (!(ls.equals("")))  tskzdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tskzdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣中单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tskxdje");
try{
	if (!(ls.equals("")))  tskxdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tskxdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣小单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjcdd");
try{
	if (!(ls.equals("")))  tsjcdd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjcdd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚大单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjczd");
try{
	if (!(ls.equals("")))  tsjczd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjczd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚中单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjcxd");
try{
	if (!(ls.equals("")))  tsjcxd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjcxd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚小单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjddze");
try{
	if (!(ls.equals("")))  kjddze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjddze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下期可接大单总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjzdze");
try{
	if (!(ls.equals("")))  kjzdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjzdze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下期可接中单总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxdze");
try{
	if (!(ls.equals("")))  kjxdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxdze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下期可接小单总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjdze");
try{
	if (!(ls.equals("")))  kjdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjdze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下期可接单总额]类型转换发生意外:"+e);
	return;
}
djbz=cf.GB2Uni(request.getParameter("djbz"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekpjlh=null;
String wheresgd=null;
wherekpjlh=cf.GB2Uni(request.getParameter("wherekpjlh"));
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_yzfsgdkpjg set tskddje=?,tskzdje=?,tskxdje=?,tsjcdd=?,tsjczd=?,tsjcxd=?,kjddze=?,kjzdze=?,kjxdze=?,kjdze=?,djbz=?,bz=? ";
	ls_sql+=" where  (kpjlh="+wherekpjlh+") and  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,tskddje);
	ps.setDouble(2,tskzdje);
	ps.setDouble(3,tskxdje);
	ps.setDouble(4,tsjcdd);
	ps.setDouble(5,tsjczd);
	ps.setDouble(6,tsjcxd);
	ps.setDouble(7,kjddze);
	ps.setDouble(8,kjzdze);
	ps.setDouble(9,kjxdze);
	ps.setDouble(10,kjdze);
	ps.setString(11,djbz);
	ps.setString(12,bz);
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