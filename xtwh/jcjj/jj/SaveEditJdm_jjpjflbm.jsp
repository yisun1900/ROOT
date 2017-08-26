<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjpjflbm=null;
String jjpjflmc=null;
jjpjflbm=cf.GB2Uni(request.getParameter("jjpjflbm"));
jjpjflmc=cf.GB2Uni(request.getParameter("jjpjflmc"));
String wherejjpjflbm=null;
wherejjpjflbm=cf.GB2Uni(request.getParameter("wherejjpjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjpjflbm set jjpjflbm=?,jjpjflmc=? ";
	ls_sql+=" where  (jjpjflbm='"+wherejjpjflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjpjflbm);
	ps.setString(2,jjpjflmc);
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