<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjpjmcbm=null;
String jjpjmc=null;
jjpjmcbm=cf.GB2Uni(request.getParameter("jjpjmcbm"));
jjpjmc=cf.GB2Uni(request.getParameter("jjpjmc"));
String wherejjpjmcbm=null;
wherejjpjmcbm=cf.GB2Uni(request.getParameter("wherejjpjmcbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjpjmcbm set jjpjmcbm=?,jjpjmc=? ";
	ls_sql+=" where  (jjpjmcbm='"+wherejjpjmcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjpjmcbm);
	ps.setString(2,jjpjmc);
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