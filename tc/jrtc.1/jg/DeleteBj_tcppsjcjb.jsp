<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tcsjflbm=null;
String ppmc=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
ppmc=cf.getParameter(request,"ppmc");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from bj_tcppsjcjb  ";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjjbbm1='"+bjjbbm1+"' and tcsjflbm='"+tcsjflbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>É¾³ýÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("É¾³ý³É¹¦£¡");
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