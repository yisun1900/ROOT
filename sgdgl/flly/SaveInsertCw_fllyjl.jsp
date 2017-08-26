<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlh=null;
String sgd=null;
double zsl=0;
double zje=0;
String jkblr=null;
java.sql.Date jkblsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jlh=cf.GB2Uni(request.getParameter("jlh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
ls=request.getParameter("zsl");
try{
	if (!(ls.equals("")))  zsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zje");
try{
	if (!(ls.equals("")))  zje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
jkblr=cf.GB2Uni(request.getParameter("jkblr"));
ls=request.getParameter("jkblsj");
try{
	if (!(ls.equals("")))  jkblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jkblsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[办理时间]类型转换发生意外:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_fllyjl ( jlh,sgd,zsl,zje,jkblr,jkblsj,lrr,lrsj,lrbm,bz,ssfgs,jsbz,scbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,'0','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlh);
	ps.setString(2,sgd);
	ps.setDouble(3,zsl);
	ps.setDouble(4,zje);
	ps.setString(5,jkblr);
	ps.setDate(6,jkblsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,ssfgs);
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