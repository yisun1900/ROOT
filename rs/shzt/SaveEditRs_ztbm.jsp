<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ztbm=null;
String ztmc=null;
String ztlx=null;
String sqzt=null;
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
ztmc=cf.GB2Uni(request.getParameter("ztmc"));
ztlx=cf.GB2Uni(request.getParameter("ztlx"));
sqzt=cf.GB2Uni(request.getParameter("sqzt"));
String whereztbm=null;
whereztbm=cf.GB2Uni(request.getParameter("whereztbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_ztbm set ztbm=?,ztmc=?,ztlx=?,sqzt=? ";
	ls_sql+=" where  (ztbm='"+whereztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ztbm);
	ps.setString(2,ztmc);
	ps.setString(3,ztlx);
	ps.setString(4,sqzt);
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