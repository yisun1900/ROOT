<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hwbh=null;
String hwmc=null;
String hjbh=null;
hwbh=cf.GB2Uni(request.getParameter("hwbh"));
hwmc=cf.GB2Uni(request.getParameter("hwmc"));
hjbh=cf.GB2Uni(request.getParameter("hjbh"));
String wherehwbh=null;
wherehwbh=cf.GB2Uni(request.getParameter("wherehwbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_hwmc set hwbh=?,hwmc=?,hjbh=? ";
	ls_sql+=" where  (hwbh='"+wherehwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hwbh);
	ps.setString(2,hwmc);
	ps.setString(3,hjbh);
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