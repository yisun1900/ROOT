<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfw=null;
String ssfwmc=null;
ssfw=cf.GB2Uni(request.getParameter("ssfw"));
ssfwmc=cf.GB2Uni(request.getParameter("ssfwmc"));
String wheressfw=null;
wheressfw=cf.GB2Uni(request.getParameter("wheressfw"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_ssfw set ssfw=?,ssfwmc=? ";
	ls_sql+=" where  (ssfw='"+wheressfw+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfw);
	ps.setString(2,ssfwmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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