<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String tcmc=null;
double mjpmdj=0;
long tnzxjjmj=0;
double cfdj=0;
long cfbzmj=0;
double cfccmjdj=0;
double wsjdj=0;
long wsjbzmj=0;
double wsjccmjdj=0;
double tlgbzjmj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("mjpmdj");
try{
	if (!(ls.equals("")))  mjpmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mjpmdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积平米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tnzxjjmj");
try{
	if (!(ls.equals("")))  tnzxjjmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tnzxjjmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套内最小计价面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cfdj");
try{
	if (!(ls.equals("")))  cfdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cfdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厨房单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cfbzmj");
try{
	if (!(ls.equals("")))  cfbzmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cfbzmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厨房标准面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cfccmjdj");
try{
	if (!(ls.equals("")))  cfccmjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cfccmjdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厨房超出面积单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wsjdj");
try{
	if (!(ls.equals("")))  wsjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wsjdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[卫生间单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wsjbzmj");
try{
	if (!(ls.equals("")))  wsjbzmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wsjbzmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[卫生间标准面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wsjccmjdj");
try{
	if (!(ls.equals("")))  wsjccmjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wsjccmjdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[卫生间超出面积单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tlgbzjmj");
try{
	if (!(ls.equals("")))  tlgbzjmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tlgbzjmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[涂料改为壁纸减免价]类型转换发生意外:"+e);
	return;
}
String wheredqbm=null;
String wherebjjbbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tc_csrjtcjgb set dqbm=?,bjjbbm=?,tcmc=?,mjpmdj=?,tnzxjjmj=?,cfdj=?,cfbzmj=?,cfccmjdj=?,wsjdj=?,wsjbzmj=?,wsjccmjdj=?,tlgbzjmj=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,tcmc);
	ps.setDouble(4,mjpmdj);
	ps.setLong(5,tnzxjjmj);
	ps.setDouble(6,cfdj);
	ps.setLong(7,cfbzmj);
	ps.setDouble(8,cfccmjdj);
	ps.setDouble(9,wsjdj);
	ps.setLong(10,wsjbzmj);
	ps.setDouble(11,wsjccmjdj);
	ps.setDouble(12,tlgbzjmj);
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