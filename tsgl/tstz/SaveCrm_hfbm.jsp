<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");
String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_tshffkbm set clzt='1',tzsj=SYSDATE,tzr='"+yhmc+"'";
	ls_sql+=" where hfjlh='"+hfjlh+"' and dwbh='"+dwbh+"' and clzt='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("标记已通知！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>