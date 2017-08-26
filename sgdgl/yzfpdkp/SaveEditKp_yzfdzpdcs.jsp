<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
double pjde=0;
long grs=0;
double zbj=0;
double khmyd=0;
long zxzsgds=0;
long zdzsgds=0;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("pjde");
try{
	if (!(ls.equals("")))  pjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上一年度的平均单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("grs");
try{
	if (!(ls.equals("")))  grs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[班组工人最小值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zbj");
try{
	if (!(ls.equals("")))  zbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质保金最小值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khmyd");
try{
	if (!(ls.equals("")))  khmyd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khmyd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户满意度最小值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zxzsgds");
try{
	if (!(ls.equals("")))  zxzsgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxzsgds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[班组最小在施工地数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zdzsgds");
try{
	if (!(ls.equals("")))  zdzsgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdzsgds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[班组最大在施工地数]类型转换发生意外:"+e);
	return;
}
String wheressfgs=null;
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_yzfdzpdcs set ssfgs=?,pjde=?,grs=?,zbj=?,khmyd=?,zxzsgds=?,zdzsgds=? ";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setDouble(2,pjde);
	ps.setLong(3,grs);
	ps.setDouble(4,zbj);
	ps.setDouble(5,khmyd);
	ps.setLong(6,zxzsgds);
	ps.setLong(7,zdzsgds);
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
	out.print("<BR>出错:" + e);
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