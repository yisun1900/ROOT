<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gqtzyybm=null;
String gqtzyymc=null;
String lx=null;
gqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
gqtzyymc=cf.GB2Uni(request.getParameter("gqtzyymc"));
lx=cf.GB2Uni(request.getParameter("lx"));
String wheregqtzyybm=null;
wheregqtzyybm=cf.GB2Uni(request.getParameter("wheregqtzyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gqtzyybm set gqtzyybm=?,gqtzyymc=?,lx=? ";
	ls_sql+=" where  (gqtzyybm='"+wheregqtzyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gqtzyybm);
	ps.setString(2,gqtzyymc);
	ps.setString(3,lx);
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