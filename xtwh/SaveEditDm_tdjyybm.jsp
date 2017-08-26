<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tdjyybm=null;
String tdjyymc=null;
tdjyybm=cf.GB2Uni(request.getParameter("tdjyybm"));
tdjyymc=cf.GB2Uni(request.getParameter("tdjyymc"));
String wheretdjyybm=null;
wheretdjyybm=cf.GB2Uni(request.getParameter("wheretdjyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_tdjyybm set tdjyybm=?,tdjyymc=? ";
	ls_sql+=" where  (tdjyybm='"+wheretdjyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tdjyybm);
	ps.setString(2,tdjyymc);
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