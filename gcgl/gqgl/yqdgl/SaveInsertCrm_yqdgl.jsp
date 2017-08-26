<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yqdbh=null;
String yqbh=null;
java.sql.Date sqsj=null;
long zjts=0;
String sqyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
yqdbh=cf.GB2Uni(request.getParameter("yqdbh"));
yqbh=cf.GB2Uni(request.getParameter("yqbh"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjts");
try{
	if (!(ls.equals("")))  zjts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工期增加天数]类型转换发生意外:"+e);
	return;
}
sqyy=cf.GB2Uni(request.getParameter("sqyy"));
bz=cf.GB2Uni(request.getParameter("bz"));
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
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_yqdgl ( yqdbh,khbh,sqsj,zjts,sqyy,lrr,lrsj,lrbm,clzt,bz,yqbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,'1',?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yqdbh);
	ps.setString(2,khbh);
	ps.setDate(3,sqsj);
	ps.setLong(4,zjts);
	ps.setString(5,sqyy);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,yqbh);
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