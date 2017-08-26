<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String damxbm=null;
String damxmc=null;
String gdbz=null;
damxbm=cf.GB2Uni(request.getParameter("damxbm"));
damxmc=cf.GB2Uni(request.getParameter("damxmc"));
gdbz=cf.GB2Uni(request.getParameter("gdbz"));
String wheredamxbm=null;
wheredamxbm=cf.GB2Uni(request.getParameter("wheredamxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_damxbm set damxbm=?,damxmc=?,gdbz=? ";
	ls_sql+=" where  (damxbm='"+wheredamxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,damxbm);
	ps.setString(2,damxmc);
	ps.setString(3,gdbz);
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