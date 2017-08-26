<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zyrwbm=null;
String zyrwmc=null;
zyrwbm=cf.GB2Uni(request.getParameter("zyrwbm"));
zyrwmc=cf.GB2Uni(request.getParameter("zyrwmc"));
String wherezyrwbm=null;
wherezyrwbm=cf.GB2Uni(request.getParameter("wherezyrwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zyrwbm set zyrwbm=?,zyrwmc=? ";
	ls_sql+=" where  (zyrwbm='"+wherezyrwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zyrwbm);
	ps.setString(2,zyrwmc);
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