<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbm=null;
String dwbh=null;
java.sql.Date khsj=null;
String khr=null;
double cw=0;
double ht=0;
double dmgl=0;
double wj=0;
double wpsb=0;
double bgyp=0;
double xcyp=0;
double gxbb=0;
double jk=0;
double kq=0;
double gzap=0;
double ts=0;
String khxh=null;
//自动产生序号
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(xh))+1,1)";
ls_sql2+=" from  xz_xzzlkhb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
khxh=cf.addZero(xh,7);

khbm=cf.GB2Uni(request.getParameter("khbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("khsj");
try{
	if (!(ls.equals("")))  khsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核时间]类型转换发生意外:"+e);
	return;
}
khr=cf.GB2Uni(request.getParameter("khr"));
ls=request.getParameter("cw");
try{
	if (!(ls.equals("")))  cw=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cw不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[财务15分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ht");
try{
	if (!(ls.equals("")))  ht=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ht不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同10分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dmgl");
try{
	if (!(ls.equals("")))  dmgl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dmgl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面管理10分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wj");
try{
	if (!(ls.equals("")))  wj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[文件5分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wpsb");
try{
	if (!(ls.equals("")))  wpsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wpsb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[物品设备10]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bgyp");
try{
	if (!(ls.equals("")))  bgyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bgyp不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[办公用品5分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xcyp");
try{
	if (!(ls.equals("")))  xcyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xcyp不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[宣传用品5分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxbb");
try{
	if (!(ls.equals("")))  gxbb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxbb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[各项报表15分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jk");
try{
	if (!(ls.equals("")))  jk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[监控5分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kq");
try{
	if (!(ls.equals("")))  kq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考勤7分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gzap");
try{
	if (!(ls.equals("")))  gzap=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gzap不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工作安排8分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ts");
try{
	if (!(ls.equals("")))  ts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它部门及人员投诉5分]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into xz_xzzlkhb ( xh,dwbh,khsj,khr,cw,ht,dmgl,wj,wpsb,bgyp,xcyp,gxbb,jk,kq,gzap,ts,khbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxh);
	ps.setString(2,dwbh);
	ps.setDate(3,khsj);
	ps.setString(4,khr);
	ps.setDouble(5,cw);
	ps.setDouble(6,ht);
	ps.setDouble(7,dmgl);
	ps.setDouble(8,wj);
	ps.setDouble(9,wpsb);
	ps.setDouble(10,bgyp);
	ps.setDouble(11,xcyp);
	ps.setDouble(12,gxbb);
	ps.setDouble(13,jk);
	ps.setDouble(14,kq);
	ps.setDouble(15,gzap);
	ps.setDouble(16,ts);
	ps.setString(17,khbm);
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
	out.print("存盘失败,发生意外: " + e);
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