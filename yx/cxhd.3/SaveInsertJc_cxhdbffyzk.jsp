<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

double clfzk=0;
ls=request.getParameter("clfzk");
try{
	if (!(ls.equals("")))  clfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材费折扣]类型转换发生意外:"+e);
	return;
}

double zcfzk=0;
ls=request.getParameter("zcfzk");
try{
	if (!(ls.equals("")))  zcfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材费折扣]类型转换发生意外:"+e);
	return;
}

double rgfzk=0;
ls=request.getParameter("rgfzk");
try{
	if (!(ls.equals("")))  rgfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费折扣]类型转换发生意外:"+e);
	return;
}

double ysfzk=0;
ls=request.getParameter("ysfzk");
try{
	if (!(ls.equals("")))  ysfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费折扣]类型转换发生意外:"+e);
	return;
}

double jxfzk=0;
ls=request.getParameter("jxfzk");
try{
	if (!(ls.equals("")))  jxfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械费折扣]类型转换发生意外:"+e);
	return;
}

double shfzk=0;
ls=request.getParameter("shfzk");
try{
	if (!(ls.equals("")))  shfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗费折扣]类型转换发生意外:"+e);
	return;
}

double qtfzk=0;
ls=request.getParameter("qtfzk");
try{
	if (!(ls.equals("")))  qtfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费折扣]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhdbffyzk  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cxhdbffyzk ( cxhdbm,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdbm);
	ps.setDouble(2,clfzk);
	ps.setDouble(3,zcfzk);
	ps.setDouble(4,rgfzk);
	ps.setDouble(5,ysfzk);
	ps.setDouble(6,jxfzk);
	ps.setDouble(7,shfzk);
	ps.setDouble(8,qtfzk);

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