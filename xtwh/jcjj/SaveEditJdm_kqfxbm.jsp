<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kqfxbm=null;
String kqfxmc=null;
kqfxbm=cf.GB2Uni(request.getParameter("kqfxbm"));
kqfxmc=cf.GB2Uni(request.getParameter("kqfxmc"));
String wherekqfxbm=null;
wherekqfxbm=cf.GB2Uni(request.getParameter("wherekqfxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_kqfxbm set kqfxbm=?,kqfxmc=? ";
	ls_sql+=" where  (kqfxbm='"+wherekqfxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kqfxbm);
	ps.setString(2,kqfxmc);
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