<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String mc=null;
String zjxbz=null;
double je=0;
String cls=null;
String ptr=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
mc=cf.GB2Uni(request.getParameter("mc"));
zjxbz=cf.GB2Uni(request.getParameter("zjxbz"));
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
cls=cf.GB2Uni(request.getParameter("cls"));
ptr=cf.GB2Uni(request.getParameter("ptr"));
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into cw_zqkzjxmx ( khbh,mc,zjxbz,je,cls,ptr,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,mc);
	ps.setString(3,zjxbz);
	ps.setDouble(4,je);
	ps.setString(5,cls);
	ps.setString(6,ptr);
	ps.setString(7,bz);
	ps.executeUpdate();
	ps.close();

	double allje=0;
	ls_sql="select sum(je) ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_zqkzjxdj set sjysje=eqkje+"+allje;
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>