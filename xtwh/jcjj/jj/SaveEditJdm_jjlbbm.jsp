<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjlbbm=null;
String jjlbmc=null;
jjlbbm=cf.GB2Uni(request.getParameter("jjlbbm"));
jjlbmc=cf.GB2Uni(request.getParameter("jjlbmc"));
String wherejjlbbm=null;
wherejjlbbm=cf.GB2Uni(request.getParameter("wherejjlbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjlbbm set jjlbbm=?,jjlbmc=? ";
	ls_sql+=" where  (jjlbbm='"+wherejjlbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjlbbm);
	ps.setString(2,jjlbmc);
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
	out.print("Exception: " + e);
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