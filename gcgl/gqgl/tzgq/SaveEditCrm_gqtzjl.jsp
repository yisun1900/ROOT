<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tzlx=null;
java.sql.Date tzsjd=null;
long tzts=0;
String gqtzyybm=null;
String tzyysm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
tzlx=cf.GB2Uni(request.getParameter("tzlx"));
ls=request.getParameter("tzsjd");
try{
	if (!(ls.equals("")))  tzsjd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzsjd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tzts");
try{
	if (!(ls.equals("")))  tzts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzts������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
gqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
tzyysm=cf.GB2Uni(request.getParameter("tzyysm"));
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
String djjlh=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_gqtzjl set tzlx=?,tzsjd=?,tzts=?,gqtzyybm=?,tzyysm=?,lrr=?,lrsj=?,lrdw=? ";
	ls_sql+=" where  (djjlh='"+djjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzlx);
	ps.setDate(2,tzsjd);
	ps.setLong(3,tzts);
	ps.setString(4,gqtzyybm);
	ps.setString(5,tzyysm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrdw);
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