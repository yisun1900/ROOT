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
	out.println("<BR>����tskddje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿۴�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tskzdje");
try{
	if (!(ls.equals("")))  tskzdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tskzdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿��е�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tskxdje");
try{
	if (!(ls.equals("")))  tskxdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tskxdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿�С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjcdd");
try{
	if (!(ls.equals("")))  tsjcdd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjcdd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjczd");
try{
	if (!(ls.equals("")))  tsjczd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjczd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷��е�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjcxd");
try{
	if (!(ls.equals("")))  tsjcxd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjcxd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷�С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjddze");
try{
	if (!(ls.equals("")))  kjddze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjddze������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿɽӴ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjzdze");
try{
	if (!(ls.equals("")))  kjzdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjzdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿɽ��е��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxdze");
try{
	if (!(ls.equals("")))  kjxdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿɽ�С���ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjdze");
try{
	if (!(ls.equals("")))  kjdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿɽӵ��ܶ�]����ת����������:"+e);
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
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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