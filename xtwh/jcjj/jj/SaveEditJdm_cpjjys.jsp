<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpjjysbm=null;
String cpjjys=null;
cpjjysbm=cf.GB2Uni(request.getParameter("cpjjysbm"));
cpjjys=cf.GB2Uni(request.getParameter("cpjjys"));
String wherecpjjysbm=null;
wherecpjjysbm=cf.GB2Uni(request.getParameter("wherecpjjysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_cpjjys set cpjjysbm=?,cpjjys=? ";
	ls_sql+=" where  (cpjjysbm='"+wherecpjjysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpjjysbm);
	ps.setString(2,cpjjys);
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
	out.print("<BR>³ö´í:" + e);
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