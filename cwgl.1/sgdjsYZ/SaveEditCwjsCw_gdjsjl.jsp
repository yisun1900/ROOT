<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
String jzbz=null;
double wdzgce=0;
double qye=0;
double zkl=0;
double zjxje=0;
double khjskze=0;
double khsskze=0;
double sjcb=0;
double sj=0;
String sptdjs=null;
double glftd=0;
double glf=0;
double wxjbfb=0;
double wxj=0;
double clf=0;
double zgclf=0;
double jkje=0;
double fakuan=0;
double kwxf=0;
double gckk=0;
double ksdf=0;
double kqtk=0;
double bk=0;
double gdjskze=0;
String cwjsr=null;
java.sql.Date cwjssj=null;
String jsdw=null;
String cwjssm=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
jzbz=cf.GB2Uni(request.getParameter("jzbz"));
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ���۹��̶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qye������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjskze");
try{
	if (!(ls.equals("")))  khjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khjskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khsskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�տ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjcb");
try{
	if (!(ls.equals("")))  sjcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʳɱ�]����ת����������:"+e);
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
sptdjs=cf.GB2Uni(request.getParameter("sptdjs"));
ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glftd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("wxjbfb");
try{
	if (!(ls.equals("")))  wxjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxjbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�޽�ٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxj");
try{
	if (!(ls.equals("")))  wxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�޽�]����ת����������:"+e);
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
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gckk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̿ۿ�]����ת����������:"+e);
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
ls=request.getParameter("bk");
try{
	if (!(ls.equals("")))  bk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bk������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}

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

double hbssk=0;
double tdjsje=0;
ls=request.getParameter("hbssk");
try{
	if (!(ls.equals("")))  hbssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hbssk������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ŀʵ�տ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tdjsje");
try{
	if (!(ls.equals("")))  tdjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sptdjsje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}


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

	//������������˰�𣭹���ѣ����Ϸѣ��������Թ���-���̿ۿ�-��ˮ��ѣ�����
	gdjskze=tdjsje-sj-glf-clf-zgclf-sgdfy-ksdf+bk;

	//˰ǰ���ʣ����ӽ�����ܶ���������������-��ά�޷ѣ�ά�޽�
	double sqgz=gdjskze-jkje-kqtk-fakuan-kwxf-wxj;

	
	conn.setAutoCommit(false);


	ls_sql="update crm_khxx set zkl=?,khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zkl);
	ps.setDouble(2,khjskze);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_gdjsjl set kwxf=?,sj=?,clf=?,zgclf=?,jkje=?,fakuan=?,kqtk=?,ksdf=?,glf=?,gdjskze=?,sqgz=?,cwjsr=?,cwjssj=?,cwjssm=?,jsjd='3' ";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,kwxf);
	ps.setDouble(2,sj);
	ps.setDouble(3,clf);
	ps.setDouble(4,zgclf);
	ps.setDouble(5,jkje);
	ps.setDouble(6,fakuan);
	ps.setDouble(7,kqtk);
	ps.setDouble(8,ksdf);
	ps.setDouble(9,glf);
	ps.setDouble(10,gdjskze);
	ps.setDouble(11,sqgz);
	ps.setString(12,cwjsr);
	ps.setDate(13,cwjssj);
	ps.setString(14,cwjssm);

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
	out.print("����ʧ��,��������: " + e);
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