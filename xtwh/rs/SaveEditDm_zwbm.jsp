<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zwbm=null;
String zwmc=null;
zwbm=cf.GB2Uni(request.getParameter("zwbm"));
zwmc=cf.GB2Uni(request.getParameter("zwmc"));
String wherezwbm=null;
wherezwbm=cf.GB2Uni(request.getParameter("wherezwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zwbm set zwbm=?,zwmc=? ";
	ls_sql+=" where  (zwbm='"+wherezwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zwbm);
	ps.setString(2,zwmc);
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