<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khxx set zxjwbm=(select zxjwbm from dm_zxjwbm where  qd<crm_khxx.qye  and crm_khxx.qye<=zd)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ÐÞ¸Ä³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
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