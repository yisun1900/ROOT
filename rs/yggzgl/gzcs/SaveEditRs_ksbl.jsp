<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
String ssfgs=null;
String gzfw=null;
double gzxx=0;
double gzsx=0;
double gsbl=0;
double gdsj=0;
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
gzfw=cf.GB2Uni(request.getParameter("gzfw"));
ls=request.getParameter("gzxx");
try{
	if (!(ls.equals("")))  gzxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gzxx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工资下限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gzsx");
try{
	if (!(ls.equals("")))  gzsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gzsx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工资上限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsbl");
try{
	if (!(ls.equals("")))  gsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[个税比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdsj");
try{
	if (!(ls.equals("")))  gdsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[固定税金]类型转换发生意外:"+e);
	return;
}
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_ksbl set xh=?,ssfgs=?,gzfw=?,gzxx=?,gzsx=?,gsbl=?,gdsj=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ssfgs);
	ps.setString(3,gzfw);
	ps.setDouble(4,gzxx);
	ps.setDouble(5,gzsx);
	ps.setDouble(6,gsbl);
	ps.setDouble(7,gdsj);
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