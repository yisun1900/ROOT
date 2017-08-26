<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String tcmc=null;
long fwmj=0;
double tcjg=0;
double pmzjdj=0;
double cpjg=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fwmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起价面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcjg");
try{
	if (!(ls.equals("")))  tcjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐总价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pmzjdj");
try{
	if (!(ls.equals("")))  pmzjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pmzjdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平米增加单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cpjg");
try{
	if (!(ls.equals("")))  cpjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cpjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产品起包价]类型转换发生意外:"+e);
	return;
}

double sgjg=0;
ls=request.getParameter("sgjg");
try{
	if (!(ls.equals("")))  sgjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工起包价]类型转换发生意外:"+e);
	return;
}
double jjjg=0;
ls=request.getParameter("jjjg");
try{
	if (!(ls.equals("")))  jjjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家具起包价]类型转换发生意外:"+e);
	return;
}

String wheredqbm=null;
String wherebjjbbm=null;
String wherehxbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckb_tcjgb set dqbm=?,bjjbbm=?,hxbm=?,tcmc=?,fwmj=?,tcjg=?,pmzjdj=?,cpjg=?,sgjg=?,jjjg=? ";
	ls_sql+=" where  (bjbbh='"+bjbbh+"') and (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,hxbm);
	ps.setString(4,tcmc);
	ps.setLong(5,fwmj);
	ps.setDouble(6,tcjg);
	ps.setDouble(7,pmzjdj);
	ps.setDouble(8,cpjg);
	ps.setDouble(9,sgjg);
	ps.setDouble(10,jjjg);
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