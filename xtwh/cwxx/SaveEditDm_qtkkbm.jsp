<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qtkkbm=null;
String qtkkmc=null;
qtkkbm=cf.GB2Uni(request.getParameter("qtkkbm"));
qtkkmc=cf.GB2Uni(request.getParameter("qtkkmc"));
String whereqtkkbm=null;
whereqtkkbm=cf.GB2Uni(request.getParameter("whereqtkkbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_qtkkbm set qtkkbm=?,qtkkmc=? ";
	ls_sql+=" where  (qtkkbm='"+whereqtkkbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qtkkbm);
	ps.setString(2,qtkkmc);
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