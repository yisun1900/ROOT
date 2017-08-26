<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbm=null;
String bjmc=null;
bjbm=cf.GB2Uni(request.getParameter("bjbm"));
bjmc=cf.GB2Uni(request.getParameter("bjmc"));
String wherebjbm=null;
wherebjbm=cf.GB2Uni(request.getParameter("wherebjbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_gtbjmc set bjbm=?,bjmc=? ";
	ls_sql+=" where  (bjbm='"+wherebjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbm);
	ps.setString(2,bjmc);
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