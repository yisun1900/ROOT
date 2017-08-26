<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjqk=null;
double sqdj=0;
String clgw=null;
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date jhccsj=null;
String dwbh=null;
String bz=null;
wjqk=cf.GB2Uni(request.getParameter("wjqk"));
ls=request.getParameter("sqdj");
try{
	if (!(ls.equals("")))  sqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测时间]类型转换发生意外:"+e);
	return;
}
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

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String cxhdbm=request.getParameter("cxhdbm");
String wjsgsbz=null;
if (wjqk.equals("1"))//1：客户自购；2：公司购买
{
	wjsgsbz="N";
}

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmydd set wjqk=?,sqdj=?,clgw=?,lrr=?,lrsj=?,dwbh=?,bz=?,jhccsj=?,wjsgsbz=?,ztjjgw=? ";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjqk);
	ps.setDouble(2,sqdj);
	ps.setString(3,clgw);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,dwbh);
	ps.setString(7,bz);
	ps.setDate(8,jhccsj);
	ps.setString(9,wjsgsbz);
	ps.setString(10,ztjjgw);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
	out.print("Exception: " + e);
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