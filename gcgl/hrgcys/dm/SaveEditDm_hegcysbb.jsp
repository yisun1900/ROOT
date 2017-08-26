<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcysbbh=null;
String gcysbbmc=null;
String sfzybb=null;
String bz=null;
gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
gcysbbmc=cf.GB2Uni(request.getParameter("gcysbbmc"));
sfzybb=cf.GB2Uni(request.getParameter("sfzybb"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheregcysbbh=null;
wheregcysbbh=cf.GB2Uni(request.getParameter("wheregcysbbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_hegcysbb set gcysbbh=?,gcysbbmc=?,sfzybb=?,bz=? ";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbh);
	ps.setString(2,gcysbbmc);
	ps.setString(3,sfzybb);
	ps.setString(4,bz);
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