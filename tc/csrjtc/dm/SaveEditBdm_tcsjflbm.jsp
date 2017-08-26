<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tcsjflbm=null;
String tcsjflmc=null;
tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
tcsjflmc=cf.GB2Uni(request.getParameter("tcsjflmc"));
String wheretcsjflbm=null;
wheretcsjflbm=cf.GB2Uni(request.getParameter("wheretcsjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_tcsjflbm set tcsjflbm=?,tcsjflmc=? ";
	ls_sql+=" where  (tcsjflbm='"+wheretcsjflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tcsjflbm);
	ps.setString(2,tcsjflmc);
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