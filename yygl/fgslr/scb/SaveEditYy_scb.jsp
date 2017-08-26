<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_scb_ygmc=null;
String ssbm=null;
String ssfgs=null;
long yy_scbkh_byjh=0;
long yy_scbkh_bylj=0;
long yy_scbkh_szjh=0;
long yy_scbkh_szwc=0;
long yy_scbkh_bzyj=0;
long yy_scbdj_byjh=0;
long yy_scbdj_bylj=0;
long yy_scbdj_szjh=0;
long yy_scbdj_szwc=0;
long yy_scbdj_bzjh=0;
String yy_scb_lrr=null;
java.sql.Date yy_scb_lrsj=null;
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
yy_scb_ygmc=cf.GB2Uni(request.getParameter("yy_scb_ygmc"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("yy_scbkh_byjh");
try{
	if (!(ls.equals("")))  yy_scbkh_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbkh_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbkh_bylj");
try{
	if (!(ls.equals("")))  yy_scbkh_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbkh_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbkh_szjh");
try{
	if (!(ls.equals("")))  yy_scbkh_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbkh_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbkh_szwc");
try{
	if (!(ls.equals("")))  yy_scbkh_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbkh_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbkh_bzyj");
try{
	if (!(ls.equals("")))  yy_scbkh_bzyj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbkh_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标客户数量本周预计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbdj_byjh");
try{
	if (!(ls.equals("")))  yy_scbdj_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbdj_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbdj_bylj");
try{
	if (!(ls.equals("")))  yy_scbdj_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbdj_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbdj_szjh");
try{
	if (!(ls.equals("")))  yy_scbdj_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbdj_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbdj_szwc");
try{
	if (!(ls.equals("")))  yy_scbdj_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbdj_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_scbdj_bzjh");
try{
	if (!(ls.equals("")))  yy_scbdj_bzjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scbdj_bzjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金本周预计]类型转换发生意外:"+e);
	return;
}
yy_scb_lrr=cf.GB2Uni(request.getParameter("yy_scb_lrr"));
ls=request.getParameter("yy_scb_lrsj");
try{
	if (!(ls.equals("")))  yy_scb_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_scb_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String wherezqs=null;
String whereyy_scb_ygmc=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_scb_ygmc=cf.GB2Uni(request.getParameter("whereyy_scb_ygmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_scb set zqs=?,yy_scb_ygmc=?,ssbm=?,ssfgs=?,yy_scbkh_byjh=?,yy_scbkh_bylj=?,yy_scbkh_szjh=?,yy_scbkh_szwc=?,yy_scbkh_bzyj=?,yy_scbdj_byjh=?,yy_scbdj_bylj=?,yy_scbdj_szjh=?,yy_scbdj_szwc=?,yy_scbdj_bzjh=?,yy_scb_lrr=?,yy_scb_lrsj=SYSDATE ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_scb_ygmc='"+whereyy_scb_ygmc+"') and  (ssbm='"+ssbm+"') and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_scb_ygmc);
	ps.setString(3,ssbm);
	ps.setString(4,ssfgs);
	ps.setLong(5,yy_scbkh_byjh);
	ps.setLong(6,yy_scbkh_bylj);
	ps.setLong(7,yy_scbkh_szjh);
	ps.setLong(8,yy_scbkh_szwc);
	ps.setLong(9,yy_scbkh_bzyj);
	ps.setLong(10,yy_scbdj_byjh);
	ps.setLong(11,yy_scbdj_bylj);
	ps.setLong(12,yy_scbdj_szjh);
	ps.setLong(13,yy_scbdj_szwc);
	ps.setLong(14,yy_scbdj_bzjh);
	ps.setString(15,yy_scb_lrr);
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