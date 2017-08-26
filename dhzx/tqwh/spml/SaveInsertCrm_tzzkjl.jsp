<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=request.getParameter("khbh");
String mlspbz=request.getParameter("mlspbz");
String mlspyj=cf.GB2Uni(request.getParameter("mlspyj"));
String mlspr=null;
java.sql.Date mlspsj=null;

mlspr=cf.GB2Uni(request.getParameter("mlspr"));
ls=request.getParameter("mlspsj");
try{
	if (!(ls.equals("")))  mlspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[mlspsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

double rfsgcb=0;
ls=request.getParameter("rfsgcb");
try{
	if (!(ls.equals("")))  rfsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rfsgcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˸�ʩ���ɱ���]����ת����������:"+e);
	return;
}

double rfjz=0;
ls=request.getParameter("rfjz");
try{
	if (!(ls.equals("")))  rfjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rfjz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˸���ֵ]����ת����������:"+e);
	return;
}

double rfmll=0;
ls=request.getParameter("rfmll");
try{
	if (!(ls.equals("")))  rfmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rfmll]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˸�ë����]����ת����������:"+e);
	return;
}

double zcxse=0;
ls=request.getParameter("zcxse");
try{
	if (!(ls.equals("")))  zcxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcxse]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������۶�]����ת����������:"+e);
	return;
}

double zccb=0;
ls=request.getParameter("zccb");
try{
	if (!(ls.equals("")))  zccb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zccb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ĳɱ�]����ת����������:"+e);
	return;
}

double zcmll=0;
ls=request.getParameter("zcmll");
try{
	if (!(ls.equals("")))  zcmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcmll]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ë����]����ת����������:"+e);
	return;
}

double khmll=0;
ls=request.getParameter("khmll");
try{
	if (!(ls.equals("")))  khmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khmll]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�ë����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_zxkhxx set rfsgcb=?,rfjz=?,rfmll=?,zcxse=?,zccb=?,zcmll=?,khmll=?,mlspbz=?,mlspr=?,mlspsj=?,mlspyj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,rfsgcb);
	ps.setDouble(2,rfjz);
	ps.setDouble(3,rfmll);
	ps.setDouble(4,zcxse);
	ps.setDouble(5,zccb);
	ps.setDouble(6,zcmll);
	ps.setDouble(7,khmll);
	ps.setString(8,mlspbz);
	ps.setString(9,mlspr);
	ps.setDate(10,mlspsj);
	ps.setString(11,mlspyj);
	ps.executeUpdate();
	ps.close();


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
	out.print("<BR>����ʧ��,��������: " + e);
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