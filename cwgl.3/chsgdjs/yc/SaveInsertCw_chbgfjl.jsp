<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgfjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
bgfjlh=cf.GB2Uni(request.getParameter("bgfjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));


java.sql.Date bfrq=null;
double bfbl=0;
double bfje=0;
ls=request.getParameter("bfrq");
try{
	if (!(ls.equals("")))  bfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bfbl");
try{
	if (!(ls.equals("")))  bfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bfje");
try{
	if (!(ls.equals("")))  bfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}

double qye=0;
double zhhtzcbj=0;
double ssk=0;
double yfgf=0;
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qye]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhhtzcbj");
try{
	if (!(ls.equals("")))  zhhtzcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhhtzcbj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ssk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ�����]����ת����������:"+e);
	return;
}


String lx=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;

lx=cf.GB2Uni(request.getParameter("lx"));
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





Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lx);
	ps.setString(2,bgfjlh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="insert into cw_chbgfjl (bgfjlh,khbh,sgd,sgbz,qye,zhhtzcbj,ssk,yfgf,bfrq,bfbl,bfje,lx,lrr,lrsj,lrbm,bz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgfjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDouble(5,qye);
	ps.setDouble(6,zhhtzcbj);
	ps.setDouble(7,ssk);
	ps.setDouble(8,yfgf);
	ps.setDate(9,bfrq);
	ps.setDouble(10,bfbl);
	ps.setDouble(11,bfje);
	ps.setString(12,lx);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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