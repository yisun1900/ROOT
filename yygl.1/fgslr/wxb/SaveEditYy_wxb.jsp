<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_wxb_ygmc=null;
String ssbm=null;
String ssfgs=null;
long yy_wxbkh_byjh=0;
long yy_wxbkh_bylj=0;
long yy_wxbkh_szjh=0;
long yy_wxbkh_szwc=0;
long yy_wxbkh_bzyj=0;
long yy_wxbdj_byjh=0;
long yy_wxbdj_bylj=0;
long yy_wxbdj_szjh=0;
long yy_wxbdj_szwc=0;
long yy_wxbdj_bzjh=0;
String yy_wxb_lrr=null;
java.sql.Date yy_wxb_lrsj=null;
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
yy_wxb_ygmc=cf.GB2Uni(request.getParameter("yy_wxb_ygmc"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("yy_wxbkh_byjh");
try{
	if (!(ls.equals("")))  yy_wxbkh_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbkh_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbkh_bylj");
try{
	if (!(ls.equals("")))  yy_wxbkh_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbkh_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbkh_szjh");
try{
	if (!(ls.equals("")))  yy_wxbkh_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbkh_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbkh_szwc");
try{
	if (!(ls.equals("")))  yy_wxbkh_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbkh_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbkh_bzyj");
try{
	if (!(ls.equals("")))  yy_wxbkh_bzyj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbkh_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本周预计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbdj_byjh");
try{
	if (!(ls.equals("")))  yy_wxbdj_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbdj_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbdj_bylj");
try{
	if (!(ls.equals("")))  yy_wxbdj_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbdj_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金数量本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbdj_szjh");
try{
	if (!(ls.equals("")))  yy_wxbdj_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbdj_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金数量上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbdj_szwc");
try{
	if (!(ls.equals("")))  yy_wxbdj_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbdj_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金数量上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_wxbdj_bzjh");
try{
	if (!(ls.equals("")))  yy_wxbdj_bzjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxbdj_bzjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金数量本周计划]类型转换发生意外:"+e);
	return;
}
yy_wxb_lrr=cf.GB2Uni(request.getParameter("yy_wxb_lrr"));
ls=request.getParameter("yy_wxb_lrsj");
try{
	if (!(ls.equals("")))  yy_wxb_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_wxb_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String wherezqs=null;
String whereyy_wxb_ygmc=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_wxb_ygmc=cf.GB2Uni(request.getParameter("whereyy_wxb_ygmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_wxb set zqs=?,yy_wxb_ygmc=?,ssbm=?,ssfgs=?,yy_wxbkh_byjh=?,yy_wxbkh_bylj=?,yy_wxbkh_szjh=?,yy_wxbkh_szwc=?,yy_wxbkh_bzyj=?,yy_wxbdj_byjh=?,yy_wxbdj_bylj=?,yy_wxbdj_szjh=?,yy_wxbdj_szwc=?,yy_wxbdj_bzjh=?,yy_wxb_lrr=?,yy_wxb_lrsj=SYSDATE";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_wxb_ygmc='"+whereyy_wxb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_wxb_ygmc);
	ps.setString(3,ssbm);
	ps.setString(4,ssfgs);
	ps.setLong(5,yy_wxbkh_byjh);
	ps.setLong(6,yy_wxbkh_bylj);
	ps.setLong(7,yy_wxbkh_szjh);
	ps.setLong(8,yy_wxbkh_szwc);
	ps.setLong(9,yy_wxbkh_bzyj);
	ps.setLong(10,yy_wxbdj_byjh);
	ps.setLong(11,yy_wxbdj_bylj);
	ps.setLong(12,yy_wxbdj_szjh);
	ps.setLong(13,yy_wxbdj_szwc);
	ps.setLong(14,yy_wxbdj_bzjh);
	ps.setString(15,yy_wxb_lrr);
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