<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String nlqjbm=null;
String nlqjmc=null;
nlqjbm=cf.GB2Uni(request.getParameter("nlqjbm"));
nlqjmc=cf.GB2Uni(request.getParameter("nlqjmc"));
String wherenlqjbm=null;
wherenlqjbm=cf.GB2Uni(request.getParameter("wherenlqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_nlqjbm set nlqjbm=?,nlqjmc=? ";
	ls_sql+=" where  (nlqjbm='"+wherenlqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,nlqjbm);
	ps.setString(2,nlqjmc);
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