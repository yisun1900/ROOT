<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zffsbm=null;
String zffsmc=null;
String lx=null;
zffsbm=cf.GB2Uni(request.getParameter("zffsbm"));
zffsmc=cf.GB2Uni(request.getParameter("zffsmc"));
lx=cf.GB2Uni(request.getParameter("lx"));
String wherezffsbm=null;
wherezffsbm=cf.GB2Uni(request.getParameter("wherezffsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_zffsbm set zffsbm=?,zffsmc=?,lx=? ";
	ls_sql+=" where  (zffsbm='"+wherezffsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zffsbm);
	ps.setString(2,zffsmc);
	ps.setString(3,lx);
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