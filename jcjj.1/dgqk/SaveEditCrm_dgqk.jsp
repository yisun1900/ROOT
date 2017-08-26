<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String cpbm=null;
String clgw=null;
String pp=null;
String gys=null;
long sjfy=0;
java.sql.Date yazrq=null;
long sl=0;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
pp=cf.GB2Uni(request.getParameter("pp"));
gys=cf.GB2Uni(request.getParameter("gys"));
ls=request.getParameter("sjfy");
try{
	if (!(ls.equals("")))  sjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yazrq");
try{
	if (!(ls.equals("")))  yazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yazrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应安装日期]类型转换发生意外:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekhbh=null;
String wherecpbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_dgqk set khbh=?,cpbm=?,clgw=?,pp=?,gys=?,sjfy=?,yazrq=?,sl=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,cpbm);
	ps.setString(3,clgw);
	ps.setString(4,pp);
	ps.setString(5,gys);
	ps.setLong(6,sjfy);
	ps.setDate(7,yazrq);
	ps.setLong(8,sl);
	ps.setString(9,bz);
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