<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yqdyybm=null;
String yqdyymc=null;
yqdyybm=cf.GB2Uni(request.getParameter("yqdyybm"));
yqdyymc=cf.GB2Uni(request.getParameter("yqdyymc"));
String whereyqdyybm=null;
whereyqdyybm=cf.GB2Uni(request.getParameter("whereyqdyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_yqdyybm set yqdyybm=?,yqdyymc=? ";
	ls_sql+=" where  (yqdyybm='"+whereyqdyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yqdyybm);
	ps.setString(2,yqdyymc);
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