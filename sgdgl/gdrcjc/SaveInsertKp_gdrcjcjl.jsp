<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jcjlh=null;
String khbh=null;
String sgd=null;
String jcr=null;
java.sql.Date jcsj=null;
String rcjclxbm=null;
String rcjcjgbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
jcr=cf.GB2Uni(request.getParameter("jcr"));
ls=request.getParameter("jcsj");
try{
	if (!(ls.equals("")))  jcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jcsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[检查时间]类型转换发生意外:"+e);
	return;
}
rcjclxbm=cf.GB2Uni(request.getParameter("rcjclxbm"));
rcjcjgbm=cf.GB2Uni(request.getParameter("rcjcjgbm"));
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
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_gdrcjcjl ( jcjlh,khbh,sgd,jcr,jcsj,rcjclxbm,rcjcjgbm,lrr,lrsj,lrbm,bz,spbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,jcr);
	ps.setDate(5,jcsj);
	ps.setString(6,rcjclxbm);
	ps.setString(7,rcjcjgbm);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
	ps.setString(11,bz);
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