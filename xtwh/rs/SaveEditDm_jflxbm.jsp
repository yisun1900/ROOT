<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jflxbm=null;
String jflxmc=null;
String lx=null;
jflxbm=cf.GB2Uni(request.getParameter("jflxbm"));
jflxmc=cf.GB2Uni(request.getParameter("jflxmc"));
lx=cf.GB2Uni(request.getParameter("lx"));
String wherejflxbm=null;
wherejflxbm=cf.GB2Uni(request.getParameter("wherejflxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jflxbm set jflxbm=?,jflxmc=?,lx=? ";
	ls_sql+=" where  (jflxbm='"+wherejflxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jflxbm);
	ps.setString(2,jflxmc);
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