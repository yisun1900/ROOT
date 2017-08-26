<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String dwbh=(String)session.getAttribute("dwbh");
String ls=null;
String tsjlh=null;
long xtdxh=0;
String khbh=null;
String xtyy=null;
java.sql.Date xtrq=null;
String xtfgs=null;
String xtbm=null;
String xtr=null;
double xtfy=0;
long lrr=0;
java.sql.Date lrsj=null;
String lrrbm=null;
String bz=null;
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
xtyy=cf.GB2Uni(request.getParameter("xtyy"));
ls=request.getParameter("xtrq");
try{
	if (!(ls.equals("")))  xtrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xtrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协调日期]类型转换发生意外:"+e);
	return;
}
xtfgs=cf.GB2Uni(request.getParameter("xtfgs"));
xtbm=cf.GB2Uni(request.getParameter("xtbm"));
xtr=cf.GB2Uni(request.getParameter("xtr"));
ls=request.getParameter("xtfy");
try{
	if (!(ls.equals("")))  xtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协调费用]类型转换发生意外:"+e);
	return;
}
ls=ygbh;
try{
	if (!(ls.equals("")))  lrr=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrr不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入人]类型转换发生意外:"+e);
	return;
}
lrrbm=dwbh;
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select max(xtdxh)+1 xtdxh ";
	ls_sql+=" from crm_tsbxxtd";
	ls_sql+=" where (tsjlh='"+tsjlh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xtdxh=rs.getLong("xtdxh");
	}
	rs.close();
	ps.close();
	if (xtdxh<=0)
	{
		xtdxh=1;
	}
	ls_sql="insert into crm_tsbxxtd ( tsjlh,xtdxh,khbh,xtyy,xtrq,xtfgs,xtbm,xtr,xtfy,lrr,lrsj,lrrbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,SYSDATE,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setLong(2,xtdxh);
	ps.setString(3,khbh);
	ps.setString(4,xtyy);
	ps.setDate(5,xtrq);
	ps.setString(6,xtfgs);
	ps.setString(7,xtbm);
	ps.setString(8,xtr);
	ps.setDouble(9,xtfy);
	ps.setLong(10,lrr);
	ps.setString(11,lrrbm);
	ps.setString(12,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql+xtdxh);
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