<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String skxs=null;
String kclx=null;
String pxjg=null;
String pxjs=null;
String pxcd=null;
String pxjhbh=null;

long pxrs=0;
double pxfy=0;
long gcrs=0;
long zcrs=0;
long jcrs=0;
long ypxrs=0;//rs_pxzjmx
double ypxfy=0;//rs_pxzjmx
long zpxrs=0;//rs_pxjhjg
double zpxfy=0;//rs_pxjhjg

java.sql.Date pxkssj=null;
java.sql.Date pxjssj=null;
String pxkc=null;
String kcnr=null;
String bz=null;
skxs=cf.GB2Uni(request.getParameter("skxs"));
kclx=cf.GB2Uni(request.getParameter("kclx"));
pxjg=cf.GB2Uni(request.getParameter("pxjg"));
pxjs=cf.GB2Uni(request.getParameter("pxjs"));
pxcd=cf.GB2Uni(request.getParameter("pxcd"));
ls=request.getParameter("pxrs");
try{
	if (!(ls.equals("")))  pxrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("pxfy");
try{
	if (!(ls.equals("")))  pxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcrs");
try{
	if (!(ls.equals("")))  gcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gcrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�߲�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zcrs");
try{
	if (!(ls.equals("")))  zcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�в�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jcrs");
try{
	if (!(ls.equals("")))  jcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jcrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("pxkssj");
try{
	if (!(ls.equals("")))  pxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ��ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("pxjssj");
try{
	if (!(ls.equals("")))  pxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ����ʱ��]����ת����������:"+e);
	return;
}
pxkc=cf.GB2Uni(request.getParameter("pxkc"));
kcnr=cf.GB2Uni(request.getParameter("kcnr"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepxmxbh=null;
wherepxmxbh=cf.GB2Uni(request.getParameter("wherepxmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

//rs_pxzjmx
	ls_sql="select pxrs,pxfy,pxjhbh ";
	ls_sql+=" from  rs_pxzjmx";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxjhbh=rs.getString("pxjhbh");
		ypxrs=rs.getLong("pxrs");
		ypxfy=rs.getDouble("pxfy");
	}
	rs.close();
	ps.close();
//rs_pxjhjg
	ls_sql="select sjpxrs,sjpxfy ";
	ls_sql+=" from  rs_pxjhjg";
	ls_sql+=" where  (pxjhbh='"+pxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpxrs=rs.getLong("sjpxrs");
		zpxfy=rs.getDouble("sjpxfy");
	}
	rs.close();
	ps.close();
//������޸���ϸ��ƻ�������ѵ��������ѵ����
	zpxrs+=pxrs-ypxrs;
	zpxfy+=pxfy-ypxfy;

	conn.setAutoCommit(false);

	ls_sql="update rs_pxjhjg set sjpxrs=?,sjpxfy=? ";
	ls_sql+=" where  (pxjhbh='"+pxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zpxrs);
	ps.setDouble(2,zpxfy);
	ps.executeUpdate();
	ps.close();
out.print(pxrs+"<br>");
out.print(pxfy);
	ls_sql="update rs_pxzjmx set skxs=?,kclx=?,pxjg=?,pxjs=?,pxcd=?,pxrs=?,pxfy=?,gcrs=?,zcrs=?,jcrs=?,pxkssj=?,pxjssj=?,pxkc=?,kcnr=?,bz=? ";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,skxs);
	ps.setString(2,kclx);
	ps.setString(3,pxjg);
	ps.setString(4,pxjs);
	ps.setString(5,pxcd);
	ps.setLong(6,pxrs);
	ps.setDouble(7,pxfy);
	ps.setLong(8,gcrs);
	ps.setLong(9,zcrs);
	ps.setLong(10,jcrs);
	ps.setDate(11,pxkssj);
	ps.setDate(12,pxjssj);
	ps.setString(13,pxkc);
	ps.setString(14,kcnr);
	ps.setString(15,bz);
	ps.executeUpdate();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ�!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e+ls_sql	 );
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>