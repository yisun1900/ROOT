<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ztbm=null;
String shjl=null;
String xyztbm=null;
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
xyztbm=cf.GB2Uni(request.getParameter("xyztbm"));
String whereztbm=null;
String whereshjl=null;
whereztbm=cf.GB2Uni(request.getParameter("whereztbm"));
whereshjl=cf.GB2Uni(request.getParameter("whereshjl"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_shztlc set ztbm=?,shjl=?,xyztbm=? ";
	ls_sql+=" where  (ztbm='"+whereztbm+"') and  (shjl='"+whereshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ztbm);
	ps.setString(2,shjl);
	ps.setString(3,xyztbm);
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