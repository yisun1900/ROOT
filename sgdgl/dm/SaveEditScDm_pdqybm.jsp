<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pdqybm=null;
String pdqymc=null;
String dqbm=null;
pdqybm=cf.GB2Uni(request.getParameter("pdqybm"));
pdqymc=cf.GB2Uni(request.getParameter("pdqymc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherepdqybm=null;
wherepdqybm=cf.GB2Uni(request.getParameter("wherepdqybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_pdqybm set pdqybm=?,pdqymc=?,dqbm=? ";
	ls_sql+=" where  (pdqybm='"+wherepdqybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdqybm);
	ps.setString(2,pdqymc);
	ps.setString(3,dqbm);
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