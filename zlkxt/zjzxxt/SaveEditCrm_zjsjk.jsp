<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long jlh=0;
String zjlxbm=null;
String bt=null;
String nr=null;
java.sql.Date lrrq=null;
String yhdlm=null;
ls=request.getParameter("jlh");
try{
	if (!(ls.equals("")))  jlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jlh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[记录号]类型转换发生意外:"+e);
	return;
}
zjlxbm=cf.GB2Uni(request.getParameter("zjlxbm"));
bt=cf.GB2Uni(request.getParameter("bt"));
nr=cf.GB2Uni(request.getParameter("nr"));
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入日期]类型转换发生意外:"+e);
	return;
}
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
String wherejlh=null;
wherejlh=cf.GB2Uni(request.getParameter("wherejlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_zjsjk set jlh=?,zjlxbm=?,bt=?,nr=?,lrrq=?,yhdlm=? ";
	ls_sql+=" where  (jlh="+wherejlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,jlh);
	ps.setString(2,zjlxbm);
	ps.setString(3,bt);
	ps.setString(4,nr);
	ps.setDate(5,lrrq);
	ps.setString(6,yhdlm);
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