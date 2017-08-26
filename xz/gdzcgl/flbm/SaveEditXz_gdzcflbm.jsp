<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gdzcflbm=null;
String gdzcflmc=null;
gdzcflbm=cf.GB2Uni(request.getParameter("gdzcflbm"));
gdzcflmc=cf.GB2Uni(request.getParameter("gdzcflmc"));
String wheregdzcflbm=null;
wheregdzcflbm=cf.GB2Uni(request.getParameter("wheregdzcflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_gdzcflbm set gdzcflbm=?,gdzcflmc=? ";
	ls_sql+=" where  (gdzcflbm='"+wheregdzcflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gdzcflbm);
	ps.setString(2,gdzcflmc);
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