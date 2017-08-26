<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mlx=null;
String mlxmc=null;
mlx=cf.GB2Uni(request.getParameter("mlx"));
mlxmc=cf.GB2Uni(request.getParameter("mlxmc"));
int gdbxy=0;
ls=request.getParameter("gdbxy");
try{
	if (!(ls.equals("")))  gdbxy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdbxy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高度不小于]类型转换发生意外:"+e);
	return;
}
int gdbdy=0;
ls=request.getParameter("gdbdy");
try{
	if (!(ls.equals("")))  gdbdy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdbdy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高度不大于]类型转换发生意外:"+e);
	return;
}
int kdbxy=0;
ls=request.getParameter("kdbxy");
try{
	if (!(ls.equals("")))  kdbxy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdbxy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[宽度不小于]类型转换发生意外:"+e);
	return;
}
int kdbdy=0;
ls=request.getParameter("kdbdy");
try{
	if (!(ls.equals("")))  kdbdy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdbdy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[宽度不大于]类型转换发生意外:"+e);
	return;
}
String tx=cf.GB2Uni(request.getParameter("tx"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_mlx ( mlx,mlxmc,gdbxy,gdbdy,kdbxy,kdbdy,tx) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mlx);
	ps.setString(2,mlxmc);
	ps.setInt(3,gdbxy);
	ps.setInt(4,gdbdy);
	ps.setInt(5,kdbxy);
	ps.setInt(6,kdbdy);
	ps.setString(7,tx);
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
	out.print("存盘失败,发生意外: " + e);
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