<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String clbm=null;
double cj=0;
double cjjsj=0;
double fgsdj=0;
double gdj=0;
String ckmc=null;
String sfrk=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
clbm=cf.GB2Uni(request.getParameter("clbm"));
ls=request.getParameter("cj");
try{
	if (!(ls.equals("")))  cj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厂价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjjsj");
try{
	if (!(ls.equals("")))  cjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[与厂家结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fgsdj");
try{
	if (!(ls.equals("")))  fgsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fgsdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[分公司材料单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工队价]类型转换发生意外:"+e);
	return;
}
ckmc=cf.GB2Uni(request.getParameter("ckmc"));
sfrk=cf.GB2Uni(request.getParameter("sfrk"));

String tzr=cf.GB2Uni(request.getParameter("tzr"));
java.sql.Date tzsj=null;
ls=request.getParameter("tzsj");
try{
	if (!(ls.equals("")))  tzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调整时间]类型转换发生意外:"+e);
	return;
}

String sfycx=null;
double cxcj=0;
double cxcjjsj=0;
double cxfgsdj=0;
double cxgdj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;
sfycx=request.getParameter("sfycx");

ls=request.getParameter("cxcj");
try{
	if (!(ls.equals("")))  cxcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxcj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期厂价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxcjjsj");
try{
	if (!(ls.equals("")))  cxcjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxcjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期与厂家结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxfgsdj");
try{
	if (!(ls.equals("")))  cxfgsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxfgsdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期分公司材料单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxgdj");
try{
	if (!(ls.equals("")))  cxgdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxgdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期工队价]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjzsj");
try{
	if (!(ls.equals("")))  cxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cl_jgmx ( dwbh,clbm,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj  ,sfycx,cxcj,cxcjjsj,cxfgsdj,cxgdj,cxkssj,cxjzsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,SYSDATE  ,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,clbm);
	ps.setDouble(3,cj);
	ps.setDouble(4,cjjsj);
	ps.setDouble(5,fgsdj);
	ps.setDouble(6,gdj);
	ps.setString(7,ckmc);
	ps.setString(8,sfrk); 
	ps.setString(9,tzr);

	ps.setString(10,sfycx);
	ps.setDouble(11,cxcj);
	ps.setDouble(12,cxcjjsj);
	ps.setDouble(13,cxfgsdj);
	ps.setDouble(14,cxgdj);
	ps.setDate(15,cxkssj);
	ps.setDate(16,cxjzsj);
	
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
	out.print("<BR>存盘失败,发生意外: " + e);
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