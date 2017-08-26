<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ldhtlxbm=null;
String ldhtlx=null;
ldhtlxbm=cf.GB2Uni(request.getParameter("ldhtlxbm"));
ldhtlx=cf.GB2Uni(request.getParameter("ldhtlx"));
String whereldhtlxbm=null;
whereldhtlxbm=cf.GB2Uni(request.getParameter("whereldhtlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_ldhtlx set ldhtlxbm=?,ldhtlx=? ";
	ls_sql+=" where  (ldhtlxbm='"+whereldhtlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ldhtlxbm);
	ps.setString(2,ldhtlx);
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