<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
java.sql.Date jsrq=null;
double htje=0;
double suijin=0;
double glf=0;
double gczxzq=0;
double gcjxzq=0;
double gcjse=0;

double jsbl=0;
double jsje=0;
double kzbjbl=0;
double kzb=0;
double gcglfk=0;
double gcqtfk=0;
double jsyfje=0;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[suijin]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[glf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gczxzq");
try{
	if (!(ls.equals("")))  gczxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gczxzq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcjxzq");
try{
	if (!(ls.equals("")))  gcjxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjxzq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̼���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcjse");
try{
	if (!(ls.equals("")))  gcjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjse]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̽����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�а��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ���ʱ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzb");
try{
	if (!(ls.equals("")))  kzb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcglfk");
try{
	if (!(ls.equals("")))  gcglfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcglfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̹�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcqtfk");
try{
	if (!(ls.equals("")))  gcqtfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcqtfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsyfje");
try{
	if (!(ls.equals("")))  jsyfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsyfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӧ�����]����ת����������:"+e);
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


lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


double clfk=0;
double llje=0;
double yfgck=0;
double ykgccf=0;
double qtkk=0;
double xcyxfy=0;
double clyf=0;

double gcsfje=0;
ls=request.getParameter("clfk");
try{
	if (!(ls.equals("")))  clfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������󴦷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("llje");
try{
	if (!(ls.equals("")))  llje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[llje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ⷿ���Ͻ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfgck");
try{
	if (!(ls.equals("")))  yfgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfgck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ����̿�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ykgccf");
try{
	if (!(ls.equals("")))  ykgccf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ykgccf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѿ۹��̴���]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtkk");
try{
	if (!(ls.equals("")))  qtkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtkk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xcyxfy");
try{
	if (!(ls.equals("")))  xcyxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xcyxfy]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ֳ�Ӫ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("clyf");
try{
	if (!(ls.equals("")))  clyf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����˷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcsfje");
try{
	if (!(ls.equals("")))  gcsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcsfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�����]����ת����������:"+e);
	return;
}
 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("7"))//7�������깤��������
	{
		out.println("���󣡽�����Ȳ���ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update sq_sgd set zbj=zbj+?";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,kzb);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set gdjsjd='8',gdjsjlh=?";//8:�깤����
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_sgdwgjsjlkb ( jsjlh,khbh,sgd,sgbz,htje,suijin,glf,gczxzq,gcjxzq,gcjse   ,jsbl,jsje,kzbjbl,kzb,gcglfk,gcqtfk,jsyfje,clfk,llje,yfgck  ,ykgccf,qtkk,xcyxfy,clyf,gcsfje,jsrq,lrr,lrsj,lrbm,bz,clzt) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDouble(5,htje);
	ps.setDouble(6,suijin);
	ps.setDouble(7,glf);
	ps.setDouble(8,gczxzq);
	ps.setDouble(9,gcjxzq);
	ps.setDouble(10,gcjse);

	ps.setDouble(11,jsbl);
	ps.setDouble(12,jsje);
	ps.setDouble(13,kzbjbl);
	ps.setDouble(14,kzb);
	ps.setDouble(15,gcglfk);
	ps.setDouble(16,gcqtfk);
	ps.setDouble(17,jsyfje);
	ps.setDouble(18,clfk);
	ps.setDouble(19,llje);
	ps.setDouble(20,yfgck);

	ps.setDouble(21,ykgccf);
	ps.setDouble(22,qtkk);
	ps.setDouble(23,xcyxfy);
	ps.setDouble(24,clyf);
	ps.setDouble(25,gcsfje);
	ps.setDate(26,jsrq);
	ps.setString(27,lrr);

	ps.setDate(28,lrsj);
	ps.setString(29,lrbm);
	ps.setString(30,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>