<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hdlxbm=null;
String hdlxmc=null;
hdlxbm=cf.GB2Uni(request.getParameter("hdlxbm"));
hdlxmc=cf.GB2Uni(request.getParameter("hdlxmc"));
String wherehdlxbm=null;
wherehdlxbm=cf.GB2Uni(request.getParameter("wherehdlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_hdlxbm set hdlxbm=?,hdlxmc=? ";
	ls_sql+=" where  (hdlxbm='"+wherehdlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hdlxbm);
	ps.setString(2,hdlxmc);
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