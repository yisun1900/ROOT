<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zjlyj=null;
zjlyj=cf.GB2Uni(request.getParameter("zjlyj"));
String whereshbbh=null;
whereshbbh=(String)session.getAttribute("shbbh");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_xcpzzsh set zjlyj=? ";
	ls_sql+=" where  (shbbh='"+whereshbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjlyj);
	
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�ɹ����棡");
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