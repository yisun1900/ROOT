<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ycdbh=null;
String khbh=null;
String ycflbm=null;
java.sql.Date ycfssj=null;
String zrr=null;
String ycqksm=null;
String fazdr=null;
java.sql.Date fazdsj=null;
java.sql.Date jhjjsj=null;
String jjfa=null;
String sjclr=null;
java.sql.Date sjclsj=null;
String sjclqk=null;
java.sql.Date wcsj=null;
String sfjj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ycdbh=cf.GB2Uni(request.getParameter("ycdbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ycflbm=cf.GB2Uni(request.getParameter("ycflbm"));
ls=request.getParameter("ycfssj");
try{
	if (!(ls.equals("")))  ycfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�쳣����ʱ��]����ת����������:"+e);
	return;
}
zrr=cf.GB2Uni(request.getParameter("zrr"));
ycqksm=cf.GB2Uni(request.getParameter("ycqksm"));
fazdr=cf.GB2Uni(request.getParameter("fazdr"));
ls=request.getParameter("fazdsj");
try{
	if (!(ls.equals("")))  fazdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fazdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ƶ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhjjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ����ʱ��]����ת����������:"+e);
	return;
}
jjfa=cf.GB2Uni(request.getParameter("jjfa"));
sjclr=cf.GB2Uni(request.getParameter("sjclr"));
ls=request.getParameter("sjclsj");
try{
	if (!(ls.equals("")))  sjclsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjclsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʴ���ʱ��]����ת����������:"+e);
	return;
}
sjclqk=cf.GB2Uni(request.getParameter("sjclqk"));
ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wcsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
sfjj=cf.GB2Uni(request.getParameter("sfjj"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String whereycdbh=null;
whereycdbh=cf.GB2Uni(request.getParameter("whereycdbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_ycgl set ycdbh=?,khbh=?,ycflbm=?,ycfssj=?,zrr=?,ycqksm=?,fazdr=?,fazdsj=?,jhjjsj=?,jjfa=?,sjclr=?,sjclsj=?,sjclqk=?,wcsj=?,sfjj=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (ycdbh='"+whereycdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ycdbh);
	ps.setString(2,khbh);
	ps.setString(3,ycflbm);
	ps.setDate(4,ycfssj);
	ps.setString(5,zrr);
	ps.setString(6,ycqksm);
	ps.setString(7,fazdr);
	ps.setDate(8,fazdsj);
	ps.setDate(9,jhjjsj);
	ps.setString(10,jjfa);
	ps.setString(11,sjclr);
	ps.setDate(12,sjclsj);
	ps.setString(13,sjclqk);
	ps.setDate(14,wcsj);
	ps.setString(15,sfjj);
	ps.setString(16,lrr);
	ps.setDate(17,lrsj);
	ps.setString(18,lrbm);
	ps.setString(19,bz);
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