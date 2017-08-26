<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjzjxyybm=null;
String wjzjxyymc=null;
wjzjxyybm=cf.GB2Uni(request.getParameter("wjzjxyybm"));
wjzjxyymc=cf.GB2Uni(request.getParameter("wjzjxyymc"));
String wherewjzjxyybm=null;
wherewjzjxyybm=cf.GB2Uni(request.getParameter("wherewjzjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_wjzjxyybm set wjzjxyybm=?,wjzjxyymc=? ";
	ls_sql+=" where  (wjzjxyybm='"+wherewjzjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjzjxyybm);
	ps.setString(2,wjzjxyymc);
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