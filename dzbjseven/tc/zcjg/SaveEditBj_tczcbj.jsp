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
String cpbm=null;
String sku=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String ppmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double dj=0;
double jsj=0;
double jjje=0;
double sh=0;
String sfcscp=null;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
sku=cf.GB2Uni(request.getParameter("sku"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
xdjldw=cf.GB2Uni(request.getParameter("xdjldw"));
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xdb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下单比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jjje");
try{
	if (!(ls.equals("")))  jjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加价金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗]类型转换发生意外:"+e);
	return;
}
sfcscp=cf.GB2Uni(request.getParameter("sfcscp"));
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xuhao]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[排序序号]类型转换发生意外:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));
String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String wherecpbm=null;
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bj_tczcbj set bjbbh=?,dqbm=?,bjjbbm=?,cpbm=?,sku=?,tccpdlbm=?,tccplbbm=?,cpmc=?,ppmc=?,xh=?   ,gg=?,jldw=?,xdjldw=?,xdb=?,dj=?,jsj=?,jjje=?,sh=?,sfcscp=?,gysmc=?   ,xuhao=?,lrr=?,lrsj=?,bz=?,sfxclxs=?,tcsjflbm=? ";
	ls_sql+=" where (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,cpbm);
	ps.setString(5,sku);
	ps.setString(6,tccpdlbm);
	ps.setString(7,tccplbbm);
	ps.setString(8,cpmc);
	ps.setString(9,ppmc);
	ps.setString(10,xh);

	ps.setString(11,gg);
	ps.setString(12,jldw);
	ps.setString(13,xdjldw);
	ps.setDouble(14,xdb);
	ps.setDouble(15,dj);
	ps.setDouble(16,jsj);
	ps.setDouble(17,jjje);
	ps.setDouble(18,sh);
	ps.setString(19,sfcscp);
	ps.setString(20,gysmc);

	ps.setDouble(21,xuhao);
	ps.setString(22,lrr);
	ps.setDate(23,lrsj);
	ps.setString(24,bz);
	ps.setString(25,sfxclxs);
	ps.setString(26,tcsjflbm);
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