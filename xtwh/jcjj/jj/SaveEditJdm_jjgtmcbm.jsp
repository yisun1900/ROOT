<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjgtmcbm=null;
String jjgtmc=null;
String jjlbbm=null;
jjgtmcbm=cf.GB2Uni(request.getParameter("jjgtmcbm"));
jjgtmc=cf.GB2Uni(request.getParameter("jjgtmc"));
jjlbbm=cf.GB2Uni(request.getParameter("jjlbbm"));
String wherejjgtmcbm=null;
wherejjgtmcbm=cf.GB2Uni(request.getParameter("wherejjgtmcbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjgtmcbm set jjgtmcbm=?,jjgtmc=?,jjlbbm=? ";
	ls_sql+=" where  (jjgtmcbm='"+wherejjgtmcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjgtmcbm);
	ps.setString(2,jjgtmc);
	ps.setString(3,jjlbbm);
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