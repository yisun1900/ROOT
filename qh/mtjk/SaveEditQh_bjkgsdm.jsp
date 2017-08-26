<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjkgsbh=null;
String bjkgsmc=null;
bjkgsbh=cf.GB2Uni(request.getParameter("bjkgsbh"));
bjkgsmc=cf.GB2Uni(request.getParameter("bjkgsmc"));
String wherebjkgsbh=null;
wherebjkgsbh=cf.GB2Uni(request.getParameter("wherebjkgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_bjkgsdm set bjkgsbh=?,bjkgsmc=? ";
	ls_sql+=" where  (bjkgsbh='"+wherebjkgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjkgsbh);
	ps.setString(2,bjkgsmc);
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