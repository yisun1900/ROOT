<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgmbkysbm=null;
String bgmbkysmc=null;
bgmbkysbm=cf.GB2Uni(request.getParameter("bgmbkysbm"));
bgmbkysmc=cf.GB2Uni(request.getParameter("bgmbkysmc"));
String wherebgmbkysbm=null;
wherebgmbkysbm=cf.GB2Uni(request.getParameter("wherebgmbkysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_bgmbkysbm set bgmbkysbm=?,bgmbkysmc=? ";
	ls_sql+=" where  (bgmbkysbm='"+wherebgmbkysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgmbkysbm);
	ps.setString(2,bgmbkysmc);
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