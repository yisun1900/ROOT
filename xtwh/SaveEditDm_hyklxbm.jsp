<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hyklxbm=null;
String hyklxmc=null;
hyklxbm=cf.GB2Uni(request.getParameter("hyklxbm"));
hyklxmc=cf.GB2Uni(request.getParameter("hyklxmc"));
String wherehyklxbm=null;
wherehyklxbm=cf.GB2Uni(request.getParameter("wherehyklxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_hyklxbm set hyklxbm=?,hyklxmc=? ";
	ls_sql+=" where  (hyklxbm='"+wherehyklxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hyklxbm);
	ps.setString(2,hyklxmc);
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