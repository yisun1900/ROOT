<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jgwzbm=null;
String jgwzmc=null;
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
jgwzmc=cf.GB2Uni(request.getParameter("jgwzmc"));
String wherejgwzbm=null;
wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_jgwzbm set jgwzbm=?,jgwzmc=? ";
	ls_sql+=" where  (jgwzbm='"+wherejgwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jgwzbm);
	ps.setString(2,jgwzmc);
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