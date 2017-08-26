<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hxbm=null;
String jgwzbm=null;
long mj=0;
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
ls=request.getParameter("mj");
try{
	if (!(ls.equals("")))  mj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[空间面积]类型转换发生意外:"+e);
	return;
}
String wherehxbm=null;
String wherejgwzbm=null;
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckb_kjmxb set hxbm=?,jgwzbm=?,mj=? ";
	ls_sql+=" where  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,jgwzbm);
	ps.setLong(3,mj);
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
	out.print("<BR>出错:" + e);
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