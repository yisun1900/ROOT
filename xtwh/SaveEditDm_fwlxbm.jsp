<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fwlxbm=null;
String fwlxmc=null;
fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
fwlxmc=cf.GB2Uni(request.getParameter("fwlxmc"));
String wherefwlxbm=null;
wherefwlxbm=cf.GB2Uni(request.getParameter("wherefwlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_fwlxbm set fwlxbm=?,fwlxmc=? ";
	ls_sql+=" where  (fwlxbm='"+wherefwlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fwlxbm);
	ps.setString(2,fwlxmc);
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