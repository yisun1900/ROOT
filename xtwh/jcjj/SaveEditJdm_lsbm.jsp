<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lsbm=null;
String lsmc=null;
lsbm=cf.GB2Uni(request.getParameter("lsbm"));
lsmc=cf.GB2Uni(request.getParameter("lsmc"));
String wherelsbm=null;
wherelsbm=cf.GB2Uni(request.getParameter("wherelsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_lsbm set lsbm=?,lsmc=? ";
	ls_sql+=" where  (lsbm='"+wherelsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lsbm);
	ps.setString(2,lsmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
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