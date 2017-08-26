<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double gckk=0;
double sjsfy=0;
double sgdfy=0;
double zjfy=0;
double gsfy=0;
double qtfy=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String spbz=null;
String jsbz=null;
String bz=null;
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsfy");
try{
	if (!(ls.equals("")))  sjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdfy");
try{
	if (!(ls.equals("")))  sgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjfy");
try{
	if (!(ls.equals("")))  zjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质检承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsfy");
try{
	if (!(ls.equals("")))  gsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtfy");
try{
	if (!(ls.equals("")))  qtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它方承担费用]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
//spbz=cf.GB2Uni(request.getParameter("spbz"));
//jsbz=cf.GB2Uni(request.getParameter("jsbz"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekkjlh=null;
wherekkjlh=cf.GB2Uni(request.getParameter("wherekkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update cw_gckkjl set gckk=?,sjsfy=?,sgdfy=?,zjfy=?,gsfy=?,qtfy=?,spgckk=?,spsjsfy=?,spsgdfy=?,spzjfy=?,spgsfy=?,spqtfy=?,lrr=?,lrsj=?,lrbm=?,spbz='2',bz=? ";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"' and cw_gckkjl.spbz in('2','4') and jsbz='N')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gckk);
	ps.setDouble(2,sjsfy);
	ps.setDouble(3,sgdfy);
	ps.setDouble(4,zjfy);
	ps.setDouble(5,gsfy);
	ps.setDouble(6,qtfy);
	ps.setDouble(7,gckk);
	ps.setDouble(8,sjsfy);
	ps.setDouble(9,sgdfy);
	ps.setDouble(10,zjfy);
	ps.setDouble(11,gsfy);
	ps.setDouble(12,qtfy);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
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