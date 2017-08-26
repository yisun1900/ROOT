<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcysbbh=null;
String bjjbbm=null;
gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wheregcysbbh=null;
String wherebjjbbm=null;
wheregcysbbh=cf.GB2Uni(request.getParameter("wheregcysbbh"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_bbjb set gcysbbh=?,bjjbbm=? ";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"') and  (bjjbbm='"+wherebjjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbh);
	ps.setString(2,bjjbbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>³ö´í:" + e);
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