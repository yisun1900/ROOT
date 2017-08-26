<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
java.sql.Date tcqssj=null;
java.sql.Date tcjzsj=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("tcqssj");
try{
	if (!(ls.equals("")))  tcqssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcqssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计算提成起始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcjzsj");
try{
	if (!(ls.equals("")))  tcjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计算提成截至时间]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_jrtcph ( ssfgs,tcqssj,tcjzsj ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setDate(2,tcqssj);
	ps.setDate(3,tcjzsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
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