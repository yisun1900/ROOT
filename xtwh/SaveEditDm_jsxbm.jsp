<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsxbm=null;
String jsxmc=null;
jsxbm=cf.GB2Uni(request.getParameter("jsxbm"));
jsxmc=cf.GB2Uni(request.getParameter("jsxmc"));
String wherejsxbm=null;
wherejsxbm=cf.GB2Uni(request.getParameter("wherejsxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_jsxbm set jsxbm=?,jsxmc=? ";
	ls_sql+=" where  (jsxbm='"+wherejsxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsxbm);
	ps.setString(2,jsxmc);
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