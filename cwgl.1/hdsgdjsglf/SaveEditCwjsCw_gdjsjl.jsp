<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));

double glf=0;
double clf=0;
double zgclf=0;
double sj=0;
double ksdf=0;

double kwxf=0;
double jkje=0;
double fakuan=0;
double kqtk=0;
double gdjskze=0;
double sqgz=0;


ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zgclf");
try{
	if (!(ls.equals("")))  zgclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zgclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Թ����Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sj");
try{
	if (!(ls.equals("")))  sj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sj������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ksdf");
try{
	if (!(ls.equals("")))  ksdf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ksdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ˮ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("kwxf");
try{
	if (!(ls.equals("")))  kwxf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kwxf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ά�޷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("fakuan");
try{
	if (!(ls.equals("")))  fakuan=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fakuan������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kqtk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}

ls=request.getParameter("gdjskze");
try{
	if (!(ls.equals("")))  gdjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gdjskze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ӽ�����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqgz");
try{
	if (!(ls.equals("")))  sqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sqgz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰ǰ����]����ת����������:"+e);
	return;
}


String cwjsr=null;
java.sql.Date cwjssj=null;
String jsdw=null;
String cwjssm=null;
cwjsr=cf.GB2Uni(request.getParameter("cwjsr"));
ls=request.getParameter("cwjssj");
try{
	if (!(ls.equals("")))  cwjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
cwjssm=cf.GB2Uni(request.getParameter("cwjssm"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	ls_sql="select jsjd,spjl";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjd=cf.fillNull(rs.getString("jsjd"));
		spjl=cf.fillNull(rs.getString("spjl"));
	}
	rs.close();
	ps.close();

	if (!jsjd.equals("3"))//1�����㲿���㣻2������������3���������
	{
		out.println("���󣡲���δ����");
		return;
	}

	ls_sql="update cw_gdjsjl set glf=?,clf=?,zgclf=?,sj=?,ksdf=?,gdjskze=?,kwxf=?,jkje=?,fakuan=?,kqtk=?,sqgz=?,cwjsr=?,cwjssj=?,cwjssm=?,jsjd='3' ";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,glf);
	ps.setDouble(2,clf);
	ps.setDouble(3,zgclf);
	ps.setDouble(4,sj);
	ps.setDouble(5,ksdf);
	ps.setDouble(6,gdjskze);
	ps.setDouble(7,kwxf);
	ps.setDouble(8,jkje);
	ps.setDouble(9,fakuan);
	ps.setDouble(10,kqtk);
	ps.setDouble(11,sqgz);
	ps.setString(12,cwjsr);
	ps.setDate(13,cwjssj);
	ps.setString(14,cwjssm);

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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>