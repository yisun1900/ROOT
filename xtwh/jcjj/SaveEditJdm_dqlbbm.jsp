<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqlbbm=null;
String dqlbmc=null;
dqlbbm=cf.GB2Uni(request.getParameter("dqlbbm"));
dqlbmc=cf.GB2Uni(request.getParameter("dqlbmc"));
String wheredqlbbm=null;
wheredqlbbm=cf.GB2Uni(request.getParameter("wheredqlbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_dqlbbm set dqlbbm=?,dqlbmc=? ";
	ls_sql+=" where  (dqlbbm='"+wheredqlbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqlbbm);
	ps.setString(2,dqlbmc);
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