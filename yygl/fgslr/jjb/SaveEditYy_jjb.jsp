<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_jjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
double yy_jjbqntq=0;
double yy_jjbbyjh=0;
double yy_jjbylj=0;
double yy_jjbdmbylj=0;
double yy_jjbszjh=0;
double yy_jjbszwc=0;
double yy_jjbbzyj=0;
java.sql.Date yy_jjb_lrsj=null;
String yy_jjb_lrr=null;
ls=request.getParameter("zqs");
try{
	if (!(ls.equals("")))  zqs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
yy_jjb_ygmc=cf.GB2Uni(request.getParameter("yy_jjb_ygmc"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("yy_jjbqntq");
try{
	if (!(ls.equals("")))  yy_jjbqntq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbqntq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ȥ��ͬ���¶����Ĳ�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbbyjh");
try{
	if (!(ls.equals("")))  yy_jjbbyjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbbyjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���¼ƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbylj");
try{
	if (!(ls.equals("")))  yy_jjbylj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbylj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbdmbylj");
try{
	if (!(ls.equals("")))  yy_jjbdmbylj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbdmbylj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������汾���ۼƹ��̲�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbszjh");
try{
	if (!(ls.equals("")))  yy_jjbszjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbszjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ܼƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbszwc");
try{
	if (!(ls.equals("")))  yy_jjbszwc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbszwc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjbbzyj");
try{
	if (!(ls.equals("")))  yy_jjbbzyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjbbzyj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ԥ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_jjb_lrsj");
try{
	if (!(ls.equals("")))  yy_jjb_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_jjb_lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
yy_jjb_lrr=cf.GB2Uni(request.getParameter("yy_jjb_lrr"));
String wherezqs=null;
String whereyy_jjb_ygmc=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_jjb_ygmc=cf.GB2Uni(request.getParameter("whereyy_jjb_ygmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_jjb set zqs=?,yy_jjb_ygmc=?,ssbm=?,ssfgs=?,yy_jjbqntq=?,yy_jjbbyjh=?,yy_jjbylj=?,yy_jjbdmbylj=?,yy_jjbszjh=?,yy_jjbszwc=?,yy_jjbbzyj=?,yy_jjb_lrsj=?,yy_jjb_lrr=? ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_jjb_ygmc='"+whereyy_jjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_jjb_ygmc);
	ps.setString(3,ssbm);
	ps.setString(4,ssfgs);
	ps.setDouble(5,yy_jjbqntq);
	ps.setDouble(6,yy_jjbbyjh);
	ps.setDouble(7,yy_jjbylj);
	ps.setDouble(8,yy_jjbdmbylj);
	ps.setDouble(9,yy_jjbszjh);
	ps.setDouble(10,yy_jjbszwc);
	ps.setDouble(11,yy_jjbbzyj);
	ps.setDate(12,yy_jjb_lrsj);
	ps.setString(13,yy_jjb_lrr);
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