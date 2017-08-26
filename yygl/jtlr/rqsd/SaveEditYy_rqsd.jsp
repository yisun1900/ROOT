<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
java.sql.Date yy_rqsd_szs=null;
java.sql.Date yy_rqsd_sze=null;
java.sql.Date yy_rqsd_bzs=null;
java.sql.Date yy_rqsd_bze=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("zqs");
try{
	if (!(ls.equals("")))  zqs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[周期数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_rqsd_szs");
try{
	if (!(ls.equals("")))  yy_rqsd_szs=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_rqsd_szs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上周日期开始]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_rqsd_sze");
try{
	if (!(ls.equals("")))  yy_rqsd_sze=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_rqsd_sze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上周日期结束]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_rqsd_bzs");
try{
	if (!(ls.equals("")))  yy_rqsd_bzs=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_rqsd_bzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本周日期开始]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_rqsd_bze");
try{
	if (!(ls.equals("")))  yy_rqsd_bze=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_rqsd_bze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本周日期结束]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String wherezqs=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_rqsd set zqs=?,yy_rqsd_szs=?,yy_rqsd_sze=?,yy_rqsd_bzs=?,yy_rqsd_bze=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (zqs="+wherezqs+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setDate(2,yy_rqsd_szs);
	ps.setDate(3,yy_rqsd_sze);
	ps.setDate(4,yy_rqsd_bzs);
	ps.setDate(5,yy_rqsd_bze);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
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