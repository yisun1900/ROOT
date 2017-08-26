<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gysbm=null;
String gysmc=null;
gysbm=cf.GB2Uni(request.getParameter("gysbm"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String wheregysbm=null;
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cl_gysbm set gysbm=?,gysmc=? ";
	ls_sql+=" where  (gysbm='"+wheregysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysbm);
	ps.setString(2,gysmc);
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
	out.print("Exception: " + e);
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