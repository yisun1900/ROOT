<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double htje=0;
double zjxje=0;
double qtf=0;
String qtfsm=null;
double ssk=0;
String jsjs=null;
double jsjsze=0;
double jsbl=0;
double tzjsbl=0;
String sdljsfs=null;
double sdlje=0;
double sdljsbl=0;
double sdljsje=0;
double jsje=0;
String sfkclk=null;
double clf=0;
double clyf=0;
String sfkgdyp=null;
double gdyp=0;
String sfkyfgf=null;
double yfgck=0;
String sfkzbj=null;
String kzbjjs=null;
double kzbjbl=0;
double kzbj=0;
double clfk=0;
double fkje=0;
double jlje=0;
double qtje=0;
double yfje=0;
java.sql.Date jsrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
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
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
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
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
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
ls=request.getParameter("sdljsje");
try{
	if (!(ls.equals("")))  sdljsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sdljsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电路结算金额]类型转换发生意外:"+e);
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
sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
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
sfkgdyp=cf.GB2Uni(request.getParameter("sfkgdyp"));
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
sfkyfgf=cf.GB2Uni(request.getParameter("sfkyfgf"));
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
sfkzbj=cf.GB2Uni(request.getParameter("sfkzbj"));
kzbjjs=cf.GB2Uni(request.getParameter("kzbjjs"));
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金比例]类型转换发生意外:"+e);
	return;
}
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
double kkhpck=0;
ls=request.getParameter("kkhpck");
try{
	if (!(ls.equals("")))  kkhpck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kkhpck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣客户赔偿款]类型转换发生意外:"+e);
	return;
}
double kyqf=0;
ls=request.getParameter("kyqf");
try{
	if (!(ls.equals("")))  kyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kyqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣延期费]类型转换发生意外:"+e);
	return;
}

double kkhqk=0;
ls=request.getParameter("kkhqk");
try{
	if (!(ls.equals("")))  kkhqk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kkhqk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣客户欠款]类型转换发生意外:"+e);
	return;
}

double zxxs=0;
ls=request.getParameter("zxxs");
try{
	if (!(ls.equals("")))  zxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项系数]类型转换发生意外:"+e);
	return;
}

double jxxs=0;
ls=request.getParameter("jxxs");
try{
	if (!(ls.equals("")))  jxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项系数]类型转换发生意外:"+e);
	return;
}

double kghzx=0;
ls=request.getParameter("kghzx");
try{
	if (!(ls.equals("")))  kghzx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kghzx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开工后增项施工成本]类型转换发生意外:"+e);
	return;
}

double kghjx=0;
ls=request.getParameter("kghjx");
try{
	if (!(ls.equals("")))  kghjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kghjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开工后减项折后金额]类型转换发生意外:"+e);
	return;
}


String khbh=request.getParameter("khbh");

String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set sgdfbj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsjsze);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_sgdwgjsty set htje=?,zjxje=?,qtf=?,qtfsm=?,ssk=?,jsjs=?,jsjsze=?,jsbl=?,tzjsbl=?,sdljsfs=?,sdlje=?,sdljsbl=?,sdljsje=?,jsje=?,sfkclk=?,clf=?,clyf=?,sfkgdyp=?,gdyp=?,sfkyfgf=?,yfgck=?,sfkzbj=?,kzbjjs=?,kzbjbl=?,kzbj=?,clfk=?,fkje=?,jlje=?,qtje=?,yfje=?,jsrq=?,lrr=?,lrsj=?,lrbm=?,bz=?,khpck=?,yqf=?,jsyh=?,khqk=?,kkhpck=?,kyqf=?,kkhqk=?,zxxs=?,jxxs=?,kghzx=?,kghjx=? ";
	ls_sql+=" where  (jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,htje);
	ps.setDouble(2,zjxje);
	ps.setDouble(3,qtf);
	ps.setString(4,qtfsm);
	ps.setDouble(5,ssk);
	ps.setString(6,jsjs);
	ps.setDouble(7,jsjsze);
	ps.setDouble(8,jsbl);
	ps.setDouble(9,tzjsbl);
	ps.setString(10,sdljsfs);
	ps.setDouble(11,sdlje);
	ps.setDouble(12,sdljsbl);
	ps.setDouble(13,sdljsje);
	ps.setDouble(14,jsje);
	ps.setString(15,sfkclk);
	ps.setDouble(16,clf);
	ps.setDouble(17,clyf);
	ps.setString(18,sfkgdyp);
	ps.setDouble(19,gdyp);
	ps.setString(20,sfkyfgf);
	ps.setDouble(21,yfgck);
	ps.setString(22,sfkzbj);
	ps.setString(23,kzbjjs);
	ps.setDouble(24,kzbjbl);
	ps.setDouble(25,kzbj);
	ps.setDouble(26,clfk);
	ps.setDouble(27,fkje);
	ps.setDouble(28,jlje);
	ps.setDouble(29,qtje);
	ps.setDouble(30,yfje);
	ps.setDate(31,jsrq);
	ps.setString(32,lrr);
	ps.setDate(33,lrsj);
	ps.setString(34,lrbm);
	ps.setString(35,bz);
	ps.setDouble(36,khpck);
	ps.setDouble(37,yqf);
	ps.setDouble(38,jsyh);
	ps.setDouble(39,khqk);
	ps.setDouble(40,kkhpck);
	ps.setDouble(41,kyqf);
	ps.setDouble(42,kkhqk);
	ps.setDouble(43,zxxs);
	ps.setDouble(44,jxxs);
	ps.setDouble(45,kghzx);
	ps.setDouble(46,kghjx);
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