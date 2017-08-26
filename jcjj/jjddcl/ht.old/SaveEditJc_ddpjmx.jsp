<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gtxh=0;
String ddbh=null;
String jjpjmcbm=null;
String pjxh=null;
long pjcd=0;
long pjkd=0;
long pjgd=0;
long sl=0;
long dj=0;
long je=0;
String bz=null;
String xinghao=null;
ls=request.getParameter("gtxh");
try{
	if (!(ls.equals("")))  gtxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体序号]类型转换发生意外:"+e);
	return;
}
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
jjpjmcbm=cf.GB2Uni(request.getParameter("jjpjmcbm"));
pjxh=cf.GB2Uni(request.getParameter("pjxh"));
ls=request.getParameter("pjcd");
try{
	if (!(ls.equals("")))  pjcd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件长度（mm）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjkd");
try{
	if (!(ls.equals("")))  pjkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjkd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件宽度（mm）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjgd");
try{
	if (!(ls.equals("")))  pjgd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjgd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件高度（mm）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String wherepjxh=null;
wherepjxh=cf.GB2Uni(request.getParameter("wherepjxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_ddpjmx set gtxh=?,ddbh=?,jjpjmcbm=?,pjxh=?,pjcd=?,pjkd=?,pjgd=?,sl=?,dj=?,je=?,bz=?,xinghao=? ";
	ls_sql+=" where  (pjxh='"+wherepjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,jjpjmcbm);
	ps.setString(4,pjxh);
	ps.setLong(5,pjcd);
	ps.setLong(6,pjkd);
	ps.setLong(7,pjgd);
	ps.setLong(8,sl);
	ps.setLong(9,dj);
	ps.setLong(10,je);
	ps.setString(11,bz);
	ps.setString(12,xinghao);
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