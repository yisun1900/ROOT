<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xlbm=null;
String xueli=null;
xlbm=cf.GB2Uni(request.getParameter("xlbm"));
xueli=cf.GB2Uni(request.getParameter("xueli"));
String wherexlbm=null;
wherexlbm=cf.GB2Uni(request.getParameter("wherexlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_xlbm set xlbm=?,xueli=? ";
	ls_sql+=" where  (xlbm='"+wherexlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xlbm);
	ps.setString(2,xueli);
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