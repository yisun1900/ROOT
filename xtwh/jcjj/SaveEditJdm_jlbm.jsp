<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlbm=null;
String jlmc=null;
jlbm=cf.GB2Uni(request.getParameter("jlbm"));
jlmc=cf.GB2Uni(request.getParameter("jlmc"));
String wherejlbm=null;
wherejlbm=cf.GB2Uni(request.getParameter("wherejlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jlbm set jlbm=?,jlmc=? ";
	ls_sql+=" where  (jlbm='"+wherejlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlbm);
	ps.setString(2,jlmc);
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