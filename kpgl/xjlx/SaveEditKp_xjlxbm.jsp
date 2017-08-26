<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjlxbm=null;
String xjlxmc=null;
xjlxbm=cf.GB2Uni(request.getParameter("xjlxbm"));
xjlxmc=cf.GB2Uni(request.getParameter("xjlxmc"));
String wherexjlxbm=null;
wherexjlxbm=cf.GB2Uni(request.getParameter("wherexjlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_xjlxbm set xjlxbm=?,xjlxmc=? ";
	ls_sql+=" where  (xjlxbm='"+wherexjlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjlxbm);
	ps.setString(2,xjlxmc);
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