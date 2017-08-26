<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String bz=cf.GB2Uni(request.getParameter("bz"));

String ysjlh=request.getParameter("ysjlh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_heysjl set bz=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);
	ps.executeUpdate();
	ps.close();

	

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
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