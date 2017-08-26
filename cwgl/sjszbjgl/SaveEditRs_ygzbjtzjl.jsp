<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double je=0;
String jlh=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
jlh=cf.GB2Uni(request.getParameter("jlh"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherexuhao=null;
wherexuhao=cf.GB2Uni(request.getParameter("wherexuhao"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);



	ls_sql="update rs_ygzbjtzjl set je=?,jlh=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,je);
	ps.setString(2,jlh);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,bz);
	ps.executeUpdate();
	ps.close();

	double allje=0;
	ls_sql="select sum(je)";
	ls_sql+=" from  rs_ygzbjtzjl";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//员工社保信息
	ls_sql="update sq_yhxx set zbj="+allje;
	ls_sql+=" where ygbh="+ygbh;
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
	out.print("<BR>出错:" + e);
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