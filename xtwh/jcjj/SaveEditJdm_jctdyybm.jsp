<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jctdyybm=null;
String jctdyymc=null;
jctdyybm=cf.GB2Uni(request.getParameter("jctdyybm"));
jctdyymc=cf.GB2Uni(request.getParameter("jctdyymc"));
String wherejctdyybm=null;
wherejctdyybm=cf.GB2Uni(request.getParameter("wherejctdyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jctdyybm set jctdyybm=?,jctdyymc=? ";
	ls_sql+=" where  (jctdyybm='"+wherejctdyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jctdyybm);
	ps.setString(2,jctdyymc);
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