<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlh=null;
String sgd=null;
String gdyp=null;
double dj=0;
double sl=0;
double je=0;
String jkblr=null;
java.sql.Date jkblsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jlh=cf.GB2Uni(request.getParameter("jlh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
gdyp=cf.GB2Uni(request.getParameter("gdyp"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
jkblr=cf.GB2Uni(request.getParameter("jkblr"));
ls=request.getParameter("jkblsj");
try{
	if (!(ls.equals("")))  jkblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jkblsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[办理时间]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherejlh=null;
wherejlh=cf.GB2Uni(request.getParameter("wherejlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_fllyjl set jlh=?,sgd=?,gdyp=?,dj=?,sl=?,je=?,jkblr=?,jkblsj=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (jlh='"+wherejlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlh);
	ps.setString(2,sgd);
	ps.setString(3,gdyp);
	ps.setDouble(4,dj);
	ps.setDouble(5,sl);
	ps.setDouble(6,je);
	ps.setString(7,jkblr);
	ps.setDate(8,jkblsj);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,bz);
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