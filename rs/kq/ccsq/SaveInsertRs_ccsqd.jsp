<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
String fgsbh=null;
String dwbh=null;
long ygbh=0;
String yhmc=null;
String xb=null;
String xzzwbm=null;

java.sql.Date kssj=null;
java.sql.Date jzsj=null;
double ljts=0;
String yysm=null;

String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date sqrq=null;
String lrbm=null;
String bz=null;
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));

ls=request.getParameter("kssj");
try{
	if (!(ls.equals("")))  kssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[截至时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ljts");
try{
	if (!(ls.equals("")))  ljts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ljts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计天数]类型转换发生意外:"+e);
	return;
}


yysm=cf.GB2Uni(request.getParameter("yysm"));


lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String txzsm=cf.GB2Uni(request.getParameter("txzsm"));
String jtgj=cf.GB2Uni(request.getParameter("jtgj"));
String zwdlr=cf.GB2Uni(request.getParameter("zwdlr"));
String xcsm=cf.GB2Uni(request.getParameter("xcsm"));
double btbz=0;
double zsbz=0;
ls=request.getParameter("btbz");
try{
	if (!(ls.equals("")))  btbz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量btbz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[补贴标准]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbz");
try{
	if (!(ls.equals("")))  zsbz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[住宿标准]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into rs_ccsqd ( sqxh,fgsbh,dwbh,ygbh,yhmc,xb,xzzwbm,kssj,jzsj,ljts   ,yysm,sqrq,lrr,lrsj,lrbm,bz,clzt,ztbm,txzsm,jtgj,btbz,zsbz,zwdlr,xcsm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,'01','1101',?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,fgsbh);
	ps.setString(3,dwbh);
	ps.setLong(4,ygbh);
	ps.setString(5,yhmc);
	ps.setString(6,xb);
	ps.setString(7,xzzwbm);
	ps.setDate(8,kssj);
	ps.setDate(9,jzsj);
	ps.setDouble(10,ljts);

	ps.setString(11,yysm);
	ps.setDate(12,sqrq);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
	ps.setString(17,txzsm);
	ps.setString(18,jtgj);
	ps.setDouble(19,btbz);
	ps.setDouble(20,zsbz);
	ps.setString(21,zwdlr);
	ps.setString(22,xcsm);
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