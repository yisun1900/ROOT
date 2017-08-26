<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zczjxyybm=null;
String zczjxyymc=null;
zczjxyybm=cf.GB2Uni(request.getParameter("zczjxyybm"));
zczjxyymc=cf.GB2Uni(request.getParameter("zczjxyymc"));
String wherezczjxyybm=null;
wherezczjxyybm=cf.GB2Uni(request.getParameter("wherezczjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zczjxyybm set zczjxyybm=?,zczjxyymc=? ";
	ls_sql+=" where  (zczjxyybm='"+wherezczjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zczjxyybm);
	ps.setString(2,zczjxyymc);
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