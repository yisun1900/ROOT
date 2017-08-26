<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String xmzy=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
String wheredwbh=null;
String wherexmzy=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
wherexmzy=cf.GB2Uni(request.getParameter("wherexmzy"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_xmzy set dwbh=?,xmzy=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (xmzy='"+wherexmzy+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,xmzy);
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