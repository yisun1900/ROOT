<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlh=null;
String sgd=null;
java.sql.Date jlsj=null;
String jlr=null;
double jlje=0;
String jlyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jlh=cf.GB2Uni(request.getParameter("jlh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
ls=request.getParameter("jlsj");
try{
	if (!(ls.equals("")))  jlsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jlsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励时间]类型转换发生意外:"+e);
	return;
}
jlr=cf.GB2Uni(request.getParameter("jlr"));
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jlje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}
jlyy=cf.GB2Uni(request.getParameter("jlyy"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into cw_sgdjljl ( jlh,sgd,jlsj,jlr,jlje,jlyy,lrr,lrsj,lrbm,bz,zt,scbz,sgbz,jsbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'1','N',?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlh);
	ps.setString(2,sgd);
	ps.setDate(3,jlsj);
	ps.setString(4,jlr);
	ps.setDouble(5,jlje);
	ps.setString(6,jlyy);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,sgbz);
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