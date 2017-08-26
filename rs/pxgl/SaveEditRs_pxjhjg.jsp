<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jhjg=null;
String bz=null;
jhjg=cf.GB2Uni(request.getParameter("jhjg"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepxjhbh=null;
wherepxjhbh=cf.GB2Uni(request.getParameter("wherepxjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_pxjhjg set bz=?,jhjg=? ";
	ls_sql+=" where  (pxjhbh='"+wherepxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);
	ps.setString(2,jhjg);

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