<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsjs=null;
double jsbl=0;
double tzjsbl=0;
double sdlje=0;
double sdljsbl=0;
double jsje=0;
double clf=0;
double clyf=0;
double gdyp=0;
double yfgck=0;
double kzbjbl=0;
double clfk=0;
double yfje=0;
java.sql.Date jsrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
double kzbj=0;
double htje=0;
double zjxje=0;
double qtf=0;
String qtfsm=null;
double ssk=0;
double jsjsze=0;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String kzbjjs=null;
double fkje=0;
double jlje=0;
double qtje=0;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
jsjs=request.getParameter("jsjs");

ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tzjsbl");
try{
	if (!(ls.equals("")))  tzjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tzjsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调整结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdlje");
try{
	if (!(ls.equals("")))  sdlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sdlje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电路金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdljsbl");
try{
	if (!(ls.equals("")))  sdljsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sdljsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电路结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyf");
try{
	if (!(ls.equals("")))  clyf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料运费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdyp");
try{
	if (!(ls.equals("")))  gdyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gdyp]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工地用品]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yfgck");
try{
	if (!(ls.equals("")))  yfgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付工程款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应扣质保金比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clfk");
try{
	if (!(ls.equals("")))  clfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clfk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料罚款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yfje");
try{
	if (!(ls.equals("")))  yfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应付金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算日期]类型转换发生意外:"+e);
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
ls=request.getParameter("kzbj");
try{
	if (!(ls.equals("")))  kzbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程合同额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程增减项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费]类型转换发生意外:"+e);
	return;
}
qtfsm=cf.GB2Uni(request.getParameter("qtfsm"));
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ssk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsjsze");
try{
	if (!(ls.equals("")))  jsjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsjsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算基数总额]类型转换发生意外:"+e);
	return;
}
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
sfkgdyp=cf.GB2Uni(request.getParameter("sfkgdyp"));
sfkyfgf=cf.GB2Uni(request.getParameter("sfkyfgf"));
sfkzbj=cf.GB2Uni(request.getParameter("sfkzbj"));
kzbjjs=cf.GB2Uni(request.getParameter("kzbjjs"));
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jlje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtje");
try{
	if (!(ls.equals("")))  qtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它金额]类型转换发生意外:"+e);
	return;
}

double khpck=0;
ls=request.getParameter("khpck");
try{
	if (!(ls.equals("")))  khpck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khpck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户赔偿款]类型转换发生意外:"+e);
	return;
}

double yqf=0;
ls=request.getParameter("yqf");
try{
	if (!(ls.equals("")))  yqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[延期费]类型转换发生意外:"+e);
	return;
}

double jsyh=0;
ls=request.getParameter("jsyh");
try{
	if (!(ls.equals("")))  jsyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算优惠]类型转换发生意外:"+e);
	return;
}


double khqk=0;
ls=request.getParameter("khqk");
try{
	if (!(ls.equals("")))  khqk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khqk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户欠款]类型转换发生意外:"+e);
	return;
}

String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"Z");
	ps.setString(2,jsjlh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_sgdwgjsty set jsjlh=?,khbh=?,sgd=?,sgbz=?,jsjs=?,jsbl=?,tzjsbl=?,sdlje=?,sdljsbl=?,jsje=?,clf=?,clyf=?,gdyp=?,yfgck=?,kzbjbl=?,clfk=?,yfje=?,jsrq=?,clzt=?,lrr=?,lrsj=?,lrbm=?,bz=?,kzbj=?,htje=?,zjxje=?,qtf=?,qtfsm=?,ssk=?,jsjsze=?,sdljsfs=?,sfkclk=?,sfkgdyp=?,sfkyfgf=?,sfkzbj=?,kzbjjs=?,fkje=?,jlje=?,qtje=?,khpck=?,jsyh=?,khqk=?,yqf=? ";
	ls_sql+=" where  (jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setString(5,jsjs);
	ps.setDouble(6,jsbl);
	ps.setDouble(7,tzjsbl);
	ps.setDouble(8,sdlje);
	ps.setDouble(9,sdljsbl);
	ps.setDouble(10,jsje);
	ps.setDouble(11,clf);
	ps.setDouble(12,clyf);
	ps.setDouble(13,gdyp);
	ps.setDouble(14,yfgck);
	ps.setDouble(15,kzbjbl);
	ps.setDouble(16,clfk);
	ps.setDouble(17,yfje);
	ps.setDate(18,jsrq);
	ps.setString(19,"2");
	ps.setString(20,lrr);
	ps.setDate(21,lrsj);
	ps.setString(22,lrbm);
	ps.setString(23,bz);
	ps.setDouble(24,kzbj);
	ps.setDouble(25,htje);
	ps.setDouble(26,zjxje);
	ps.setDouble(27,qtf);
	ps.setString(28,qtfsm);
	ps.setDouble(29,ssk);
	ps.setDouble(30,jsjsze);
	ps.setString(31,sdljsfs);
	ps.setString(32,sfkclk);
	ps.setString(33,sfkgdyp);
	ps.setString(34,sfkyfgf);
	ps.setString(35,sfkzbj);
	ps.setString(36,kzbjjs);
	ps.setDouble(37,fkje);
	ps.setDouble(38,jlje);
	ps.setDouble(39,qtje);
	ps.setDouble(40,khpck);
	ps.setDouble(41,jsyh);
	ps.setDouble(42,khqk);
	ps.setDouble(43,yqf);
	ps.executeUpdate();
	ps.close();

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