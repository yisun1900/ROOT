<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jldwbm=null;
String jldwmc=null;
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
String wherejldwbm=null;
wherejldwbm=cf.GB2Uni(request.getParameter("wherejldwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jldwbm set jldwbm=?,jldwmc=? ";
	ls_sql+=" where  (jldwbm='"+wherejldwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jldwbm);
	ps.setString(2,jldwmc);
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