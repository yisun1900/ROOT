<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double jzssk=0;
double cxhddj=0;
double jrhdje=0;
double ybkje=0;
double yfkje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String blr=null;
java.sql.Date blsj=null;
ls=request.getParameter("jzssk");
try{
	if (!(ls.equals("")))  jzssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzssk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װʵ�տ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxhddj");
try{
	if (!(ls.equals("")))  cxhddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhddj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jrhdje");
try{
	if (!(ls.equals("")))  jrhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jrhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ybkje");
try{
	if (!(ls.equals("")))  ybkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ybkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ�����ۣ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfkje");
try{
	if (!(ls.equals("")))  yfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yfkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ������]����ת����������:"+e);
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
blr=cf.GB2Uni(request.getParameter("blr"));
ls=request.getParameter("blsj");
try{
	if (!(ls.equals("")))  blsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����blsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jcfkd set jzssk=?,cxhddj=?,jrhdje=?,ybkje=?,yfkje=?,lrr=?,lrsj=?,lrbm=?,bz=?,blr=?,blsj=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jzssk);
	ps.setDouble(2,cxhddj);
	ps.setDouble(3,jrhdje);
	ps.setDouble(4,ybkje);
	ps.setDouble(5,yfkje);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,blr);
	ps.setDate(11,blsj);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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