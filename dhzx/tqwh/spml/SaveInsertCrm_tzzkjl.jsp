<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=request.getParameter("khbh");
String mlspbz=request.getParameter("mlspbz");
String mlspyj=cf.GB2Uni(request.getParameter("mlspyj"));
String mlspr=null;
java.sql.Date mlspsj=null;

mlspr=cf.GB2Uni(request.getParameter("mlspr"));
ls=request.getParameter("mlspsj");
try{
	if (!(ls.equals("")))  mlspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mlspsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}

double rfsgcb=0;
ls=request.getParameter("rfsgcb");
try{
	if (!(ls.equals("")))  rfsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rfsgcb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人辅施工成本价]类型转换发生意外:"+e);
	return;
}

double rfjz=0;
ls=request.getParameter("rfjz");
try{
	if (!(ls.equals("")))  rfjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rfjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人辅净值]类型转换发生意外:"+e);
	return;
}

double rfmll=0;
ls=request.getParameter("rfmll");
try{
	if (!(ls.equals("")))  rfmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rfmll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人辅毛利率]类型转换发生意外:"+e);
	return;
}

double zcxse=0;
ls=request.getParameter("zcxse");
try{
	if (!(ls.equals("")))  zcxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcxse]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材销售额]类型转换发生意外:"+e);
	return;
}

double zccb=0;
ls=request.getParameter("zccb");
try{
	if (!(ls.equals("")))  zccb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zccb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材成本]类型转换发生意外:"+e);
	return;
}

double zcmll=0;
ls=request.getParameter("zcmll");
try{
	if (!(ls.equals("")))  zcmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcmll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材毛利率]类型转换发生意外:"+e);
	return;
}

double khmll=0;
ls=request.getParameter("khmll");
try{
	if (!(ls.equals("")))  khmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khmll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户毛利率]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_zxkhxx set rfsgcb=?,rfjz=?,rfmll=?,zcxse=?,zccb=?,zcmll=?,khmll=?,mlspbz=?,mlspr=?,mlspsj=?,mlspyj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,rfsgcb);
	ps.setDouble(2,rfjz);
	ps.setDouble(3,rfmll);
	ps.setDouble(4,zcxse);
	ps.setDouble(5,zccb);
	ps.setDouble(6,zcmll);
	ps.setDouble(7,khmll);
	ps.setString(8,mlspbz);
	ps.setString(9,mlspr);
	ps.setDate(10,mlspsj);
	ps.setString(11,mlspyj);
	ps.executeUpdate();
	ps.close();


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