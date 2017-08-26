<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ldlxbm=null;
String ldlxmc=null;
ldlxbm=cf.GB2Uni(request.getParameter("ldlxbm"));
ldlxmc=cf.GB2Uni(request.getParameter("ldlxmc"));
String whereldlxbm=null;
whereldlxbm=cf.GB2Uni(request.getParameter("whereldlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_ldlxbm set ldlxbm=?,ldlxmc=? ";
	ls_sql+=" where  (ldlxbm='"+whereldlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ldlxbm);
	ps.setString(2,ldlxmc);
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