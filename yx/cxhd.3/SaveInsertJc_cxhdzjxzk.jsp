<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

double gczjxfzk=0;
ls=request.getParameter("gczjxfzk");
try{
	if (!(ls.equals("")))  gczjxfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gczjxfzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程增减项折扣]类型转换发生意外:"+e);
	return;
}

double glfzjxzk=0;
ls=request.getParameter("glfzjxzk");
try{
	if (!(ls.equals("")))  glfzjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[glfzjxzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费增减项折扣]类型转换发生意外:"+e);
	return;
}

double sjzjxzk=0;
ls=request.getParameter("sjzjxzk");
try{
	if (!(ls.equals("")))  sjzjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzjxzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金增减项折扣]类型转换发生意外:"+e);
	return;
}

double sjfzjxzk=0;
ls=request.getParameter("sjfzjxzk");
try{
	if (!(ls.equals("")))  sjfzjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjfzjxzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费增减项折扣]类型转换发生意外:"+e);
	return;
}

double qtsfxmzjxzk=0;
ls=request.getParameter("qtsfxmzjxzk");
try{
	if (!(ls.equals("")))  qtsfxmzjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtsfxmzjxzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目增减项折扣]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhdzjxzk  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cxhdzjxzk ( cxhdbm,gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk) ";
	ls_sql+=" values ( ?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdbm);
	ps.setDouble(2,gczjxfzk);
	ps.setDouble(3,glfzjxzk);
	ps.setDouble(4,sjzjxzk);
	ps.setDouble(5,sjfzjxzk);
	ps.setDouble(6,qtsfxmzjxzk);

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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL" + ls_sql);
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