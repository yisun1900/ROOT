<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zcsmyybm=null;
String zcsmyy=null;
zcsmyybm=cf.GB2Uni(request.getParameter("zcsmyybm"));
zcsmyy=cf.GB2Uni(request.getParameter("zcsmyy"));
String wherezcsmyybm=null;
wherezcsmyybm=cf.GB2Uni(request.getParameter("wherezcsmyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zcsmyybm set zcsmyybm=?,zcsmyy=? ";
	ls_sql+=" where  (zcsmyybm='"+wherezcsmyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcsmyybm);
	ps.setString(2,zcsmyy);
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