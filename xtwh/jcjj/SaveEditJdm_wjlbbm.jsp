<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjlbbm=null;
String wjlbmc=null;
wjlbbm=cf.GB2Uni(request.getParameter("wjlbbm"));
wjlbmc=cf.GB2Uni(request.getParameter("wjlbmc"));
String wherewjlbbm=null;
wherewjlbbm=cf.GB2Uni(request.getParameter("wherewjlbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_wjlbbm set wjlbbm=?,wjlbmc=? ";
	ls_sql+=" where  (wjlbbm='"+wherewjlbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjlbbm);
	ps.setString(2,wjlbmc);
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