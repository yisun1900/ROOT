<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcyqyybm=null;
String gcyqyymc=null;
gcyqyybm=cf.GB2Uni(request.getParameter("gcyqyybm"));
gcyqyymc=cf.GB2Uni(request.getParameter("gcyqyymc"));
String lx=request.getParameter("lx");
String wheregcyqyybm=null;
wheregcyqyybm=cf.GB2Uni(request.getParameter("wheregcyqyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gcyqyybm set gcyqyybm=?,gcyqyymc=?,lx=? ";
	ls_sql+=" where  (gcyqyybm='"+wheregcyqyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcyqyybm);
	ps.setString(2,gcyqyymc);
	ps.setString(3,lx);
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