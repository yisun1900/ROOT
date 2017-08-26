<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zqs=0;
String yy_cx_fgs=null;
double yy_cxzjzk_qnpj=0;
double yy_cxzjzk_bzzs=0;
double yy_cxzpzq_qnpj=0;
double yy_cxzpzq_bzzs=0;
double yy_cxgcfx_qnpj=0;
double yy_cxgcfx_bzzs=0;
double yy_cxrlhj_qnpj=0;
double yy_cxrlhj_bzzs=0;
java.sql.Date yy_cx_lrsj=null;
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
yy_cx_fgs=cf.GB2Uni(request.getParameter("yy_cx_fgs"));
ls=request.getParameter("yy_cxzjzk_qnpj");
try{
	if (!(ls.equals("")))  yy_cxzjzk_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxzjzk_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直接折扣去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxzjzk_bzzs");
try{
	if (!(ls.equals("")))  yy_cxzjzk_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxzjzk_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直接折扣本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxzpzq_qnpj");
try{
	if (!(ls.equals("")))  yy_cxzpzq_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxzpzq_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠品赠券去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxzpzq_bzzs");
try{
	if (!(ls.equals("")))  yy_cxzpzq_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxzpzq_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠品赠券本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxgcfx_qnpj");
try{
	if (!(ls.equals("")))  yy_cxgcfx_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxgcfx_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程返现去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxgcfx_bzzs");
try{
	if (!(ls.equals("")))  yy_cxgcfx_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxgcfx_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程返现本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxrlhj_qnpj");
try{
	if (!(ls.equals("")))  yy_cxrlhj_qnpj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxrlhj_qnpj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[让利合计去年平均(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cxrlhj_bzzs");
try{
	if (!(ls.equals("")))  yy_cxrlhj_bzzs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cxrlhj_bzzs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[让利合计本周指数(%)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yy_cx_lrsj");
try{
	if (!(ls.equals("")))  yy_cx_lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yy_cx_lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
String wherezqs=null;
String whereyy_cx_fgs=null;
wherezqs=cf.GB2Uni(request.getParameter("wherezqs"));
whereyy_cx_fgs=cf.GB2Uni(request.getParameter("whereyy_cx_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yy_cx set zqs=?,yy_cx_fgs=?,yy_cxzjzk_qnpj=?,yy_cxzjzk_bzzs=?,yy_cxzpzq_qnpj=?,yy_cxzpzq_bzzs=?,yy_cxgcfx_qnpj=?,yy_cxgcfx_bzzs=?,yy_cxrlhj_qnpj=?,yy_cxrlhj_bzzs=?,yy_cx_lrsj=?,lrr=? ";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_cx_fgs='"+whereyy_cx_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zqs);
	ps.setString(2,yy_cx_fgs);
	ps.setDouble(3,yy_cxzjzk_qnpj);
	ps.setDouble(4,yy_cxzjzk_bzzs);
	ps.setDouble(5,yy_cxzpzq_qnpj);
	ps.setDouble(6,yy_cxzpzq_bzzs);
	ps.setDouble(7,yy_cxgcfx_qnpj);
	ps.setDouble(8,yy_cxgcfx_bzzs);
	ps.setDouble(9,yy_cxrlhj_qnpj);
	ps.setDouble(10,yy_cxrlhj_bzzs);
	ps.setDate(11,yy_cx_lrsj);
	ps.setString(12,lrr);
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