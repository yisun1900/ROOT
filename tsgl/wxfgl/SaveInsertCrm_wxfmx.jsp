<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double cjcdfy=0;
double sgdcdfy=0;
double khcdfy=0;
double gscdfy=0;
double qtfcdfy=0;
String sfksj=null;
String sjbh=null;
String fysm=null;
ls=request.getParameter("wxrgf");
try{
	if (!(ls.equals("")))  wxrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxrgf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά���˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxcf");
try{
	if (!(ls.equals("")))  wxcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxcf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�޳���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxclf");
try{
	if (!(ls.equals("")))  wxclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�޲��Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxzfy");
try{
	if (!(ls.equals("")))  wxzfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxzfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά���ܷ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjcdfy");
try{
	if (!(ls.equals("")))  cjcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjcdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ҳе�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgdcdfy");
try{
	if (!(ls.equals("")))  sgdcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdcdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӳе�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khcdfy");
try{
	if (!(ls.equals("")))  khcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khcdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ���е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gscdfy");
try{
	if (!(ls.equals("")))  gscdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gscdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtfcdfy");
try{
	if (!(ls.equals("")))  qtfcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfcdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������е�����]����ת����������:"+e);
	return;
}
sfksj=cf.GB2Uni(request.getParameter("sfksj"));
sjbh=cf.GB2Uni(request.getParameter("sjbh"));
fysm=cf.GB2Uni(request.getParameter("fysm"));
String lrr=null;
java.sql.Date lrsj=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String gys=cf.GB2Uni(request.getParameter("gys"));
String wxdah=cf.GB2Uni(request.getParameter("wxdah"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_wxfmx ";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_wxfmx (tsjlh,khbh  ,wxrgf,wxcf,wxclf,wxzfy   ,cjcdfy,gys,sgdcdfy,sgd,khcdfy,gscdfy,qtfcdfy   ,sfksj,sjbh,fysm,wxdah,lrr,lrsj,jsbz )";
	ls_sql+=" values(?,?  ,?,?,?,?  ,?,?,?,?,?,?,?   ,?,?,?,?,?,?,'N')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,khbh);

	ps.setDouble(3,wxrgf);
	ps.setDouble(4,wxcf);
	ps.setDouble(5,wxclf);
	ps.setDouble(6,wxzfy);

	ps.setDouble(7,cjcdfy);
	ps.setString(8,gys);
	ps.setDouble(9,sgdcdfy);
	ps.setString(10,sgd);
	ps.setDouble(11,khcdfy);
	ps.setDouble(12,gscdfy);
	ps.setDouble(13,qtfcdfy);

	ps.setString(14,sfksj);
	ps.setString(15,sjbh);
	ps.setString(16,fysm);
	ps.setString(17,wxdah);
	ps.setString(18,lrr);
	ps.setDate(19,lrsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_tsjl set sffswxf='3',wxfze=?,wxdah=?,wxfsm=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wxzfy);
	ps.setString(2,wxdah);
	ps.setString(3,fysm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>