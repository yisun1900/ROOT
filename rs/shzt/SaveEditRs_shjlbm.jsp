<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shjl=null;
String shjlmc=null;
shjl=cf.GB2Uni(request.getParameter("shjl"));
shjlmc=cf.GB2Uni(request.getParameter("shjlmc"));
String whereshjl=null;
whereshjl=cf.GB2Uni(request.getParameter("whereshjl"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_shjlbm set shjl=?,shjlmc=? ";
	ls_sql+=" where  (shjl='"+whereshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shjlmc);
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