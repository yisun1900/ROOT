<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zcysbm=null;
String zcysmc=null;
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
zcysmc=cf.GB2Uni(request.getParameter("zcysmc"));
String wherezcysbm=null;
wherezcysbm=cf.GB2Uni(request.getParameter("wherezcysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zcysbm set zcysbm=?,zcysmc=? ";
	ls_sql+=" where  (zcysbm='"+wherezcysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcysbm);
	ps.setString(2,zcysmc);
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