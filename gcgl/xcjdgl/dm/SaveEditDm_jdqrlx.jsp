<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdqrlx=null;
String jdqrlxmc=null;
jdqrlx=cf.GB2Uni(request.getParameter("jdqrlx"));
jdqrlxmc=cf.GB2Uni(request.getParameter("jdqrlxmc"));
String wherejdqrlx=null;
wherejdqrlx=cf.GB2Uni(request.getParameter("wherejdqrlx"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jdqrlx set jdqrlx=?,jdqrlxmc=? ";
	ls_sql+=" where  (jdqrlx='"+wherejdqrlx+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdqrlx);
	ps.setString(2,jdqrlxmc);
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