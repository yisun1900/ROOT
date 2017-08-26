<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
long xh=0;
double dj=0;
long sl=0;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金件序号]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
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
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double wjzxje=0;

try {
	conn=cf.getConnection();

	int wjxh=0;
	ls_sql="select NVL(max(lrxh),0)";
	ls_sql+=" from  jc_wjjddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjxh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	wjxh++;

	conn.setAutoCommit(false);

	ls_sql="insert into jc_wjjddmx ( yddbh,xh,dj,sl,lx,bz,lrxh ) ";
	ls_sql+=" values ( ?,?,?,?,'2',?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setLong(2,xh);
	ps.setDouble(3,dj);
	ps.setLong(4,sl);
	ps.setString(5,bz);
	ps.setInt(6,wjxh);
	ps.executeUpdate();
	ps.close();

	ls_sql="select sum(dj*sl)";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  yddbh='"+yddbh+"' and lx='2'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjzxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="update jc_mmydd set wjzxje=?";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wjzxje);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！五金增项总额=<%=wjzxje%>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>