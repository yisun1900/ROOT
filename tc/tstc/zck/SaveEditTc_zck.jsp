<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpbm=null;
String dqbm=null;
String bjjbbm=null;
String nbbm=null;
String cldl=null;
String clxl=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double sh=0;
String sfxclxs=null;
double jsj=0;
double khxsdj=0;
double sgddj=0;
String lx=null;
String lbxmbm=null;
String cxxmbm=null;
String sfyx=null;
java.sql.Date yxkssj=null;
java.sql.Date yxjzsj=null;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
double sjj1=0;
double sjj2=0;
double sjj3=0;
double sjj4=0;
double sjj5=0;
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
nbbm=cf.GB2Uni(request.getParameter("nbbm"));
cldl=cf.GB2Uni(request.getParameter("cldl"));
clxl=cf.GB2Uni(request.getParameter("clxl"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
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
sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
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
ls=request.getParameter("khxsdj");
try{
	if (!(ls.equals("")))  khxsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khxsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户销售单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgddj");
try{
	if (!(ls.equals("")))  sgddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgddj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队单价]类型转换发生意外:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
lbxmbm=cf.GB2Uni(request.getParameter("lbxmbm"));
cxxmbm=cf.GB2Uni(request.getParameter("cxxmbm"));
sfyx=cf.GB2Uni(request.getParameter("sfyx"));
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
ls=request.getParameter("sjj1");
try{
	if (!(ls.equals("")))  sjj1=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj1]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级价1]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjj2");
try{
	if (!(ls.equals("")))  sjj2=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj2]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级价2]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjj3");
try{
	if (!(ls.equals("")))  sjj3=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj3]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级价3]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjj4");
try{
	if (!(ls.equals("")))  sjj4=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj4]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级价4]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjj5");
try{
	if (!(ls.equals("")))  sjj5=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjj5]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级价5]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update tc_zck set cpbm=?,dqbm=?,bjjbbm=?,nbbm=?,cldl=?,clxl=?,cpmc=?,xh=?,gg=?,ppmc=?,gysmc=?,jldw=?,xdjldw=?,xdb=?,sh=?,sfxclxs=?,jsj=?,khxsdj=?,sgddj=?,lx=?,lbxmbm=?,cxxmbm=?,sfyx=?,yxkssj=?,yxjzsj=?,xuhao=?,lrr=?,lrsj=?,bz=?,sjj1=?,sjj2=?,sjj3=?,sjj4=?,sjj5=? ";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpbm);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,nbbm);
	ps.setString(5,cldl);
	ps.setString(6,clxl);
	ps.setString(7,cpmc);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,ppmc);
	ps.setString(11,gysmc);
	ps.setString(12,jldw);
	ps.setString(13,xdjldw);
	ps.setDouble(14,xdb);
	ps.setDouble(15,sh);
	ps.setString(16,sfxclxs);
	ps.setDouble(17,jsj);
	ps.setDouble(18,khxsdj);
	ps.setDouble(19,sgddj);
	ps.setString(20,lx);
	ps.setString(21,lbxmbm);
	ps.setString(22,cxxmbm);
	ps.setString(23,sfyx);
	ps.setDate(24,yxkssj);
	ps.setDate(25,yxjzsj);
	ps.setDouble(26,xuhao);
	ps.setString(27,lrr);
	ps.setDate(28,lrsj);
	ps.setString(29,bz);
	ps.setDouble(30,sjj1);
	ps.setDouble(31,sjj2);
	ps.setDouble(32,sjj3);
	ps.setDouble(33,sjj4);
	ps.setDouble(34,sjj5);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from tc_zcsjj ";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (sjj1!=0)
	{
		ls_sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
		ls_sql+=" values (?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cpbm);
		ps.setString(2,"A");
		ps.setDouble(3,sjj1);
		ps.executeUpdate();
		ps.close();
	}

	if (sjj2!=0)
	{
		ls_sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
		ls_sql+=" values (?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cpbm);
		ps.setString(2,"B");
		ps.setDouble(3,sjj2);
		ps.executeUpdate();
		ps.close();
	}

	if (sjj3!=0)
	{
		ls_sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
		ls_sql+=" values (?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cpbm);
		ps.setString(2,"C");
		ps.setDouble(3,sjj3);
		ps.executeUpdate();
		ps.close();
	}

	if (sjj4!=0)
	{
		ls_sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
		ls_sql+=" values (?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cpbm);
		ps.setString(2,"D");
		ps.setDouble(3,sjj4);
		ps.executeUpdate();
		ps.close();
	}

	if (sjj5!=0)
	{
		ls_sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
		ls_sql+=" values (?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cpbm);
		ps.setString(2,"E");
		ps.setDouble(3,sjj5);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>