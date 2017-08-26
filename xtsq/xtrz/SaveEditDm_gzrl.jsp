<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jjrbz=null;
String jjrlx=null;
jjrbz=cf.GB2Uni(request.getParameter("jjrbz"));
jjrlx=cf.GB2Uni(request.getParameter("jjrlx"));

String whererq=cf.GB2Uni(request.getParameter("whererq"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gzrl set jjrbz=?,jjrlx=? ";
	ls_sql+=" where  (rq=TO_DATE('"+whererq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjrbz);
	ps.setString(2,jjrlx);
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