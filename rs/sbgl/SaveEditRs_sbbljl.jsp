<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shbxh=null;
java.sql.Date sbblsj=null;

String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String jbxdd=null;
double sbzrjs=0;
double yjsxe=0;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
double gsjgjj=0;
double grjgjj=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
shbxh=cf.GB2Uni(request.getParameter("shbxh"));
ls=request.getParameter("sbblsj");
try{
	if (!(ls.equals("")))  sbblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbblsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�籣����ʱ��]����ת����������:"+e);
	return;
}

ylbx=cf.GB2Uni(request.getParameter("ylbx"));
jylbx=cf.GB2Uni(request.getParameter("jylbx"));
sybx=cf.GB2Uni(request.getParameter("sybx"));
gsby=cf.GB2Uni(request.getParameter("gsby"));
syx=cf.GB2Uni(request.getParameter("syx"));
jbxdd=cf.GB2Uni(request.getParameter("jbxdd"));
ls=request.getParameter("sbzrjs");
try{
	if (!(ls.equals("")))  sbzrjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbzrjs������");
	return;
}
catch (Exception e){
	out.println("<BR>[ת�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjsxe");
try{
	if (!(ls.equals("")))  yjsxe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjsxe������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ɻ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gsjbfe");
try{
	if (!(ls.equals("")))  gsjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsjbfe������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�����Ѷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("grjbfe");
try{
	if (!(ls.equals("")))  grjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����grjbfe������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˽����Ѷ�]����ת����������:"+e);
	return;
}
sfjgjj=cf.GB2Uni(request.getParameter("sfjgjj"));
ls=request.getParameter("gsjgjj");
try{
	if (!(ls.equals("")))  gsjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsjgjj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾��ס��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("grjgjj");
try{
	if (!(ls.equals("")))  grjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����grjgjj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˽�ס��������]����ת����������:"+e);
	return;
}
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
double jndbtc=0;
ls=request.getParameter("jndbtc");
try{
	if (!(ls.equals("")))  jndbtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jndbtc������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ɴ�ͳ��]����ת����������:"+e);
	return;
}

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String sbbljlh=cf.GB2Uni(request.getParameter("sbbljlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getsbbljlh="";
	ls_sql="select sbbljlh";
	ls_sql+=" from  rs_ygsbxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getsbbljlh=cf.fillNull(rs.getString("sbbljlh"));
	}
	rs.close();
	ps.close();

	if (!getsbbljlh.equals(sbbljlh))
	{
		out.println("����ֻ���޸����¼�¼�����籣�����¼�š��Ѹı�Ϊ��"+getsbbljlh);
		return;
	}

	conn.setAutoCommit(false);
	
	ls_sql="update rs_sbbljl set shbxh=?,sbblsj=?,ylbx=?,jylbx=?,sybx=?,gsby=?,syx=?,jbxdd=?,sbzrjs=?,yjsxe=?  ,gsjbfe=?,grjbfe=?,sfjgjj=?,gsjgjj=?,grjgjj=?,lrr=?,lrsj=?,lrbm=?,bz=?,jndbtc=? ";
	ls_sql+=" where sbbljlh='"+sbbljlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbxh);
	ps.setDate(2,sbblsj);
	ps.setString(3,ylbx);
	ps.setString(4,jylbx);
	ps.setString(5,sybx);
	ps.setString(6,gsby);
	ps.setString(7,syx);
	ps.setString(8,jbxdd);
	ps.setDouble(9,sbzrjs);
	ps.setDouble(10,yjsxe);

	ps.setDouble(11,gsjbfe);
	ps.setDouble(12,grjbfe);
	ps.setString(13,sfjgjj);
	ps.setDouble(14,gsjgjj);
	ps.setDouble(15,grjgjj);
	ps.setString(16,lrr);
	ps.setDate(17,lrsj);
	ps.setString(18,lrbm);
	ps.setString(19,bz);
	ps.setDouble(20,jndbtc);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_ygsbxx set shbxh=?,sbblsj=?,ylbx=?,jylbx=?,sybx=?,gsby=?,syx=?,jbxdd=?,sbzrjs=?,yjsxe=?  ,gsjbfe=?,grjbfe=?,sfjgjj=?,gsjgjj=?,grjgjj=?,jndbtc=?";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbxh);
	ps.setDate(2,sbblsj);
	ps.setString(3,ylbx);
	ps.setString(4,jylbx);
	ps.setString(5,sybx);
	ps.setString(6,gsby);
	ps.setString(7,syx);
	ps.setString(8,jbxdd);
	ps.setDouble(9,sbzrjs);
	ps.setDouble(10,yjsxe);

	ps.setDouble(11,gsjbfe);
	ps.setDouble(12,grjbfe);
	ps.setString(13,sfjgjj);
	ps.setDouble(14,gsjgjj);
	ps.setDouble(15,grjgjj);
	ps.setDouble(16,jndbtc);
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
	out.print("<BR>����:" + e);
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