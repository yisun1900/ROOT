<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khlxbm=null;
String khlxmc=null;
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
khlxmc=cf.GB2Uni(request.getParameter("khlxmc"));
String wherekhlxbm=null;
wherekhlxbm=cf.GB2Uni(request.getParameter("wherekhlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_khlxbm set khlxbm=?,khlxmc=? ";
	ls_sql+=" where  (khlxbm='"+wherekhlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khlxbm);
	ps.setString(2,khlxmc);
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