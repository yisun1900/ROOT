<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdlxbm=null;
String jdlxmc=null;
jdlxbm=cf.GB2Uni(request.getParameter("jdlxbm"));
jdlxmc=cf.GB2Uni(request.getParameter("jdlxmc"));
String wherejdlxbm=null;
wherejdlxbm=cf.GB2Uni(request.getParameter("wherejdlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jdlxbm set jdlxbm=?,jdlxmc=? ";
	ls_sql+=" where  (jdlxbm='"+wherejdlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdlxbm);
	ps.setString(2,jdlxmc);
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