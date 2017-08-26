<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tmxlbm=null;
String tmxlmc=null;
tmxlbm=cf.GB2Uni(request.getParameter("tmxlbm"));
tmxlmc=cf.GB2Uni(request.getParameter("tmxlmc"));
String wheretmxlbm=null;
wheretmxlbm=cf.GB2Uni(request.getParameter("wheretmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_tmxlbm set tmxlbm=?,tmxlmc=? ";
	ls_sql+=" where  (tmxlbm='"+wheretmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tmxlbm);
	ps.setString(2,tmxlmc);
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