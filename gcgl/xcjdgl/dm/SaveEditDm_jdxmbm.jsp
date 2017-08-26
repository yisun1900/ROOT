<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdxmbm=null;
String jdxmmc=null;
String jdlxbm=null;
String jdqrlx=null;
jdxmbm=cf.GB2Uni(request.getParameter("jdxmbm"));
jdxmmc=cf.GB2Uni(request.getParameter("jdxmmc"));
jdlxbm=cf.GB2Uni(request.getParameter("jdlxbm"));
jdqrlx=cf.GB2Uni(request.getParameter("jdqrlx"));
String wherejdxmbm=null;
wherejdxmbm=cf.GB2Uni(request.getParameter("wherejdxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jdxmbm set jdxmbm=?,jdxmmc=?,jdlxbm=?,jdqrlx=? ";
	ls_sql+=" where  (jdxmbm='"+wherejdxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdxmbm);
	ps.setString(2,jdxmmc);
	ps.setString(3,jdlxbm);
	ps.setString(4,jdqrlx);
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