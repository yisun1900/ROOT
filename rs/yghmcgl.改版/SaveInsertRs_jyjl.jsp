<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
java.sql.Date kssj=null;
java.sql.Date jzsj=null;
String jyjg=null;
String jysm=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kssj");
try{
	if (!(ls.equals("")))  kssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[截至时间]类型转换发生意外:"+e);
	return;
}
jyjg=cf.GB2Uni(request.getParameter("jyjg"));
jysm=cf.GB2Uni(request.getParameter("jysm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_jyjl ( ygbh,kssj,jzsj,jyjg,jysm ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setDate(2,kssj);
	ps.setDate(3,jzsj);
	ps.setString(4,jyjg);
	ps.setString(5,jysm);
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
	out.print("存盘失败,发生意外: " + e);
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