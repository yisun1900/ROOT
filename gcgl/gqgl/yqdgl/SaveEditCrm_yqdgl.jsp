<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sqsj=null;
long zjts=0;
String sqyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
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
	out.println("<BR>变量[zjts]不存在");
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

String yqbh=cf.GB2Uni(request.getParameter("yqbh"));

String yqdbh=null;
yqdbh=cf.GB2Uni(request.getParameter("yqdbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_yqdgl set sqsj=?,zjts=?,sqyy=?,lrr=?,lrsj=?,lrbm=? ,bz=?,yqbh=?";
	ls_sql+=" where  (yqdbh='"+yqdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqsj);
	ps.setLong(2,zjts);
	ps.setString(3,sqyy);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
	ps.setString(7,bz);
	ps.setString(8,yqbh);
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