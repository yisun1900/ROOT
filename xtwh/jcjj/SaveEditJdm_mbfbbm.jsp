<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mbfbbm=null;
String mbfbmc=null;
mbfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
mbfbmc=cf.GB2Uni(request.getParameter("mbfbmc"));
String wherembfbbm=null;
wherembfbbm=cf.GB2Uni(request.getParameter("wherembfbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mbfbbm set mbfbbm=?,mbfbmc=? ";
	ls_sql+=" where  (mbfbbm='"+wherembfbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mbfbbm);
	ps.setString(2,mbfbmc);
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