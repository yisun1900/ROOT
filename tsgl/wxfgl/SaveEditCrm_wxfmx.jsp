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
double zrfcdfy=0;
double sqyzfy=0;
double gscdfy=0;
double qtfcdfy=0;
String sfksj=null;
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
ls=request.getParameter("zrfcdfy");
try{
	if (!(ls.equals("")))  zrfcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrfcdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӳе�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqyzfy");
try{
	if (!(ls.equals("")))  sqyzfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqyzfy������");
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

String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsbz=null;
	String tsjlh=null;
	ls_sql="select jsbz,tsjlh";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where  (lrxh="+lrxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsbz=rs.getString("jsbz");
		tsjlh=rs.getString("tsjlh");
	}
	else{
		out.println("������ţ�"+lrxh+"������");
		return;
	}
	rs.close();
	ps.close();

	if (jsbz.equals("Y"))
	{
		out.println("������ţ�"+lrxh+"�ѽ��㣬�������޸�");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_wxfmx set wxrgf=?,wxcf=?,wxclf=?,wxzfy=?,zrfcdfy=?,sqyzfy=?,gscdfy=?,qtfcdfy=?,sfksj=?,fysm=?,lrr=?,lrsj=?  ";
	ls_sql+=" where lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wxrgf);
	ps.setDouble(2,wxcf);
	ps.setDouble(3,wxclf);
	ps.setDouble(4,wxzfy);
	ps.setDouble(5,zrfcdfy);
	ps.setDouble(6,sqyzfy);
	ps.setDouble(7,gscdfy);
	ps.setDouble(8,qtfcdfy);
	ps.setString(9,sfksj);
	ps.setString(10,fysm);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="select sum(wxrgf),sum(wxcf),sum(wxclf),sum(wxzfy),sum(zrfcdfy),sum(sqyzfy),sum(gscdfy),sum(qtfcdfy)";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxrgf=rs.getDouble(1);
		wxcf=rs.getDouble(2);
		wxclf=rs.getDouble(3);
		wxzfy=rs.getDouble(4);
		zrfcdfy=rs.getDouble(5);
		sqyzfy=rs.getDouble(6);
		gscdfy=rs.getDouble(7);
		qtfcdfy=rs.getDouble(8);
	}
	rs.close();
	ps.close();
	
	ls_sql="update crm_tsjl set wxrgf=?,wxcf=?,wxclf=?,wxzfy=?,zrfcdfy=?,sqyzfy=?,gscdfy=?,qtfcdfy=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wxrgf);
	ps.setDouble(2,wxcf);
	ps.setDouble(3,wxclf);
	ps.setDouble(4,wxzfy);
	ps.setDouble(5,zrfcdfy);
	ps.setDouble(6,sqyzfy);
	ps.setDouble(7,gscdfy);
	ps.setDouble(8,qtfcdfy);
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