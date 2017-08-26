<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lzyyflbm=null;
String lzyyflmc=null;
lzyyflbm=cf.GB2Uni(request.getParameter("lzyyflbm"));
lzyyflmc=cf.GB2Uni(request.getParameter("lzyyflmc"));
String wherelzyyflbm=null;
wherelzyyflbm=cf.GB2Uni(request.getParameter("wherelzyyflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_lzyyflbm set lzyyflbm=?,lzyyflmc=? ";
	ls_sql+=" where  (lzyyflbm='"+wherelzyyflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lzyyflbm);
	ps.setString(2,lzyyflmc);
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