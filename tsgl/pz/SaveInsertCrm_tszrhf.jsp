<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tsjlh=null;
String khbh=null;
String pzyy=null;
String pzr=null;
java.sql.Date pzsj=null;
double cjzrbl=0;
double sgdzrbl=0;
double khzrbl=0;
double gszrbl=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
pzyy=cf.GB2Uni(request.getParameter("pzyy"));
pzr=cf.GB2Uni(request.getParameter("pzr"));
ls=request.getParameter("pzsj");
try{
	if (!(ls.equals("")))  pzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[判则时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjzrbl");
try{
	if (!(ls.equals("")))  cjzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cjzrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厂家责任比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdzrbl");
try{
	if (!(ls.equals("")))  sgdzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgdzrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队责任比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khzrbl");
try{
	if (!(ls.equals("")))  khzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khzrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户责任比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gszrbl");
try{
	if (!(ls.equals("")))  gszrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gszrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司责任比例]类型转换发生意外:"+e);
	return;
}
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from crm_tszrhf ";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_tsjl set sfpz='Y' ";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tszrhf ( tsjlh,khbh,pzyy,pzr,pzsj,cjzrbl,sgdzrbl,khzrbl,gszrbl,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,khbh);
	ps.setString(3,pzyy);
	ps.setString(4,pzr);
	ps.setDate(5,pzsj);
	ps.setDouble(6,cjzrbl);
	ps.setDouble(7,sgdzrbl);
	ps.setDouble(8,khzrbl);
	ps.setDouble(9,gszrbl);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
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