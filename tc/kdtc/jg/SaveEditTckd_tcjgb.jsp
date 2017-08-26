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
double tlgbzjj=0;
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
	out.println("<BR>[套内基准面积]类型转换发生意外:"+e);
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
	out.println("<BR>[套餐价格]类型转换发生意外:"+e);
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
ls=request.getParameter("tlgbzjj");
try{
	if (!(ls.equals("")))  tlgbzjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tlgbzjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[涂料改为壁纸加价]类型转换发生意外:"+e);
	return;
}

double dbhddzjj=0;
ls=request.getParameter("dbhddzjj");
try{
	if (!(ls.equals("")))  dbhddzjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dbhddzjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地板换大磁砖收费]类型转换发生意外:"+e);
	return;
}
String wheredqbm=null;
String wherebjjbbm=null;
String wherehxbm=null;
String wheretcmc=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
wheretcmc=cf.GB2Uni(request.getParameter("wheretcmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckd_tcjgb set dqbm=?,bjjbbm=?,hxbm=?,tcmc=?,fwmj=?,tcjg=?,pmzjdj=?,tlgbzjj=?,dbhddzjj=? ";
	ls_sql+=" where  (tcmc='"+wheretcmc+"') and  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,hxbm);
	ps.setString(4,tcmc);
	ps.setLong(5,fwmj);
	ps.setDouble(6,tcjg);
	ps.setDouble(7,pmzjdj);
	ps.setDouble(8,tlgbzjj);
	ps.setDouble(9,dbhddzjj);
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