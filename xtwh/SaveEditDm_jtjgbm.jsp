<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jtjgbm=null;
String jtjgmc=null;
jtjgbm=cf.GB2Uni(request.getParameter("jtjgbm"));
jtjgmc=cf.GB2Uni(request.getParameter("jtjgmc"));
String wherejtjgbm=null;
wherejtjgbm=cf.GB2Uni(request.getParameter("wherejtjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jtjgbm set jtjgbm=?,jtjgmc=? ";
	ls_sql+=" where  (jtjgbm='"+wherejtjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jtjgbm);
	ps.setString(2,jtjgmc);
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