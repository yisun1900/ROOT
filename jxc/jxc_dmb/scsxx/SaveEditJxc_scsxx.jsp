<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String scsbm=null;
String scsmc=null;
scsmc=cf.GB2Uni(request.getParameter("scsmc"));
String scslb=null;
scslb=cf.GB2Uni(request.getParameter("scslb"));
String wherescsbm=null;
wherescsbm=cf.GB2Uni(request.getParameter("wherescsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_scsxx set scsmc=?,scslb=? ";
	ls_sql+=" where  (scsbm='"+wherescsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,scsmc);
	ps.setString(2,scslb);
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