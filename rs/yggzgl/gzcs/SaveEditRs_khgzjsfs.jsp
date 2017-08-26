<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
String ssfgs=null;
String sjsjb=null;
double yjxx=0;
double yjsx=0;
double khgz=0;
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
sjsjb=cf.GB2Uni(request.getParameter("sjsjb"));
ls=request.getParameter("yjxx");
try{
	if (!(ls.equals("")))  yjxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjxx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩下限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjsx");
try{
	if (!(ls.equals("")))  yjsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjsx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩上限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khgz");
try{
	if (!(ls.equals("")))  khgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核工资]类型转换发生意外:"+e);
	return;
}
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_khgzjsfs set xh=?,ssfgs=?,sjsjb=?,yjxx=?,yjsx=?,khgz=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ssfgs);
	ps.setString(3,sjsjb);
	ps.setDouble(4,yjxx);
	ps.setDouble(5,yjsx);
	ps.setDouble(6,khgz);
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