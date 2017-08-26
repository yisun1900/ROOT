<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjwtflbm=null;
String xjwtflmc=null;
xjwtflbm=cf.GB2Uni(request.getParameter("xjwtflbm"));
xjwtflmc=cf.GB2Uni(request.getParameter("xjwtflmc"));
String wherexjwtflbm=null;
wherexjwtflbm=cf.GB2Uni(request.getParameter("wherexjwtflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_xjwtflbm set xjwtflbm=?,xjwtflmc=? ";
	ls_sql+=" where  (xjwtflbm='"+wherexjwtflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjwtflbm);
	ps.setString(2,xjwtflmc);
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