<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
double sl=0;
double dpzk=0;
double dj=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dpzk");
try{
	if (!(ls.equals("")))  dpzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dpzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�ʵ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ͬ���Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����je������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ��ͬ���Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

String xzjg=cf.GB2Uni(request.getParameter("xzjg"));
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfyje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ѽ��]����ת����������:"+e);
	return;
}
double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
double cxhdje=0;
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
String sfzp=request.getParameter("sfzp");
double zsdj=0;
ls=request.getParameter("zsdj");
try{
	if (!(ls.equals("")))  zsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zsdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���͵���]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");
String xh=request.getParameter("xh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ���ͬ�����");
		return;
	}

	
	ls_sql="update jc_zcddmx set sl=?,dpzk=?,dj=?,zqje=?,je=?,ycf=?,zjhsl=?,zqzjhje=?,zjhje=?,zjhycf=?";
	ls_sql+=" ,zcpzwzbm=?,zcysbm=?,cxhdbz=?,bz=?,xzjg=?,qtfy=?,qtfyje=?,zjhqtfy=?,cxhdbl=?,cxhdje=? ";
	ls_sql+=" ,zjhcxhdje=?,lrr=?,lrsj=SYSDATE,sfzp=?,zsdj=? ";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sl);
	ps.setDouble(2,dpzk);
	ps.setDouble(3,dj);
	ps.setDouble(4,zqje);
	ps.setDouble(5,je);
	ps.setDouble(6,ycf);
	ps.setDouble(7,sl);
	ps.setDouble(8,zqje);
	ps.setDouble(9,je);
	ps.setDouble(10,ycf);

	ps.setString(11,zcpzwzbm);
	ps.setString(12,zcysbm);
	ps.setString(13,cxhdbz);
	ps.setString(14,bz);
	ps.setString(15,xzjg);
	ps.setString(16,qtfy);
	ps.setDouble(17,qtfyje);
	ps.setDouble(18,qtfyje);
	ps.setDouble(19,cxhdbl);
	ps.setDouble(20,cxhdje);

	ps.setDouble(21,cxhdje);
	ps.setString(22,yhmc);
	ps.setString(23,sfzp);
	ps.setDouble(24,zsdj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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