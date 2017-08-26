<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
String fkfabm=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
fkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
String wherefgsbh=null;
String wherefkfabm=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
wherefkfabm=cf.GB2Uni(request.getParameter("wherefkfabm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_fgsfkfa set fgsbh=?,fkfabm=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,fkfabm);
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