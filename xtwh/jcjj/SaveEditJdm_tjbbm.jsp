<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tjbbm=null;
String tjbmc=null;
tjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
tjbmc=cf.GB2Uni(request.getParameter("tjbmc"));
String wheretjbbm=null;
wheretjbbm=cf.GB2Uni(request.getParameter("wheretjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_tjbbm set tjbbm=?,tjbmc=? ";
	ls_sql+=" where  (tjbbm='"+wheretjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tjbbm);
	ps.setString(2,tjbmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
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