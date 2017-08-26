<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String mgfrz=cf.GB2Uni(request.getParameter("mgfrz"));
String nwgfrz=cf.GB2Uni(request.getParameter("nwgfrz"));
String sdgfrz=cf.GB2Uni(request.getParameter("sdgfrz"));
String yqgfrz=cf.GB2Uni(request.getParameter("yqgfrz"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khxx set mgfrz=?,nwgfrz=?,sdgfrz=?,yqgfrz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mgfrz);
	ps.setString(2,nwgfrz);
	ps.setString(3,sdgfrz);
	ps.setString(4,yqgfrz);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ÅÉµ¥³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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