<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sshybm=null;
String sshymc=null;
sshybm=cf.GB2Uni(request.getParameter("sshybm"));
sshymc=cf.GB2Uni(request.getParameter("sshymc"));
String wheresshybm=null;
wheresshybm=cf.GB2Uni(request.getParameter("wheresshybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_sshybm set sshybm=?,sshymc=? ";
	ls_sql+=" where  (sshybm='"+wheresshybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sshybm);
	ps.setString(2,sshymc);
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