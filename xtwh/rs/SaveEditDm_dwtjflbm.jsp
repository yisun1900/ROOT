<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwtjflbm=null;
String dwtjflmc=null;
dwtjflbm=cf.GB2Uni(request.getParameter("dwtjflbm"));
dwtjflmc=cf.GB2Uni(request.getParameter("dwtjflmc"));
String wheredwtjflbm=null;
wheredwtjflbm=cf.GB2Uni(request.getParameter("wheredwtjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_dwtjflbm set dwtjflbm=?,dwtjflmc=? ";
	ls_sql+=" where  (dwtjflbm='"+wheredwtjflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwtjflbm);
	ps.setString(2,dwtjflmc);
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