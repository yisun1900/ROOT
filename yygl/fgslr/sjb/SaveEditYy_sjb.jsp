<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_sjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
long yy_sjbdj_sydjcb=0;
long yy_sjbdj_byjh=0;
long yy_sjbdj_bylj=0;
long yy_sjbdj_szjh=0;
long yy_sjbdj_szwc=0;
long yy_sjbdj_bzyj=0;
long yy_sjbdj_bztdj=0;
long yy_sjbdj_byljtdj=0;
double yy_sjbsjf_byjh=0;
double yy_sjbsjf_bylj=0;
double yy_sjbsjf_szjh=0;
double yy_sjbsjf_szwc=0;
double yy_sjbsjf_bzyj=0;
double yy_sjbgccz_byjh=0;
double yy_sjbgccz_bylj=0;
double yy_sjbgccz_szjh=0;
double yy_sjbgccz_szwc=0;
double yy_sjbgccz_bzyj=0;
double yy_sjbzccz_byjh=0;
double yy_sjbzccz_bylj=0;
double yy_sjbzccz_szjh=0;
double yy_sjbzccz_szwc=0;
double yy_sjbzccz_bzyj=0;
String yy_sjb_lrr=null;
java.sql.Date yy_sjb_lrsj=null;
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
yy_sjb_ygmc=cf.GB2Uni(request.getParameter("yy_sjb_ygmc"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("yy_sjbdj_sydjcb");
try{
	if (!(ls.equals("")))  yy_sjbdj_sydjcb=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_sydjcb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[以往(非本月)储备]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_byjh");
try{
	if (!(ls.equals("")))  yy_sjbdj_byjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月计划收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_bylj");
try{
	if (!(ls.equals("")))  yy_sjbdj_bylj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月累计收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_szjh");
try{
	if (!(ls.equals("")))  yy_sjbdj_szjh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上周计划收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_szwc");
try{
	if (!(ls.equals("")))  yy_sjbdj_szwc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上周完成收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_bzyj");
try{
	if (!(ls.equals("")))  yy_sjbdj_bzyj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本周预计收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_bztdj");
try{
	if (!(ls.equals("")))  yy_sjbdj_bztdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_bztdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本周退定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbdj_byljtdj");
try{
	if (!(ls.equals("")))  yy_sjbdj_byljtdj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbdj_byljtdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月累计退定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbsjf_byjh");
try{
	if (!(ls.equals("")))  yy_sjbsjf_byjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbsjf_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbsjf_bylj");
try{
	if (!(ls.equals("")))  yy_sjbsjf_bylj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbsjf_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbsjf_szjh");
try{
	if (!(ls.equals("")))  yy_sjbsjf_szjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbsjf_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbsjf_szwc");
try{
	if (!(ls.equals("")))  yy_sjbsjf_szwc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbsjf_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbsjf_bzyj");
try{
	if (!(ls.equals("")))  yy_sjbsjf_bzyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbsjf_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费本周预计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbgccz_byjh");
try{
	if (!(ls.equals("")))  yy_sjbgccz_byjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbgccz_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程产值本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbgccz_bylj");
try{
	if (!(ls.equals("")))  yy_sjbgccz_bylj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbgccz_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程产值本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbgccz_szjh");
try{
	if (!(ls.equals("")))  yy_sjbgccz_szjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbgccz_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程产值上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbgccz_szwc");
try{
	if (!(ls.equals("")))  yy_sjbgccz_szwc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbgccz_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程产值上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbgccz_bzyj");
try{
	if (!(ls.equals("")))  yy_sjbgccz_bzyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbgccz_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程产值本周预计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbzccz_byjh");
try{
	if (!(ls.equals("")))  yy_sjbzccz_byjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbzccz_byjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材产值本月计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbzccz_bylj");
try{
	if (!(ls.equals("")))  yy_sjbzccz_bylj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbzccz_bylj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材产值本月累计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbzccz_szjh");
try{
	if (!(ls.equals("")))  yy_sjbzccz_szjh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbzccz_szjh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材产值上周计划]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbzccz_szwc");
try{
	if (!(ls.equals("")))  yy_sjbzccz_szwc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbzccz_szwc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材产值上周完成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_sjbzccz_bzyj");
try{
	if (!(ls.equals("")))  yy_sjbzccz_bzyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjbzccz_bzyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材产值本月预计]类型转换发生意外:"+e);
	return;
}
yy_sjb_lrr=cf.GB2Uni(request.getParameter("yy_sjb_lrr"));
ls=request.getParameter("yy_sjb_lrsj");
try{
	if (!(ls.equals("")))  yy_sjb_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_sjb_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
String wheressbm=cf.GB2Uni(request.getParameter("wheressbm"));
String whereyy_sjb_ygmc=cf.GB2Uni(request.getParameter("whereyy_sjb_ygmc"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update yy_sjb set zqs=?,yy_sjb_ygmc=?,ssbm=?,ssfgs=?,yy_sjbdj_sydjcb=?,yy_sjbdj_byjh=?,yy_sjbdj_bylj=?,yy_sjbdj_szjh=?,yy_sjbdj_szwc=?,yy_sjbdj_bzyj=?,yy_sjbdj_bztdj=?,yy_sjbdj_byljtdj=?,yy_sjbsjf_byjh=?,yy_sjbsjf_bylj=?,yy_sjbsjf_szjh=?,yy_sjbsjf_szwc=?,yy_sjbsjf_bzyj=?,yy_sjbgccz_byjh=?,yy_sjbgccz_bylj=?,yy_sjbgccz_szjh=?,yy_sjbgccz_szwc=?,yy_sjbgccz_bzyj=?,yy_sjbzccz_byjh=?,yy_sjbzccz_bylj=?,yy_sjbzccz_szjh=?,yy_sjbzccz_szwc=?,yy_sjbzccz_bzyj=?,yy_sjb_lrr=?,yy_sjb_lrsj=SYSDATE ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssbm='"+wheressbm+"') and  (yy_sjb_ygmc='"+whereyy_sjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_sjb_ygmc);
	ps.setString(3,ssbm);
	ps.setString(4,ssfgs);
	ps.setLong(5,yy_sjbdj_sydjcb);
	ps.setLong(6,yy_sjbdj_byjh);
	ps.setLong(7,yy_sjbdj_bylj);
	ps.setLong(8,yy_sjbdj_szjh);
	ps.setLong(9,yy_sjbdj_szwc);
	ps.setLong(10,yy_sjbdj_bzyj);
	ps.setLong(11,yy_sjbdj_bztdj);
	ps.setLong(12,yy_sjbdj_byljtdj);
	ps.setDouble(13,yy_sjbsjf_byjh);
	ps.setDouble(14,yy_sjbsjf_bylj);
	ps.setDouble(15,yy_sjbsjf_szjh);
	ps.setDouble(16,yy_sjbsjf_szwc);
	ps.setDouble(17,yy_sjbsjf_bzyj);
	ps.setDouble(18,yy_sjbgccz_byjh);
	ps.setDouble(19,yy_sjbgccz_bylj);
	ps.setDouble(20,yy_sjbgccz_szjh);
	ps.setDouble(21,yy_sjbgccz_szwc);
	ps.setDouble(22,yy_sjbgccz_bzyj);
	ps.setDouble(23,yy_sjbzccz_byjh);
	ps.setDouble(24,yy_sjbzccz_bylj);
	ps.setDouble(25,yy_sjbzccz_szjh);
	ps.setDouble(26,yy_sjbzccz_szwc);
	ps.setDouble(27,yy_sjbzccz_bzyj);
	ps.setString(28,yy_sjb_lrr);
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