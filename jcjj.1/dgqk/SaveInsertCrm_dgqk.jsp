<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String cpbm=null;
String clgw=null;
String pp=null;
String gys=null;
long sjfy=0;
java.sql.Date yazrq=null;
String lrr=null;
long sl=0;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
pp=cf.GB2Uni(request.getParameter("pp"));
gys=cf.GB2Uni(request.getParameter("gys"));
ls=request.getParameter("sjfy");
try{
	if (!(ls.equals("")))  sjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʷ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yazrq");
try{
	if (!(ls.equals("")))  yazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yazrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ��װ����]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_dgqk ( khbh,cpbm,clgw,pp,gys,sjfy,yazrq,lrr,lrsj,sl,bz,azbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,SYSDATE,?,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,cpbm);
	ps.setString(3,clgw);
	ps.setString(4,pp);
	ps.setString(5,gys);
	ps.setLong(6,sjfy);
	ps.setDate(7,yazrq);
	ps.setString(8,lrr);
	ps.setLong(9,sl);
	ps.setString(10,bz);
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>