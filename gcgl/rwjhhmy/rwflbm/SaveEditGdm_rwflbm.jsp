<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String rwflbm=null;
String rwflmc=null;
String rwdl=null;
rwflbm=cf.GB2Uni(request.getParameter("rwflbm"));
rwflmc=cf.GB2Uni(request.getParameter("rwflmc"));
rwdl=cf.GB2Uni(request.getParameter("rwdl"));
String whererwflbm=null;
whererwflbm=cf.GB2Uni(request.getParameter("whererwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_rwflbm set rwflbm=?,rwflmc=?,rwdl=? ";
	ls_sql+=" where  (rwflbm='"+whererwflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rwflbm);
	ps.setString(2,rwflmc);
	ps.setString(3,rwdl);
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