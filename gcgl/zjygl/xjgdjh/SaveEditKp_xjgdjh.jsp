<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjr=null;
java.sql.Date jhxjsj=null;
String xjlx=null;
String bz=null;
xjr=cf.GB2Uni(request.getParameter("xjr"));
ls=request.getParameter("jhxjsj");
try{
	if (!(ls.equals("")))  jhxjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhxjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划巡检时间]类型转换发生意外:"+e);
	return;
}
xjlx=cf.GB2Uni(request.getParameter("xjlx"));


bz=cf.GB2Uni(request.getParameter("bz"));
String wherejhbh=null;
wherejhbh=cf.GB2Uni(request.getParameter("wherejhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_xjgdjh set xjr=?,jhxjsj=?,xjlx=?,bz=? ";
	ls_sql+=" where  (jhbh='"+wherejhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjr);
	ps.setDate(2,jhxjsj);
	ps.setString(3,xjlx);
	ps.setString(4,bz);
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