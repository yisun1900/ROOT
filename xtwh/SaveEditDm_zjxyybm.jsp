<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zjxyybm=null;
String zjxyymc=null;
zjxyybm=cf.GB2Uni(request.getParameter("zjxyybm"));
zjxyymc=cf.GB2Uni(request.getParameter("zjxyymc"));
String wherezjxyybm=null;
wherezjxyybm=cf.GB2Uni(request.getParameter("wherezjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zjxyybm set zjxyybm=?,zjxyymc=? ";
	ls_sql+=" where  (zjxyybm='"+wherezjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxyybm);
	ps.setString(2,zjxyymc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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