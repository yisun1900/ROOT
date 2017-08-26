<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String blytbm=null;
String blyt=null;
blytbm=cf.GB2Uni(request.getParameter("blytbm"));
blyt=cf.GB2Uni(request.getParameter("blyt"));
String whereblytbm=null;
whereblytbm=cf.GB2Uni(request.getParameter("whereblytbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_blytbm set blytbm=?,blyt=? ";
	ls_sql+=" where  (blytbm='"+whereblytbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blytbm);
	ps.setString(2,blyt);
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