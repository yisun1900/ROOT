<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
long tccplbbm=0;
long tccpdlbm=0;
String sfyqxtpp=null;
String jldw=null;
double bzsl=0;
double bzmj=0;
double mtmzjmj=0;
double ccbfjj=0;
String sfkjm=null;
double jmdj=0;
double sjzj=0;
String lrr=null;
java.sql.Date lrsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
ls=request.getParameter("tccplbbm");
try{
	if (!(ls.equals("")))  tccplbbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tccplbbm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ƷС��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tccpdlbm");
try{
	if (!(ls.equals("")))  tccpdlbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tccpdlbm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ����]����ת����������:"+e);
	return;
}
sfyqxtpp=cf.GB2Uni(request.getParameter("sfyqxtpp"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("bzsl");
try{
	if (!(ls.equals("")))  bzsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bzsl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bzmj");
try{
	if (!(ls.equals("")))  bzmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bzmj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼���]����ת����������:"+e);
	return;
}
ls=request.getParameter("mtmzjmj");
try{
	if (!(ls.equals("")))  mtmzjmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[mtmzjmj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ccbfjj");
try{
	if (!(ls.equals("")))  ccbfjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ccbfjj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ּӼ�]����ת����������:"+e);
	return;
}
sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
ls=request.getParameter("jmdj");
try{
	if (!(ls.equals("")))  jmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jmdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ⵥ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۼ�]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
String wheredqbm=null;
String wherebjjbbm=null;
String wheretccplbbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wheretccplbbm=cf.GB2Uni(request.getParameter("wheretccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tc_mmjgb set dqbm=?,bjjbbm=?,tccplbbm=?,tccpdlbm=?,sfyqxtpp=?,jldw=?,bzsl=?,bzmj=?,mtmzjmj=?,ccbfjj=?,sfkjm=?,jmdj=?,sjzj=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setLong(3,tccplbbm);
	ps.setLong(4,tccpdlbm);
	ps.setString(5,sfyqxtpp);
	ps.setString(6,jldw);
	ps.setDouble(7,bzsl);
	ps.setDouble(8,bzmj);
	ps.setDouble(9,mtmzjmj);
	ps.setDouble(10,ccbfjj);
	ps.setString(11,sfkjm);
	ps.setDouble(12,jmdj);
	ps.setDouble(13,sjzj);
	ps.setString(14,lrr);
	ps.setDate(15,lrsj);
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