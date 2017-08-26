<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String blzjxyybm=null;
String blzjxyymc=null;
blzjxyybm=cf.GB2Uni(request.getParameter("blzjxyybm"));
blzjxyymc=cf.GB2Uni(request.getParameter("blzjxyymc"));
String whereblzjxyybm=null;
whereblzjxyybm=cf.GB2Uni(request.getParameter("whereblzjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_blzjxyybm set blzjxyybm=?,blzjxyymc=? ";
	ls_sql+=" where  (blzjxyybm='"+whereblzjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blzjxyybm);
	ps.setString(2,blzjxyymc);
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