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
	out.println("<BR>����[jssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("cbzj");
try{
	if (!(ls.equals("")))  cbzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cbzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϳɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycfzj");
try{
	if (!(ls.equals("")))  ycfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtfzj");
try{
	if (!(ls.equals("")))  qtfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtfzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kcfy");
try{
	if (!(ls.equals("")))  kcfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kcfy]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۳�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
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
	out.println("<BR>����[fk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
double kzbjbl=0;
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ������]����ת����������:"+e);
	return;
}
double kzbjje=0;
ls=request.getParameter("kzbjje");
try{
	if (!(ls.equals("")))  kzbjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ�����]����ת����������:"+e);
	return;
}
double qtkk=0;
ls=request.getParameter("qtkk");
try{
	if (!(ls.equals("")))  qtkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtkk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
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