<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckbh=null;
String ssfgs=null;
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String whereckbh=null;
String wheressfgs=null;
whereckbh=cf.GB2Uni(request.getParameter("whereckbh"));
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_ckssfgs set ckbh=?,ssfgs=? ";
	ls_sql+=" where  (ckbh='"+whereckbh+"') and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckbh);
	ps.setString(2,ssfgs);
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