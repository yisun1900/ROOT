<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%

String ls=null;
String dw_name=null;
String dw_note=null;
String dw_sql=null;
dw_name=cf.GB2Uni(request.getParameter("dw_name"));
dw_note=cf.GB2Uni(request.getParameter("dw_note"));
dw_sql=cf.GB2Uni(request.getParameter("dw_sql"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdatawindow_note ( dw_name,dw_note,dw_sql,dw_fromsql,dw_wheresql,dw_pritable ) ";
	ls_sql+=" values ( ?,?,?,'N','N','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dw_name);
	ps.setString(2,dw_note);
	ps.setString(3,dw_sql);
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
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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