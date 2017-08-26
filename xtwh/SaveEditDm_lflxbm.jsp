<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lflxbm=null;
String lflxmc=null;
lflxbm=cf.GB2Uni(request.getParameter("lflxbm"));
lflxmc=cf.GB2Uni(request.getParameter("lflxmc"));
String wherelflxbm=null;
wherelflxbm=cf.GB2Uni(request.getParameter("wherelflxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_lflxbm set lflxbm=?,lflxmc=? ";
	ls_sql+=" where  (lflxbm='"+wherelflxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lflxbm);
	ps.setString(2,lflxmc);
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