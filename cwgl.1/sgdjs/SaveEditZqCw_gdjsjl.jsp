<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


///////////////��������

String sgd=cf.GB2Uni(request.getParameter("sgd"));
String khlx=cf.GB2Uni(request.getParameter("khlx"));
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
double zkl=0;
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

double wdzgce=0;
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

double qye=0;
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
double zjxje=0;
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
double zhzjxje=0;
ls=request.getParameter("zhzjxje");
try{
	if (!(ls.equals("")))  zhzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zhzjxje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ���������]����ת����������:"+e);
	return;
}
double zqwgzj=0;
ls=request.getParameter("zqwgzj");
try{
	if (!(ls.equals("")))  zqwgzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqwgzj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ�깤���]����ת����������:"+e);
	return;
}
double zhwgzj=0;
ls=request.getParameter("zhwgzj");
try{
	if (!(ls.equals("")))  zhwgzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zhwgzj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ��깤���]����ת����������:"+e);
	return;
}
double khsskze=0;
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khsskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װʵ�տ��ܶ�]����ת����������:"+e);
	return;
}
double gdjskze=0;
ls=request.getParameter("gdjskze");
try{
	if (!(ls.equals("")))  gdjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdjskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ������]����ת����������:"+e);
	return;
}


///////////////���ۿ���Ŀ

double clf=0;
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
double bzclfbl=0;
ls=request.getParameter("bzclfbl");
try{
	if (!(ls.equals("")))  bzclfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tlk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼���Ϸѱ���]����ת����������:"+e);
	return;
}

double psgjgff=0;
ls=request.getParameter("psgjgff");
try{
	if (!(ls.equals("")))  psgjgff=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����psgjgff������");
	return;
}
catch (Exception e){
	out.println("<BR>[���͹��߹�����]����ת����������:"+e);
	return;
}
double ysf=0;
ls=request.getParameter("ysf");
try{
	if (!(ls.equals("")))  ysf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ysf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
double lbcb=0;
ls=request.getParameter("lbcb");
try{
	if (!(ls.equals("")))  lbcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lbcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ɱ�]����ת����������:"+e);
	return;
}
double kqtk=0;
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kqtk������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}

///////////////������

double jkje=0;
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǰ���Ѳ�����]����ת����������:"+e);
	return;
}
double sqgz=0;
ls=request.getParameter("sqgz");
try{
	if (!(ls.equals("")))  sqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ������]����ת����������:"+e);
	return;
}

String jslx=cf.GB2Uni(request.getParameter("jslx"));
String jsdw=cf.GB2Uni(request.getParameter("jsdw"));
String jsr=cf.GB2Uni(request.getParameter("jsr"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));

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

	if (!gdjsjd.equals("2"))//0��δ���㣻1���깤���㣻 2�����ڽ���
	{
		out.println("���󣡽���״̬����ȷ");
		return;
	}


	ls_sql="update cw_gdjsjl set gdjsjlh=?,khbh=?,sgd=?,khlx=?,cxhdbm=?,zkl=?,wdzgce=?,qye=?,zjxje=?,zhzjxje=? ";
	ls_sql+=" ,zqwgzj=?,zhwgzj=?,khsskze=?,gdjskze=?,clf=?,bzclfbl=?,psgjgff=? ";
	ls_sql+=" ,ysf=?,lbcb=?,kqtk=?,jkje=?,sqgz=? ";
	ls_sql+=" ,jslx=?,jsdw=?,jsr=?,jssj=?,bz=?";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gdjsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,khlx);
	ps.setString(5,cxhdbm);
	ps.setDouble(6,zkl);
	ps.setDouble(7,wdzgce);
	ps.setDouble(8,qye);
	ps.setDouble(9,zjxje);
	ps.setDouble(10,zhzjxje);

	ps.setDouble(11,zqwgzj);
	ps.setDouble(12,zhwgzj);
	ps.setDouble(13,khsskze);
	ps.setDouble(14,gdjskze);
	ps.setDouble(15,clf);
	ps.setDouble(16,bzclfbl);
	ps.setDouble(17,psgjgff);

	ps.setDouble(18,ysf);
	ps.setDouble(19,lbcb);
	ps.setDouble(20,kqtk);
	ps.setDouble(21,jkje);
	ps.setDouble(22,sqgz);

	ps.setString(23,jslx);
	ps.setString(24,jsdw);
	ps.setString(25,jsr);
	ps.setDate(26,jssj);
	ps.setString(27,bz);
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


