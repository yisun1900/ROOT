<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String damxbm=null;
String damxmc=null;
damxbm=cf.GB2Uni(request.getParameter("damxbm"));
damxmc=cf.GB2Uni(request.getParameter("damxmc"));
String wheredamxbm=null;
wheredamxbm=cf.GB2Uni(request.getParameter("wheredamxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_damxbm set damxbm=?,damxmc=? ";
	ls_sql+=" where  (damxbm='"+wheredamxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,damxbm);
	ps.setString(2,damxmc);
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