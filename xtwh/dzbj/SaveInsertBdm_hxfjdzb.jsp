<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hxbm=null;
String jgwzmc=null;
double fjmj=0;
int fjlx=0;
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
jgwzmc=cf.GB2Uni(request.getParameter("jgwzmc"));
ls=request.getParameter("fjmj");
try{
	if (!(ls.equals("")))  fjmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fjmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房间面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fjlx");
try{
	if (!(ls.equals("")))  fjlx=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fjlx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房间类型]类型转换发生意外:"+e);
	return;
}

int xuhao=0;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xuhao]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into bdm_hxfjdzb ( hxbm,jgwzmc,fjmj,fjlx,xuhao ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,jgwzmc);
	ps.setDouble(3,fjmj);
	ps.setInt(4,fjlx);
	ps.setInt(5,xuhao);
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