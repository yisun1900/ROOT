<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_sj_fgs=null;
long yy_sjzky_mbkh=0;
long yy_sjzky_sqdj=0;
double yy_sjsjb_sjf=0;
double yy_sjsjb_tqsjf=0;
double yy_sjsjb_gccz=0;
double yy_sjsjb_tqgccz=0;
double yy_sjjjb_byjh=0;
double yy_sjjjb_qntq=0;
long yy_sjscb_mbkh=0;
long yy_sjwxb_mbkh=0;
long yy_sjqtqd_mbkh=0;
long yy_sjscb_sqdj=0;
long yy_sjwxb_sqdj=0;
long yy_sjqtqd_sqdj=0;
java.sql.Date yy_sj_lrsj=null;
String lrr=null;
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
yy_sj_fgs=cf.GB2Uni(request.getParameter("yy_sj_fgs"));
ls=request.getParameter("yy_sjzky_mbkh");
try{
	if (!(ls.equals("")))  yy_sjzky_mbkh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjzky_mbkh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总客源目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjzky_sqdj");
try{
	if (!(ls.equals("")))  yy_sjzky_sqdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjzky_sqdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总客源收取定金数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjsjb_sjf");
try{
	if (!(ls.equals("")))  yy_sjsjb_sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjsjb_sjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计部设计费本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjsjb_tqsjf");
try{
	if (!(ls.equals("")))  yy_sjsjb_tqsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjsjb_tqsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计部去年同期月度设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjsjb_gccz");
try{
	if (!(ls.equals("")))  yy_sjsjb_gccz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjsjb_gccz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计部工程产值本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjsjb_tqgccz");
try{
	if (!(ls.equals("")))  yy_sjsjb_tqgccz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjsjb_tqgccz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计部去年同期月度工程产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjjjb_byjh");
try{
	if (!(ls.equals("")))  yy_sjjjb_byjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjjjb_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家居部主材产值本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjjjb_qntq");
try{
	if (!(ls.equals("")))  yy_sjjjb_qntq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjjjb_qntq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家居部去年同期月度主材产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjscb_mbkh");
try{
	if (!(ls.equals("")))  yy_sjscb_mbkh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjscb_mbkh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjwxb_mbkh");
try{
	if (!(ls.equals("")))  yy_sjwxb_mbkh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjwxb_mbkh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网销部目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjqtqd_mbkh");
try{
	if (!(ls.equals("")))  yy_sjqtqd_mbkh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjqtqd_mbkh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其他渠道目标客户数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjscb_sqdj");
try{
	if (!(ls.equals("")))  yy_sjscb_sqdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjscb_sqdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部收取定金数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjwxb_sqdj");
try{
	if (!(ls.equals("")))  yy_sjwxb_sqdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjwxb_sqdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网销部收取定金数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjqtqd_sqdj");
try{
	if (!(ls.equals("")))  yy_sjqtqd_sqdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjqtqd_sqdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其他渠道收取定金数量本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sj_lrsj");
try{
	if (!(ls.equals("")))  yy_sj_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sj_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
String wherezqs=null;
String whereyy_sj_fgs=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_sj_fgs=cf.GB2Uni(request.getParameter("whereyy_sj_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_sj set zqs=?,yy_sj_fgs=?,yy_sjzky_mbkh=?,yy_sjzky_sqdj=?,yy_sjsjb_sjf=?,yy_sjsjb_tqsjf=?,yy_sjsjb_gccz=?,yy_sjsjb_tqgccz=?,yy_sjjjb_byjh=?,yy_sjjjb_qntq=?,yy_sjscb_mbkh=?,yy_sjwxb_mbkh=?,yy_sjqtqd_mbkh=?,yy_sjscb_sqdj=?,yy_sjwxb_sqdj=?,yy_sjqtqd_sqdj=?,lrr=?,yy_sj_lrsj=SYSDATE ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_sj_fgs='"+whereyy_sj_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_sj_fgs);
	ps.setLong(3,yy_sjzky_mbkh);
	ps.setLong(4,yy_sjzky_sqdj);
	ps.setDouble(5,yy_sjsjb_sjf);
	ps.setDouble(6,yy_sjsjb_tqsjf);
	ps.setDouble(7,yy_sjsjb_gccz);
	ps.setDouble(8,yy_sjsjb_tqgccz);
	ps.setDouble(9,yy_sjjjb_byjh);
	ps.setDouble(10,yy_sjjjb_qntq);
	ps.setLong(11,yy_sjscb_mbkh);
	ps.setLong(12,yy_sjwxb_mbkh);
	ps.setLong(13,yy_sjqtqd_mbkh);
	ps.setLong(14,yy_sjscb_sqdj);
	ps.setLong(15,yy_sjwxb_sqdj);
	ps.setLong(16,yy_sjqtqd_sqdj);
	ps.setString(17,lrr);
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