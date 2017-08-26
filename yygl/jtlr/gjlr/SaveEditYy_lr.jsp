<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_lr_fgs=null;
double yy_lrglf_ysbl=0;
double yy_lrglf_sjsq=0;
double yy_lrsj_ysbl=0;
double yy_lrsj_sjsq=0;
double yy_lrgc_qnpj=0;
double yy_lrgc_bzzs=0;
double yy_lrzc_qnpj=0;
double yy_lrzc_bzzs=0;
java.sql.Date yy_lr_lrsj=null;
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
yy_lr_fgs=cf.GB2Uni(request.getParameter("yy_lr_fgs"));
ls=request.getParameter("yy_lrglf_ysbl");
try{
	if (!(ls.equals("")))  yy_lrglf_ysbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrglf_ysbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户管理费比例应收比例(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrglf_sjsq");
try{
	if (!(ls.equals("")))  yy_lrglf_sjsq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrglf_sjsq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户管理费比例实际收取(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrsj_ysbl");
try{
	if (!(ls.equals("")))  yy_lrsj_ysbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrsj_ysbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金及其他比例应收比例(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrsj_sjsq");
try{
	if (!(ls.equals("")))  yy_lrsj_sjsq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrsj_sjsq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金及其他比例实际收取(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrgc_qnpj");
try{
	if (!(ls.equals("")))  yy_lrgc_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrgc_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程毛利率去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrgc_bzzs");
try{
	if (!(ls.equals("")))  yy_lrgc_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrgc_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程毛利率本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrzc_qnpj");
try{
	if (!(ls.equals("")))  yy_lrzc_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrzc_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材毛利率去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lrzc_bzzs");
try{
	if (!(ls.equals("")))  yy_lrzc_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lrzc_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材毛利率本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_lr_lrsj");
try{
	if (!(ls.equals("")))  yy_lr_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_lr_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
String wherezqs=null;
String whereyy_lr_fgs=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_lr_fgs=cf.GB2Uni(request.getParameter("whereyy_lr_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_lr set zqs=?,yy_lr_fgs=?,yy_lrglf_ysbl=?,yy_lrglf_sjsq=?,yy_lrsj_ysbl=?,yy_lrsj_sjsq=?,yy_lrgc_qnpj=?,yy_lrgc_bzzs=?,yy_lrzc_qnpj=?,yy_lrzc_bzzs=?,yy_lr_lrsj=SYSDATE,lrr=? ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_lr_fgs='"+whereyy_lr_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_lr_fgs);
	ps.setDouble(3,yy_lrglf_ysbl);
	ps.setDouble(4,yy_lrglf_sjsq);
	ps.setDouble(5,yy_lrsj_ysbl);
	ps.setDouble(6,yy_lrsj_sjsq);
	ps.setDouble(7,yy_lrgc_qnpj);
	ps.setDouble(8,yy_lrgc_bzzs);
	ps.setDouble(9,yy_lrzc_qnpj);
	ps.setDouble(10,yy_lrzc_bzzs);
	ps.setString(11,lrr);
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