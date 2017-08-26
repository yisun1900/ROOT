<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String whereyjbh=cf.GB2Uni(request.getParameter("whereyjbh"));
String yjygbh=null;
yjygbh=(String)session.getAttribute("ygbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete nbyj_sjx ";
	ls_sql+=" where (yjbh='"+whereyjbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！"+ls_sql);
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("邮件已删除！");
		window.location.href="Nbyj_sjxList.jsp?yjygbh=<%=yjygbh%>";
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	if (ps != null) ps.close();

	
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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