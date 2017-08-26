<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mtxbm=null;
String mtxmc=null;
double ztmjjl=0;
double ykjjl=0;
double ctjjl=0;
mtxbm=cf.GB2Uni(request.getParameter("mtxbm"));
mtxmc=cf.GB2Uni(request.getParameter("mtxmc"));
ls=request.getParameter("ztmjjl");
try{
	if (!(ls.equals("")))  ztmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ztmjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整樘门加价率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ykjjl");
try{
	if (!(ls.equals("")))  ykjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ykjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[哑口加价率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ctjjl");
try{
	if (!(ls.equals("")))  ctjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ctjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[窗套加价率]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_mtxbm ( mtxbm,mtxmc,ztmjjl,ykjjl,ctjjl ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mtxbm);
	ps.setString(2,mtxmc);
	ps.setDouble(3,ztmjjl);
	ps.setDouble(4,ykjjl);
	ps.setDouble(5,ctjjl);
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