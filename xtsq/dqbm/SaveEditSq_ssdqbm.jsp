<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssdqbm=null;
String ssdqmc=null;
ssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
ssdqmc=cf.GB2Uni(request.getParameter("ssdqmc"));
String wheressdqbm=null;
wheressdqbm=cf.GB2Uni(request.getParameter("wheressdqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_ssdqbm set ssdqbm=?,ssdqmc=? ";
	ls_sql+=" where  (ssdqbm='"+wheressdqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssdqbm);
	ps.setString(2,ssdqmc);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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