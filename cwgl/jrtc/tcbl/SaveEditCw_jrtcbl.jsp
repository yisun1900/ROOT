<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
double clyzxftcbl=0;
String lrr=null;
java.sql.Date lrsj=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("dzsjftcbl");
try{
	if (!(ls.equals("")))  dzsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzsjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzzxftcbl");
try{
	if (!(ls.equals("")))  dzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wyzxftcbl");
try{
	if (!(ls.equals("")))  wyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[文员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlsjftcbl");
try{
	if (!(ls.equals("")))  khjlsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlsjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业务员设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlzxftcbl");
try{
	if (!(ls.equals("")))  khjlzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业务员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjssjftcbl");
try{
	if (!(ls.equals("")))  sjssjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjssjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjszxftcbl");
try{
	if (!(ls.equals("")))  sjszxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjszxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsycftcbl");
try{
	if (!(ls.equals("")))  sjsycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsycftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师远程费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjzxftcbl");
try{
	if (!(ls.equals("")))  zjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjycftcbl");
try{
	if (!(ls.equals("")))  zjycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjycftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理远程费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgzxftcbl");
try{
	if (!(ls.equals("")))  xqzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzzzxftcbl");
try{
	if (!(ls.equals("")))  xqzzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzzzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzyzxftcbl");
try{
	if (!(ls.equals("")))  xqzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgzxftcbl");
try{
	if (!(ls.equals("")))  wlyxzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxzyzxftcbl");
try{
	if (!(ls.equals("")))  yxzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[营销专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzchzxftcbl");
try{
	if (!(ls.equals("")))  wzchzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzchzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站策划装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wysjzxftcbl");
try{
	if (!(ls.equals("")))  wysjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wysjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网页设计装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzcxyzxftcbl");
try{
	if (!(ls.equals("")))  wzcxyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzcxyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站程序员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhzyzxftcbl");
try{
	if (!(ls.equals("")))  dhzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dhzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电话专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgyzxftcbl");
try{
	if (!(ls.equals("")))  wztgyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzxftcbl");
try{
	if (!(ls.equals("")))  sjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[司机装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyzxftcbl");
try{
	if (!(ls.equals("")))  clyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员装修费提成比例]类型转换发生意外:"+e);
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
String wherefgsbh=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jrtcbl set fgsbh=?,dzsjftcbl=?,dzzxftcbl=?,wyzxftcbl=?,khjlsjftcbl=?,khjlzxftcbl=?,sjssjftcbl=?,sjszxftcbl=?,sjsycftcbl=?,zjzxftcbl=?,zjycftcbl=?,xqzgzxftcbl=?,xqzzzxftcbl=?,xqzyzxftcbl=?,wlyxzgzxftcbl=?,yxzyzxftcbl=?,wzchzxftcbl=?,wysjzxftcbl=?,wzcxyzxftcbl=?,dhzyzxftcbl=?,wztgyzxftcbl=?,sjzxftcbl=?,clyzxftcbl=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setDouble(2,dzsjftcbl);
	ps.setDouble(3,dzzxftcbl);
	ps.setDouble(4,wyzxftcbl);
	ps.setDouble(5,khjlsjftcbl);
	ps.setDouble(6,khjlzxftcbl);
	ps.setDouble(7,sjssjftcbl);
	ps.setDouble(8,sjszxftcbl);
	ps.setDouble(9,sjsycftcbl);
	ps.setDouble(10,zjzxftcbl);
	ps.setDouble(11,zjycftcbl);
	ps.setDouble(12,xqzgzxftcbl);
	ps.setDouble(13,xqzzzxftcbl);
	ps.setDouble(14,xqzyzxftcbl);
	ps.setDouble(15,wlyxzgzxftcbl);
	ps.setDouble(16,yxzyzxftcbl);
	ps.setDouble(17,wzchzxftcbl);
	ps.setDouble(18,wysjzxftcbl);
	ps.setDouble(19,wzcxyzxftcbl);
	ps.setDouble(20,dhzyzxftcbl);
	ps.setDouble(21,wztgyzxftcbl);
	ps.setDouble(22,sjzxftcbl);
	ps.setDouble(23,clyzxftcbl);
	ps.setString(24,lrr);
	ps.setDate(25,lrsj);
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