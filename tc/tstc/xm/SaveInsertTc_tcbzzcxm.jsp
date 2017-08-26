<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
double bzsl=0;
String sfxzsl=null;
String lrr=null;
java.sql.Date lrsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
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
String jldw=cf.GB2Uni(request.getParameter("jldw"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into tc_tczcxm ( dqbm,bjjbbm,tccpdlbm,tccplbbm,bzsl,sfxzsl,lrr,lrsj,sfbxx,sfyxsj   ,tcsjflbm,sfyqxtpp,sfkjm,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,jldw ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,tccpdlbm);
	ps.setString(4,tccplbbm);
	ps.setDouble(5,bzsl);
	ps.setString(6,sfxzsl);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,sfbxx);
	ps.setString(10,sfyxsj);

	ps.setString(11,tcsjflbm);
	ps.setString(12,sfyqxtpp);
	ps.setString(13,sfkjm);
	ps.setDouble(14,yxjmzdsl);
	ps.setDouble(15,jmdj);
	ps.setString(16,sfkgh);
	ps.setDouble(17,khzdsl);
	ps.setDouble(18,ghzj);
	ps.setString(19,jldw);
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