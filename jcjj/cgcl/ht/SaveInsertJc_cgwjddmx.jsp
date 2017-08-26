<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String wjbm=null;
double dj=0;
long sl=0;
double je=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
wjbm=cf.GB2Uni(request.getParameter("wjbm"));
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
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double wjhtze=0;
double zsje=0;
double htze=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into jc_cgwjddmx ( ddbh,wjbm,dj,sl,je,bz,lx,jxbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,'1','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,wjbm);
	ps.setDouble(3,dj);
	ps.setLong(4,sl);
	ps.setDouble(5,je);
	ps.setString(6,bz);
	ps.executeUpdate();
	ps.close();

/*
	ls_sql="select sum(je)";
	ls_sql+=" from  jc_cgwjddmx";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjhtze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select cghtze+"+wjhtze+"+dqhtze,zsje";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htze=rs.getDouble(1);
		zsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	
	ls_sql="update jc_cgdd set wjhtze=?,htze=?,ssje=?";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wjhtze);
	ps.setDouble(2,htze);
	ps.setDouble(3,htze-zsje);
	ps.executeUpdate();
	ps.close();
*/

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
//	alert("存盘成功！五金合同总额=<%=wjhtze%>，合同总额=<%=htze%>，赠送金额＝<%=zsje%>，实收金额=<%=htze-zsje%>");
	alert("存盘成功！");
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