<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfalxbm=null;
String pfalxmc=null;
pfalxbm=cf.GB2Uni(request.getParameter("pfalxbm"));
pfalxmc=cf.GB2Uni(request.getParameter("pfalxmc"));
String wherepfalxbm=null;
wherepfalxbm=cf.GB2Uni(request.getParameter("wherepfalxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_pfalxbm set pfalxbm=?,pfalxmc=? ";
	ls_sql+=" where  (pfalxbm='"+wherepfalxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfalxbm);
	ps.setString(2,pfalxmc);
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