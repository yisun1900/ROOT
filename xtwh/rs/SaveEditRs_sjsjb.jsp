<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjsjb=null;
String sjsjbmc=null;
sjsjb=cf.GB2Uni(request.getParameter("sjsjb"));
sjsjbmc=cf.GB2Uni(request.getParameter("sjsjbmc"));
String wheresjsjb=null;
wheresjsjb=cf.GB2Uni(request.getParameter("wheresjsjb"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_sjsjb set sjsjb=?,sjsjbmc=? ";
	ls_sql+=" where  (sjsjb='"+wheresjsjb+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjsjb);
	ps.setString(2,sjsjbmc);
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