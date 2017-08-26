<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String jgwzbm=null;
String tccplbbm=null;
double bzsl=0;
String sfxzsl=null;
double ccbfjj=0;
String lrr=null;
java.sql.Date lrsj=null;
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
ls=request.getParameter("bzsl");
try{
	if (!(ls.equals("")))  bzsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bzsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准数量]类型转换发生意外:"+e);
	return;
}
sfxzsl=cf.GB2Uni(request.getParameter("sfxzsl"));
ls=request.getParameter("ccbfjj");
try{
	if (!(ls.equals("")))  ccbfjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ccbfjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[超出部分加价]类型转换发生意外:"+e);
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
String sfbxx=cf.GB2Uni(request.getParameter("sfbxx"));
String sfyxsj=cf.GB2Uni(request.getParameter("sfyxsj"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String sfyqxtpp=cf.GB2Uni(request.getParameter("sfyqxtpp"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into bj_tcbzzcxm ( bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,bzsl,sfxzsl,ccbfjj,lrr,lrsj,sfbxx,sfyxsj,tcsjflbm,sfyqxtpp ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,hxbm);
	ps.setString(5,jgwzbm);
	ps.setString(6,tccplbbm);
	ps.setDouble(7,bzsl);
	ps.setString(8,sfxzsl);
	ps.setDouble(9,ccbfjj);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,sfbxx);
	ps.setString(13,sfyxsj);
	ps.setString(14,tcsjflbm);
	ps.setString(15,sfyqxtpp);
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