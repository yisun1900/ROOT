<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String zcmc=cf.GB2Uni(request.getParameter("zcmc"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
String jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String gg=cf.GB2Uni(request.getParameter("gg"));

double zqdj=0;
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰʵ������]����ת����������:"+e);
	return;
}
double dpzk=0;
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
double dj=0;
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

String zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
String zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));

double sl=0;
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
double zqje=0;
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
double je=0;
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
double ycf=0;
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
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
if (qtfy.equals("W"))
{
	qtfy="";
}
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

String cxhdbz=null;
String bz=null;
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

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

String sfycx=null;
sfycx=request.getParameter("sfycx");

String sxhtyy=cf.GB2Uni(request.getParameter("sxhtyy"));


String ddbh=request.getParameter("ddbh");
String xh=request.getParameter("xh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String sftjcp=request.getParameter("sftjcp");
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



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}

	double yjjrbl=0;
	ls_sql =" select yjjrbl";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjrbl=rs.getDouble("yjjrbl");
	}
	rs.close();
	ps.close();

	double zjyjjrje=cf.round(je*yjjrbl/100,2);

	conn.setAutoCommit(false);

	ls_sql ="update jc_zcddmx set zcmc=?,zcdlbm=?,zcxlbm=?,zclbbm=?,xinghao=?,gg=?,zcysbm=?,jldwbm=?,zqdj=?,dpzk=?   ,dj=?,qtfy=?,cxhdbl=?,zcpzwzbm=?,cxhdbz=?,sfycx=?,sxhtyy=?   ,bz=?,lrr=?,sftjcp=?,lrsj=SYSDATE,sfzp=?,zsdj=?";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcmc);
	ps.setString(2,zcdlbm);
	ps.setString(3,zcxlbm);
	ps.setString(4,zclbbm);
	ps.setString(5,xinghao);
	ps.setString(6,gg);
	ps.setString(7,zcysbm);
	ps.setString(8,jldwbm);
	ps.setDouble(9,zqdj);
	ps.setDouble(10,dpzk);

	ps.setDouble(11,dj);
	ps.setString(12,qtfy);
	ps.setDouble(13,cxhdbl);
	ps.setString(14,zcpzwzbm);
	ps.setString(15,cxhdbz);
	ps.setString(16,sfycx);
	ps.setString(17,sxhtyy);

	ps.setString(18,bz);
	ps.setString(19,yhmc);
	ps.setString(20,sftjcp);
	ps.setString(21,sfzp);
	ps.setDouble(22,zsdj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update jc_zczjxmx set zjsl=?,zqzjje=?,zjje=?,zjycf=?,zjqtfy=?,zjcxhdje=?,bz=?,zqsxdj=?,dpzkl=?,zhsxdj=?,zjyjjrje=?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sl);
	ps.setDouble(2,zqje);
	ps.setDouble(3,je);
	ps.setDouble(4,ycf);
	ps.setDouble(5,qtfyje);
	ps.setDouble(6,cxhdje);
	ps.setString(7,bz);
	ps.setDouble(8,zqdj);
	ps.setDouble(9,dpzk);
	ps.setDouble(10,dj);
	ps.setDouble(11,zjyjjrje);
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