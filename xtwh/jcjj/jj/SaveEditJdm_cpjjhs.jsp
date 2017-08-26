<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpjjhsbm=null;
String cpjjhs=null;
String cpjjczbm=null;
cpjjhsbm=cf.GB2Uni(request.getParameter("cpjjhsbm"));
cpjjhs=cf.GB2Uni(request.getParameter("cpjjhs"));
cpjjczbm=cf.GB2Uni(request.getParameter("cpjjczbm"));
String wherecpjjhsbm=null;
wherecpjjhsbm=cf.GB2Uni(request.getParameter("wherecpjjhsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_cpjjhs set cpjjhsbm=?,cpjjhs=?,cpjjczbm=? ";
	ls_sql+=" where  (cpjjhsbm='"+wherecpjjhsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpjjhsbm);
	ps.setString(2,cpjjhs);
	ps.setString(3,cpjjczbm);
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