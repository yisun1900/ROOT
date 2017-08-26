<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from sq_sgcqxx where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()<1)
	{
		out.println("<BR>É¾³ýÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("É¾³ý³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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