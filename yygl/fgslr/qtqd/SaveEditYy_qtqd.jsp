<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String ssfgs=null;
long yy_qtqdkh_byjh=0;
long yy_qtqdkh_bylj=0;
long yy_qtqdkh_szjh=0;
long yy_qtqdkh_szwc=0;
long yy_qtqdkh_bzyj=0;
long yy_qtqddj_byjh=0;
long yy_qtqddj_bylj=0;
long yy_qtqddj_szjh=0;
long yy_qtqddj_szwc=0;
long yy_qtqddj_bzyj=0;
java.sql.Date yy_qtqd_lrsj=null;
String yy_qtqd_lrr=null;
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("yy_qtqdkh_byjh");
try{
	if (!(ls.equals("")))  yy_qtqdkh_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqdkh_byjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ��ͻ��������¼ƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqdkh_bylj");
try{
	if (!(ls.equals("")))  yy_qtqdkh_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqdkh_bylj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ��ͻ����������ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqdkh_szjh");
try{
	if (!(ls.equals("")))  yy_qtqdkh_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqdkh_szjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ��ͻ��������ܼƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqdkh_szwc");
try{
	if (!(ls.equals("")))  yy_qtqdkh_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqdkh_szwc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ��ͻ������������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqdkh_bzyj");
try{
	if (!(ls.equals("")))  yy_qtqdkh_bzyj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqdkh_bzyj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ��ͻ���������Ԥ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqddj_byjh");
try{
	if (!(ls.equals("")))  yy_qtqddj_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqddj_byjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ�����������¼ƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqddj_bylj");
try{
	if (!(ls.equals("")))  yy_qtqddj_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqddj_bylj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ�������������ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqddj_szjh");
try{
	if (!(ls.equals("")))  yy_qtqddj_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqddj_szjh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ�����������ܼƻ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqddj_szwc");
try{
	if (!(ls.equals("")))  yy_qtqddj_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqddj_szwc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ���������������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqddj_bzyj");
try{
	if (!(ls.equals("")))  yy_qtqddj_bzyj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqddj_bzyj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ������������Ԥ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yy_qtqd_lrsj");
try{
	if (!(ls.equals("")))  yy_qtqd_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yy_qtqd_lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
yy_qtqd_lrr=cf.GB2Uni(request.getParameter("yy_qtqd_lrr"));
String wherezqs=null;
String wheressfgs=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_qtqd set zqs=?,ssfgs=?,yy_qtqdkh_byjh=?,yy_qtqdkh_bylj=?,yy_qtqdkh_szjh=?,yy_qtqdkh_szwc=?,yy_qtqdkh_bzyj=?,yy_qtqddj_byjh=?,yy_qtqddj_bylj=?,yy_qtqddj_szjh=?,yy_qtqddj_szwc=?,yy_qtqddj_bzyj=?,yy_qtqd_lrr=?,yy_qtqd_lrsj=SYSDATE ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,ssfgs);
	ps.setLong(3,yy_qtqdkh_byjh);
	ps.setLong(4,yy_qtqdkh_bylj);
	ps.setLong(5,yy_qtqdkh_szjh);
	ps.setLong(6,yy_qtqdkh_szwc);
	ps.setLong(7,yy_qtqdkh_bzyj);
	ps.setLong(8,yy_qtqddj_byjh);
	ps.setLong(9,yy_qtqddj_bylj);
	ps.setLong(10,yy_qtqddj_szjh);
	ps.setLong(11,yy_qtqddj_szwc);
	ps.setLong(12,yy_qtqddj_bzyj);
	ps.setString(13,yy_qtqd_lrr);
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