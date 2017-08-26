<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String scqxbm=null;
String scqxmc=null;
scqxbm=cf.GB2Uni(request.getParameter("scqxbm"));
scqxmc=cf.GB2Uni(request.getParameter("scqxmc"));
String wherescqxbm=null;
wherescqxbm=cf.GB2Uni(request.getParameter("wherescqxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_scqxbm set scqxbm=?,scqxmc=? ";
	ls_sql+=" where  (scqxbm='"+wherescqxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,scqxbm);
	ps.setString(2,scqxmc);
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