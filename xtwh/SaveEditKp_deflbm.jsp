<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String deflbm=null;
String deflmc=null;
long dedy=0;
long dexy=0;
long depjz=0;
deflbm=cf.GB2Uni(request.getParameter("deflbm"));
deflmc=cf.GB2Uni(request.getParameter("deflmc"));
ls=request.getParameter("dedy");
try{
	if (!(ls.equals("")))  dedy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dedy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单额大于]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dexy");
try{
	if (!(ls.equals("")))  dexy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dexy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单额小于]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("depjz");
try{
	if (!(ls.equals("")))  depjz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量depjz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单额平均值]类型转换发生意外:"+e);
	return;
}
String wheredeflbm=null;
wheredeflbm=cf.GB2Uni(request.getParameter("wheredeflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_deflbm set deflbm=?,deflmc=?,dedy=?,dexy=?,depjz=? ";
	ls_sql+=" where  (deflbm='"+wheredeflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,deflbm);
	ps.setString(2,deflmc);
	ps.setLong(3,dedy);
	ps.setLong(4,dexy);
	ps.setLong(5,depjz);
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