<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String rcjclxbm=null;
String rcjclxmc=null;
rcjclxbm=cf.GB2Uni(request.getParameter("rcjclxbm"));
rcjclxmc=cf.GB2Uni(request.getParameter("rcjclxmc"));
String wherercjclxbm=null;
wherercjclxbm=cf.GB2Uni(request.getParameter("wherercjclxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_rcjclxbm set rcjclxbm=?,rcjclxmc=? ";
	ls_sql+=" where  (rcjclxbm='"+wherercjclxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rcjclxbm);
	ps.setString(2,rcjclxmc);
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