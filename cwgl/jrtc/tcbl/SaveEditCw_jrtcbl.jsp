<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
double clyzxftcbl=0;
String lrr=null;
java.sql.Date lrsj=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("dzsjftcbl");
try{
	if (!(ls.equals("")))  dzsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzsjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzzxftcbl");
try{
	if (!(ls.equals("")))  dzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wyzxftcbl");
try{
	if (!(ls.equals("")))  wyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlsjftcbl");
try{
	if (!(ls.equals("")))  khjlsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlsjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ��Ա��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlzxftcbl");
try{
	if (!(ls.equals("")))  khjlzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ��Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjssjftcbl");
try{
	if (!(ls.equals("")))  sjssjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjssjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjszxftcbl");
try{
	if (!(ls.equals("")))  sjszxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjszxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsycftcbl");
try{
	if (!(ls.equals("")))  sjsycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsycftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦԶ�̷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjzxftcbl");
try{
	if (!(ls.equals("")))  zjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjycftcbl");
try{
	if (!(ls.equals("")))  zjycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjycftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����Զ�̷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgzxftcbl");
try{
	if (!(ls.equals("")))  xqzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С������װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzzzxftcbl");
try{
	if (!(ls.equals("")))  xqzzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzzzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzyzxftcbl");
try{
	if (!(ls.equals("")))  xqzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgzxftcbl");
try{
	if (!(ls.equals("")))  wlyxzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ������װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxzyzxftcbl");
try{
	if (!(ls.equals("")))  yxzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӫ��רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzchzxftcbl");
try{
	if (!(ls.equals("")))  wzchzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzchzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�߻�װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wysjzxftcbl");
try{
	if (!(ls.equals("")))  wysjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wysjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ҳ���װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzcxyzxftcbl");
try{
	if (!(ls.equals("")))  wzcxyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzcxyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ����Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dhzyzxftcbl");
try{
	if (!(ls.equals("")))  dhzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dhzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�绰רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgyzxftcbl");
try{
	if (!(ls.equals("")))  wztgyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzxftcbl");
try{
	if (!(ls.equals("")))  sjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˾��װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("clyzxftcbl");
try{
	if (!(ls.equals("")))  clyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Աװ�޷���ɱ���]����ת����������:"+e);
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
String wherefgsbh=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jrtcbl set fgsbh=?,dzsjftcbl=?,dzzxftcbl=?,wyzxftcbl=?,khjlsjftcbl=?,khjlzxftcbl=?,sjssjftcbl=?,sjszxftcbl=?,sjsycftcbl=?,zjzxftcbl=?,zjycftcbl=?,xqzgzxftcbl=?,xqzzzxftcbl=?,xqzyzxftcbl=?,wlyxzgzxftcbl=?,yxzyzxftcbl=?,wzchzxftcbl=?,wysjzxftcbl=?,wzcxyzxftcbl=?,dhzyzxftcbl=?,wztgyzxftcbl=?,sjzxftcbl=?,clyzxftcbl=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setDouble(2,dzsjftcbl);
	ps.setDouble(3,dzzxftcbl);
	ps.setDouble(4,wyzxftcbl);
	ps.setDouble(5,khjlsjftcbl);
	ps.setDouble(6,khjlzxftcbl);
	ps.setDouble(7,sjssjftcbl);
	ps.setDouble(8,sjszxftcbl);
	ps.setDouble(9,sjsycftcbl);
	ps.setDouble(10,zjzxftcbl);
	ps.setDouble(11,zjycftcbl);
	ps.setDouble(12,xqzgzxftcbl);
	ps.setDouble(13,xqzzzxftcbl);
	ps.setDouble(14,xqzyzxftcbl);
	ps.setDouble(15,wlyxzgzxftcbl);
	ps.setDouble(16,yxzyzxftcbl);
	ps.setDouble(17,wzchzxftcbl);
	ps.setDouble(18,wysjzxftcbl);
	ps.setDouble(19,wzcxyzxftcbl);
	ps.setDouble(20,dhzyzxftcbl);
	ps.setDouble(21,wztgyzxftcbl);
	ps.setDouble(22,sjzxftcbl);
	ps.setDouble(23,clyzxftcbl);
	ps.setString(24,lrr);
	ps.setDate(25,lrsj);
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