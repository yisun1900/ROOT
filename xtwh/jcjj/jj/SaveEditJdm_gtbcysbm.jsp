<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtbcysbm=null;
String gtbcysmc=null;
gtbcysbm=cf.GB2Uni(request.getParameter("gtbcysbm"));
gtbcysmc=cf.GB2Uni(request.getParameter("gtbcysmc"));
String wheregtbcysbm=null;
wheregtbcysbm=cf.GB2Uni(request.getParameter("wheregtbcysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_gtbcysbm set gtbcysbm=?,gtbcysmc=? ";
	ls_sql+=" where  (gtbcysbm='"+wheregtbcysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtbcysbm);
	ps.setString(2,gtbcysmc);
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