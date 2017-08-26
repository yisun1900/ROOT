<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kkjlh=null;
String khbh=null;
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
kkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
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
spbz=cf.GB2Uni(request.getParameter("spbz"));
jsbz=cf.GB2Uni(request.getParameter("jsbz"));
bz=cf.GB2Uni(request.getParameter("bz"));
out.print(jsbz);
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_gckkjl ( kkjlh,khbh,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,spgckk,spsjsfy,spsgdfy,spzjfy,spgsfy,spqtfy,lrr,lrsj,lrbm,spbz,jsbz,sjsjsbz,zjjsbz,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'2','N','N','N',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kkjlh);
	ps.setString(2,khbh);
	ps.setDouble(3,gckk);
	ps.setDouble(4,sjsfy);
	ps.setDouble(5,sgdfy);
	ps.setDouble(6,zjfy);
	ps.setDouble(7,gsfy);
	ps.setDouble(8,qtfy);
	ps.setDouble(9,gckk);
	ps.setDouble(10,sjsfy);
	ps.setDouble(11,sgdfy);
	ps.setDouble(12,zjfy);
	ps.setDouble(13,gsfy);
	ps.setDouble(14,qtfy);
	ps.setString(15,lrr);
	ps.setDate(16,lrsj);
	ps.setString(17,lrbm);
	ps.setString(18,bz);
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