<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbm=null;
String dwbh=null;
java.sql.Date khsj=null;
String khr=null;
double cw=0;
double ht=0;
double dmgl=0;
double wj=0;
double wpsb=0;
double bgyp=0;
double xcyp=0;
double gxbb=0;
double jk=0;
double kq=0;
double gzap=0;
double ts=0;
String khxh=null;
//�Զ��������
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(xh))+1,1)";
ls_sql2+=" from  xz_xzzlkhb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
khxh=cf.addZero(xh,7);

khbm=cf.GB2Uni(request.getParameter("khbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("khsj");
try{
	if (!(ls.equals("")))  khsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
khr=cf.GB2Uni(request.getParameter("khr"));
ls=request.getParameter("cw");
try{
	if (!(ls.equals("")))  cw=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cw������");
	return;
}
catch (Exception e){
	out.println("<BR>[����15��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ht");
try{
	if (!(ls.equals("")))  ht=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ht������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ10��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dmgl");
try{
	if (!(ls.equals("")))  dmgl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dmgl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������10��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wj");
try{
	if (!(ls.equals("")))  wj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ļ�5��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wpsb");
try{
	if (!(ls.equals("")))  wpsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wpsb������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�豸10]����ת����������:"+e);
	return;
}
ls=request.getParameter("bgyp");
try{
	if (!(ls.equals("")))  bgyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bgyp������");
	return;
}
catch (Exception e){
	out.println("<BR>[�칫��Ʒ5��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xcyp");
try{
	if (!(ls.equals("")))  xcyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xcyp������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ʒ5��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxbb");
try{
	if (!(ls.equals("")))  gxbb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxbb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����15��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jk");
try{
	if (!(ls.equals("")))  jk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���5��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kq");
try{
	if (!(ls.equals("")))  kq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kq������");
	return;
}
catch (Exception e){
	out.println("<BR>[����7��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gzap");
try{
	if (!(ls.equals("")))  gzap=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gzap������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������8��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ts");
try{
	if (!(ls.equals("")))  ts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ts������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ż���ԱͶ��5��]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into xz_xzzlkhb ( xh,dwbh,khsj,khr,cw,ht,dmgl,wj,wpsb,bgyp,xcyp,gxbb,jk,kq,gzap,ts,khbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxh);
	ps.setString(2,dwbh);
	ps.setDate(3,khsj);
	ps.setString(4,khr);
	ps.setDouble(5,cw);
	ps.setDouble(6,ht);
	ps.setDouble(7,dmgl);
	ps.setDouble(8,wj);
	ps.setDouble(9,wpsb);
	ps.setDouble(10,bgyp);
	ps.setDouble(11,xcyp);
	ps.setDouble(12,gxbb);
	ps.setDouble(13,jk);
	ps.setDouble(14,kq);
	ps.setDouble(15,gzap);
	ps.setDouble(16,ts);
	ps.setString(17,khbm);
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
	out.print("����ʧ��,��������: " + e);
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