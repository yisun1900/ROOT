<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fyzldm=null;
String fyzlmc=null;
fyzldm=cf.GB2Uni(request.getParameter("fyzldm"));
fyzlmc=cf.GB2Uni(request.getParameter("fyzlmc"));
String wherefyzldm=null;
wherefyzldm=cf.GB2Uni(request.getParameter("wherefyzldm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_qhfyzlb set fyzldm=?,fyzlmc=? ";
	ls_sql+=" where  (fyzldm='"+wherefyzldm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fyzldm);
	ps.setString(2,fyzlmc);
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