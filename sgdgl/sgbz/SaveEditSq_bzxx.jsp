<%@ page contentType="text/html;charset=gbk" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bzmc=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String bz=null;
bzmc=cf.GB2Uni(request.getParameter("bzmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
dh=cf.GB2Uni(request.getParameter("dh"));
zz=cf.GB2Uni(request.getParameter("zz"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
int grsl=0;
ls=request.getParameter("grsl");
try{
	if (!(ls.equals("")))  grsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����grsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
int yygrsl=0;
ls=request.getParameter("yygrsl");
try{
	if (!(ls.equals("")))  yygrsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yygrsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ù�������]����ת����������:"+e);
	return;
}
int kygrsl=0;
ls=request.getParameter("kygrsl");
try{
	if (!(ls.equals("")))  kygrsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kygrsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ù�������]����ת����������:"+e);
	return;
}
String tdbz=cf.GB2Uni(request.getParameter("tdbz"));

int zxzsgds=0;
ls=request.getParameter("zxzsgds");
try{
	if (!(ls.equals("")))  zxzsgds=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zxzsgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[��С��ʩ������]����ת����������:"+e);
	return;
}
int zdzsgds=0;
ls=request.getParameter("zdzsgds");
try{
	if (!(ls.equals("")))  zdzsgds=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdzsgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ʩ������]����ת����������:"+e);
	return;
}

double kjdzxz=0;
ls=request.getParameter("kjdzxz");
try{
	if (!(ls.equals("")))  kjdzxz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdzxz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɽӵ���Сֵ]����ת����������:"+e);
	return;
}
double kjdzdz=0;
ls=request.getParameter("kjdzdz");
try{
	if (!(ls.equals("")))  kjdzdz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdzdz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɽӵ����ֵ]����ת����������:"+e);
	return;
}
java.sql.Date rzsj=null;
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְʱ��]����ת����������:"+e);
	return;
}
java.sql.Date lzsj=null;
ls=request.getParameter("lzsj");
try{
	if (!(ls.equals("")))  lzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְʱ��]����ת����������:"+e);
	return;
}

String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String jjlxrdh=cf.GB2Uni(request.getParameter("jjlxrdh"));
String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
String sfqldht=cf.GB2Uni(request.getParameter("sfqldht"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));


String wherebzmc=cf.GB2Uni(request.getParameter("wherebzmc"));
String wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="update sq_bzxx set bzmc=?,xb=?,dh=?,zz=?,sfzh=?,bz=?,sgdjbbm=?,grsl=?,tdbz=?,zxzsgds=?,zdzsgds=?,kjdzxz=?,kjdzdz=?,jjlxr=?,jjlxrdh=?,jjlxrdz=?,sfqldht=?,yygrsl=?,kygrsl=?,rzsj=?,lzsj=?,sgd=?";
	ls_sql+=" where  (bzmc='"+wherebzmc+"' and sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bzmc);
	ps.setString(2,xb);
	ps.setString(3,dh);
	ps.setString(4,zz);
	ps.setString(5,sfzh);
	ps.setString(6,bz);
	ps.setString(7,sgdjbbm);
	ps.setInt(8,grsl);
	ps.setString(9,tdbz);
	ps.setInt(10,zxzsgds);
	ps.setInt(11,zdzsgds);
	ps.setDouble(12,kjdzxz);
	ps.setDouble(13,kjdzdz);
	ps.setString(14,jjlxr);
	ps.setString(15,jjlxrdh);
	ps.setString(16,jjlxrdz);
	ps.setString(17,sfqldht);
	ps.setInt(18,yygrsl);
	ps.setInt(19,kygrsl);
	ps.setDate(20,rzsj);
	ps.setDate(21,lzsj);
	ps.setString(22,sgd);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_sgd set bzs=(select count(*) from sq_bzxx where sgd='"+sgd+"')";
	ls_sql+=" where sgd='"+sgd+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_sgd set bzs=(select count(*) from sq_bzxx where sgd='"+wheresgd+"')";
	ls_sql+=" where sgd='"+wheresgd+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>