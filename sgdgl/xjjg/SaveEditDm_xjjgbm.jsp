<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjjgbm=null;
String xjjgmc=null;
xjjgbm=cf.GB2Uni(request.getParameter("xjjgbm"));
xjjgmc=cf.GB2Uni(request.getParameter("xjjgmc"));
String wherexjjgbm=null;
wherexjjgbm=cf.GB2Uni(request.getParameter("wherexjjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_xjjgbm set xjjgbm=?,xjjgmc=? ";
	ls_sql+=" where  (xjjgbm='"+wherexjjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjjgbm);
	ps.setString(2,xjjgmc);
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