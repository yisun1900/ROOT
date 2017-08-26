<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String jgwzbm=null;
String tccplbbm=null;
double bzsl=0;
String sfxzsl=null;
String lrr=null;
java.sql.Date lrsj=null;
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

String jldw=cf.GB2Uni(request.getParameter("jldw"));
String jmfl=cf.GB2Uni(request.getParameter("jmfl"));
String jmjldw=cf.GB2Uni(request.getParameter("jmjldw"));
String sfkjm=null;
double yxjmzdsl=0;
double jmdj=0;
sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
ls=request.getParameter("yxjmzdsl");
try{
	if (!(ls.equals("")))  yxjmzdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjmzdsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许减免最大数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jmdj");
try{
	if (!(ls.equals("")))  jmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jmdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免单价]类型转换发生意外:"+e);
	return;
}
String sfkgh=null;
double khzdsl=0;
double ghzj=0;
sfkgh=cf.GB2Uni(request.getParameter("sfkgh"));
ls=request.getParameter("khzdsl");
try{
	if (!(ls.equals("")))  khzdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khzdsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可换最大数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ghzj");
try{
	if (!(ls.equals("")))  ghzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ghzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更换折价]类型转换发生意外:"+e);
	return;
}
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into bj_tcbzzcxm (dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl   ,bzsl,sfkjm,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,lrr,lrsj,jmfl,jmjldw,bjbbh)  ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,hxbm);
	ps.setString(4,jgwzbm);
	ps.setString(5,tccplbbm);
	ps.setString(6,tcsjflbm);
	ps.setString(7,sfbxx);
	ps.setString(8,sfyxsj);
	ps.setString(9,jldw);
	ps.setString(10,sfxzsl);

	ps.setDouble(11,bzsl);
	ps.setString(12,sfkjm);
	ps.setDouble(13,yxjmzdsl);
	ps.setDouble(14,jmdj);
	ps.setString(15,sfkgh);
	ps.setDouble(16,khzdsl);
	ps.setDouble(17,ghzj);
	ps.setString(18,sfyqxtpp);
	ps.setString(19,lrr);
	ps.setDate(20,lrsj);
	ps.setString(21,jmfl);
	ps.setString(22,jmjldw);
	ps.setString(23,bjbbh);
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