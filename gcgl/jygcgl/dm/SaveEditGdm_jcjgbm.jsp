<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jcjgbm=null;
String jcjgmc=null;
jcjgbm=cf.GB2Uni(request.getParameter("jcjgbm"));
jcjgmc=cf.GB2Uni(request.getParameter("jcjgmc"));
String wherejcjgbm=null;
wherejcjgbm=cf.GB2Uni(request.getParameter("wherejcjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_jcjgbm set jcjgbm=?,jcjgmc=? ";
	ls_sql+=" where  (jcjgbm='"+wherejcjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcjgbm);
	ps.setString(2,jcjgmc);
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