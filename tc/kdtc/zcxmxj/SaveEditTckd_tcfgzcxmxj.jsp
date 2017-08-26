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
String sjjjfs=cf.GB2Uni(request.getParameter("sjjjfs"));


String wheredqbm=null;
String wherebjjbbm=null;
String wherefgmc=null;
String wherehxbm=null;
String wherejgwzbm=null;
String wheretccplbbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherefgmc=cf.GB2Uni(request.getParameter("wherefgmc"));
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
wheretccplbbm=cf.GB2Uni(request.getParameter("wheretccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckd_tcfgzcxmxj set tccplbbm=?,sjfl=?,sfbxx=?,sfyxsj=?,jldw=?,sfxzsl=?,bzsl=?,sfkjm=?,yxjmzdsl=?,jmdj=?    ,sfyqxtpp=?,lrr=?,lrsj=?,jmfl=?,jmjldw=?,sjjjfs=?";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (fgmc='"+wherefgmc+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tccplbbm);
	ps.setString(2,sjfl);
	ps.setString(3,sfbxx);
	ps.setString(4,sfyxsj);
	ps.setString(5,jldw);
	ps.setString(6,sfxzsl);
	ps.setDouble(7,bzsl);
	ps.setString(8,sfkjm);
	ps.setDouble(9,yxjmzdsl);
	ps.setDouble(10,jmdj);

	ps.setString(11,sfyqxtpp);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,jmfl);
	ps.setString(15,jmjldw);
	ps.setString(16,sjjjfs);
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