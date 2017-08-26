<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wgjbbm=null;
String xzzwbm=null;
wgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
String wherewgjbbm=null;
String wherexzzwbm=null;
wherewgjbbm=cf.GB2Uni(request.getParameter("wherewgjbbm"));
wherexzzwbm=cf.GB2Uni(request.getParameter("wherexzzwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_cfry set wgjbbm=?,xzzwbm=? ";
	ls_sql+=" where  (wgjbbm='"+wherewgjbbm+"') and  (xzzwbm='"+wherexzzwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wgjbbm);
	ps.setString(2,xzzwbm);
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