<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcpflbm=null;
String xcpflmc=null;
xcpflbm=cf.GB2Uni(request.getParameter("xcpflbm"));
xcpflmc=cf.GB2Uni(request.getParameter("xcpflmc"));
String wherexcpflbm=null;
wherexcpflbm=cf.GB2Uni(request.getParameter("wherexcpflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update oa_xcpflbm set xcpflbm=?,xcpflmc=? ";
	ls_sql+=" where  (xcpflbm='"+wherexcpflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcpflbm);
	ps.setString(2,xcpflmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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