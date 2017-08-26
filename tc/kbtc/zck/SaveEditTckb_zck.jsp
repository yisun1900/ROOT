<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String cpbm=null;
String cpdl=null;
String cpxl=null;
String cpmc=null;
String ppmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double jsj=0;
double sh=0;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
cpdl=cf.GB2Uni(request.getParameter("cpdl"));
cpxl=cf.GB2Uni(request.getParameter("cpxl"));
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


String sfyx=cf.GB2Uni(request.getParameter("sfyx"));
java.sql.Date yxkssj=null;
ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date yxjzsj=null;
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效结束时间]类型转换发生意外:"+e);
	return;
}

String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));

String kbcpbm=cf.GB2Uni(request.getParameter("kbcpbm"));
String kbwlbm=cf.GB2Uni(request.getParameter("kbwlbm"));
String yxthsj=cf.GB2Uni(request.getParameter("yxthsj"));
double lsj=0;
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零售价]类型转换发生意外:"+e);
	return;
}

double sjj=0;
ls=request.getParameter("sjj");
try{
	if (!(ls.equals("")))  sjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[包内价]类型转换发生意外:"+e);
	return;
}
String cllx=cf.GB2Uni(request.getParameter("cllx"));
String cptz=cf.GB2Uni(request.getParameter("cptz"));
String czlx=cf.GB2Uni(request.getParameter("czlx"));
String cpks=cf.GB2Uni(request.getParameter("cpks"));
String cplx=cf.GB2Uni(request.getParameter("cplx"));
String sfkgdj=cf.GB2Uni(request.getParameter("sfkgdj"));

String wherecpbm=null;
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckb_zck set kbcpbm=?,kbwlbm=?,yxthsj=?,cpdl=?,cpxl=?,cpmc=?,ppmc=?,xh=?,gg=?,jldw=?   ,xdjldw=?,xdb=?,jsj=?,sh=?,gysmc=?,xuhao=?,lrr=?,lrsj=?,bz=?,sfxclxs=?    ,sfyx=?,yxkssj=?,yxjzsj=?,lsj=?,sjj=?,cllx=?,cptz=?,czlx=?,cpks=?,cplx=?,sfkgdj=? ";
	ls_sql+=" where cpbm='"+wherecpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbcpbm);
	ps.setString(2,kbwlbm);
	ps.setString(3,yxthsj);
	ps.setString(4,cpdl);
	ps.setString(5,cpxl);
	ps.setString(6,cpmc);
	ps.setString(7,ppmc);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,jldw);

	ps.setString(11,xdjldw);
	ps.setDouble(12,xdb);
	ps.setDouble(13,jsj);
	ps.setDouble(14,sh);
	ps.setString(15,gysmc);
	ps.setDouble(16,xuhao);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,bz);
	ps.setString(20,sfxclxs);

	ps.setString(21,sfyx);
	ps.setDate(22,yxkssj);
	ps.setDate(23,yxjzsj);
	ps.setDouble(24,lsj);
	ps.setDouble(25,sjj);
	ps.setString(26,cllx);
	ps.setString(27,cptz);
	ps.setString(28,czlx);
	ps.setString(29,cpks);
	ps.setString(30,cplx);
	ps.setString(31,sfkgdj);
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