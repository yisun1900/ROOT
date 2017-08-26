<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tgyybm=null;
String tgyymc=null;
tgyybm=cf.GB2Uni(request.getParameter("tgyybm"));
tgyymc=cf.GB2Uni(request.getParameter("tgyymc"));
String wheretgyybm=null;
wheretgyybm=cf.GB2Uni(request.getParameter("wheretgyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_tgyybm set tgyybm=?,tgyymc=? ";
	ls_sql+=" where  (tgyybm='"+wheretgyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tgyybm);
	ps.setString(2,tgyymc);
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