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
String sjfl=cf.GB2Uni(request.getParameter("sjfl"));
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
String fgmc=cf.GB2Uni(request.getParameter("fgmc"));
String sjjjfs=cf.GB2Uni(request.getParameter("sjjjfs"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into tckd_tcfgzcxmxj (dqbm,bjjbbm,fgmc,hxbm,jgwzbm,tccplbbm,sjfl,sfbxx,sfyxsj,jldw   ,sfxzsl   ,bzsl,sfkjm,yxjmzdsl,jmdj,sfyqxtpp,lrr,lrsj,jmfl,jmjldw,sjjjfs)  ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?   ,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,fgmc);
	ps.setString(4,hxbm);
	ps.setString(5,jgwzbm);
	ps.setString(6,tccplbbm);
	ps.setString(7,sjfl);
	ps.setString(8,sfbxx);
	ps.setString(9,sfyxsj);
	ps.setString(10,jldw);

	ps.setString(11,sfxzsl);
	ps.setDouble(12,bzsl);
	ps.setString(13,sfkjm);
	ps.setDouble(14,yxjmzdsl);
	ps.setDouble(15,jmdj);

	ps.setString(16,sfyqxtpp);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,jmfl);
	ps.setString(20,jmjldw);
	ps.setString(21,sjjjfs);
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