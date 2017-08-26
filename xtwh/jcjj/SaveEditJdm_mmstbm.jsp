<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmstbm=null;
String mmstmc=null;
mmstbm=cf.GB2Uni(request.getParameter("mmstbm"));
mmstmc=cf.GB2Uni(request.getParameter("mmstmc"));
String wheremmstbm=null;
wheremmstbm=cf.GB2Uni(request.getParameter("wheremmstbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmstbm set mmstbm=?,mmstmc=? ";
	ls_sql+=" where  (mmstbm='"+wheremmstbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmstbm);
	ps.setString(2,mmstmc);
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