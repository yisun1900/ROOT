<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdjg=null;
String clqk=null;
String wxr=null;
java.sql.Date wxlrsj=null;
java.sql.Date wcsj=null;
double wxfy=0;
String clzt=null;
String wxbm=null;
jdjg=cf.GB2Uni(request.getParameter("jdjg"));
clqk=cf.GB2Uni(request.getParameter("clqk"));
wxr=cf.GB2Uni(request.getParameter("wxr"));
ls=request.getParameter("wxlrsj");
try{
	if (!(ls.equals("")))  wxlrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxlrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά��¼��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxfy");
try{
	if (!(ls.equals("")))  wxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά�޷���]����ת����������:"+e);
	return;
}
clzt=cf.GB2Uni(request.getParameter("clzt"));
wxbm=cf.GB2Uni(request.getParameter("wxbm"));
String wherebxxh=null;
wherebxxh=cf.GB2Uni(request.getParameter("wherebxxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update xz_dnsbbxsq set jdjg=?,clqk=?,wxr=?,wxlrsj=?,wcsj=?,wxfy=?,clzt=?,wxbm=? ";
	ls_sql+=" where  (bxxh="+wherebxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdjg);
	ps.setString(2,clqk);
	ps.setString(3,wxr);
	ps.setDate(4,wxlrsj);
	ps.setDate(5,wcsj);
	ps.setDouble(6,wxfy);
	ps.setString(7,clzt);
	ps.setString(8,wxbm);
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