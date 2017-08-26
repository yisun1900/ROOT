<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String smmdbm=null;
String smmd=null;
smmdbm=cf.GB2Uni(request.getParameter("smmdbm"));
smmd=cf.GB2Uni(request.getParameter("smmd"));
String wheresmmdbm=null;
wheresmmdbm=cf.GB2Uni(request.getParameter("wheresmmdbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_smmd set smmdbm=?,smmd=? ";
	ls_sql+=" where  (smmdbm='"+wheresmmdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,smmdbm);
	ps.setString(2,smmd);
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