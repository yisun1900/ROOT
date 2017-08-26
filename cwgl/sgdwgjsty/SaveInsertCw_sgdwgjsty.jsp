<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
double htgcf=0;
double htqtsf=0;
double gcfzjx=0;
double qtsfzjx=0;
String qtfsm=null;
double htsgcb=0;
double zjxsgcb=0;
double ljclf=0;
double ljrgf=0;
double ssk=0;
double jsyh=0;
double khpck=0;
double yqf=0;
double khqk=0;
String jsjs=null;
double htjsjs=0;
double zjxjsjs=0;
double jsjsxjje=0;
String sdljsfs=null;
String sdlqz=null;
double sdlje=0;
double sdljsbl=0;
double sdljsje=0;
String zjxjffs=null;
String zjxbhfw=null;
String zjxsjd=null;
double ljzjxxs=0;
double ljzjxje=0;
double zxxs=0;
double zxje=0;
double jxxs=0;
double jxje=0;
String sfkyqpc=null;
double kyqf=0;
double kkhpck=0;
double kkhqk=0;
String zcsfjs=null;
String zcjehqfs=null;
String zcjsblkg=null;
double zcjsbl=0;
double zcje=0;
double zcjsje=0;
double jsjsze=0;
double jsbl=0;
double tzjsbl=0;
double jsje=0;
double rgfjse=0;
double flfjse=0;
String sfkclk=null;
double clf=0;
String sfkgdyp=null;
double gdyp=0;
String sfkyfgf=null;
double yfgf=0;
String sfkzbj=null;
String kzbjjs=null;
double kzbjbl=0;
double kzbj=0;
double zbjce=0;
String sfkclfk=null;
double clfk=0;
String sfkclyf=null;
double clyf=0;
String sfkzckk=null;
double zckk=0;
String sfjzcjl=null;
double zcjl=0;
String sfkfkje=null;
double fkje=0;
String sfjjlje=null;
double jlje=0;
String sfjqtje=null;
double qtje=0;
double yfje=0;
java.sql.Date jsrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("htgcf");
try{
	if (!(ls.equals("")))  htgcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htgcf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同工程额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htqtsf");
try{
	if (!(ls.equals("")))  htqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同其它收费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcfzjx");
try{
	if (!(ls.equals("")))  gcfzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcfzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费增减项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtsfzjx");
try{
	if (!(ls.equals("")))  qtsfzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtsfzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费增减项]类型转换发生意外:"+e);
	return;
}
qtfsm=cf.GB2Uni(request.getParameter("qtfsm"));
ls=request.getParameter("htsgcb");
try{
	if (!(ls.equals("")))  htsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htsgcb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同工施工成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxsgcb");
try{
	if (!(ls.equals("")))  zjxsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxsgcb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项施工成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ljclf");
try{
	if (!(ls.equals("")))  ljclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljclf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ljrgf");
try{
	if (!(ls.equals("")))  ljrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljrgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计人工费]类型转换发生意外:"+e);
	return;
}
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
ls=request.getParameter("jsyh");
try{
	if (!(ls.equals("")))  jsyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户结算优惠]类型转换发生意外:"+e);
	return;
}
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
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
ls=request.getParameter("htjsjs");
try{
	if (!(ls.equals("")))  htjsjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htjsjs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同结算基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxjsjs");
try{
	if (!(ls.equals("")))  zjxjsjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxjsjs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项结算基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsjsxjje");
try{
	if (!(ls.equals("")))  jsjsxjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsjsxjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算基数金额]类型转换发生意外:"+e);
	return;
}
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
sdlqz=cf.GB2Uni(request.getParameter("sdlqz"));
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
zjxjffs=cf.GB2Uni(request.getParameter("zjxjffs"));
zjxbhfw=cf.GB2Uni(request.getParameter("zjxbhfw"));
zjxsjd=cf.GB2Uni(request.getParameter("zjxsjd"));
ls=request.getParameter("ljzjxxs");
try{
	if (!(ls.equals("")))  ljzjxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljzjxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计增减项系数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ljzjxje");
try{
	if (!(ls.equals("")))  ljzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljzjxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计增减项]类型转换发生意外:"+e);
	return;
}
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
ls=request.getParameter("zxje");
try{
	if (!(ls.equals("")))  zxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项金额]类型转换发生意外:"+e);
	return;
}
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
ls=request.getParameter("jxje");
try{
	if (!(ls.equals("")))  jxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项金额]类型转换发生意外:"+e);
	return;
}
sfkyqpc=cf.GB2Uni(request.getParameter("sfkyqpc"));
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
zcsfjs=cf.GB2Uni(request.getParameter("zcsfjs"));
zcjehqfs=cf.GB2Uni(request.getParameter("zcjehqfs"));
zcjsblkg=cf.GB2Uni(request.getParameter("zcjsblkg"));
ls=request.getParameter("zcjsbl");
try{
	if (!(ls.equals("")))  zcjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcje");
try{
	if (!(ls.equals("")))  zcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcjsje");
try{
	if (!(ls.equals("")))  zcjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材结算金额]类型转换发生意外:"+e);
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
ls=request.getParameter("rgfjse");
try{
	if (!(ls.equals("")))  rgfjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rgfjse]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费结算额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("flfjse");
try{
	if (!(ls.equals("")))  flfjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[flfjse]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅料费结算额]类型转换发生意外:"+e);
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
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付工费]类型转换发生意外:"+e);
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
ls=request.getParameter("zbjce");
try{
	if (!(ls.equals("")))  zbjce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zbjce]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质保金差额]类型转换发生意外:"+e);
	return;
}
sfkclfk=cf.GB2Uni(request.getParameter("sfkclfk"));
ls=request.getParameter("clfk");
try{
	if (!(ls.equals("")))  clfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clfk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材罚款]类型转换发生意外:"+e);
	return;
}
sfkclyf=cf.GB2Uni(request.getParameter("sfkclyf"));
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
sfkzckk=cf.GB2Uni(request.getParameter("sfkzckk"));
ls=request.getParameter("zckk");
try{
	if (!(ls.equals("")))  zckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zckk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材扣款]类型转换发生意外:"+e);
	return;
}
sfjzcjl=cf.GB2Uni(request.getParameter("sfjzcjl"));
ls=request.getParameter("zcjl");
try{
	if (!(ls.equals("")))  zcjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材奖励]类型转换发生意外:"+e);
	return;
}
sfkfkje=cf.GB2Uni(request.getParameter("sfkfkje"));
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
sfjjlje=cf.GB2Uni(request.getParameter("sfjjlje"));
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
sfjqtje=cf.GB2Uni(request.getParameter("sfjqtje"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update cw_sgdfkjl set zt='3',jsjlh='"+jsjlh+"'";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1：未审核；2：审核；3：结算
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_sgdjljl set zt='3',jsjlh='"+jsjlh+"'";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1：未审核；2：审核；3：结算
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?,sgdfbj=?";//施工队发包价
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"Y");
	ps.setString(2,jsjlh);
	ps.setDouble(3,jsjsze);
	ps.executeUpdate();
	ps.close();

	if (kzbj>0)//扣质保金
	{
		long xuhao=0;
		//获取记录号
		ls_sql="select NVL(max(xuhao),0)";
		ls_sql+=" from  cw_zbjxgjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xuhao=rs.getLong(1);
		}
		rs.close();
		ps.close();

		xuhao++;

		ls_sql="update sq_sgd set zbj=zbj+?";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,kzbj);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="insert into cw_zbjxgjl ( xuhao,sgd,zbjjsyybm,je,jsjlh,lrr,lrsj,lrbm,bz,lx,scbz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'2','N' ) ";//1：手工录入；2：完工结算；3：工地维修
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xuhao);
		ps.setString(2,sgd);
		ps.setString(3,"");
		ps.setDouble(4,kzbj);
		ps.setString(5,jsjlh);
		ps.setString(6,lrr);
		ps.setDate(7,lrsj);
		ps.setString(8,lrbm);
		ps.setString(9,"施工队完工结算");
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="insert into cw_sgdwgjsty ( jsjlh,khbh,sgd,sgbz,htgcf,htqtsf,gcfzjx,qtsfzjx,qtfsm,htsgcb      ,zjxsgcb,ljclf,ljrgf,ssk,jsyh,khpck,yqf,khqk,jsjs,htjsjs      ,zjxjsjs,jsjsxjje,sdljsfs,sdlqz,sdlje,sdljsbl,sdljsje,zjxjffs,zjxbhfw,zjxsjd       ,ljzjxxs,ljzjxje,zxxs,zxje,jxxs,jxje,sfkyqpc,kyqf,kkhpck,kkhqk     ,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl,zcje,zcjsje,jsjsze,jsbl,tzjsbl,jsje     ,rgfjse,flfjse,sfkclk,clf,sfkgdyp,gdyp,sfkyfgf,yfgf,sfkzbj,kzbjjs     ,kzbjbl,kzbj,zbjce,sfkclfk,clfk,sfkclyf,clyf,sfkzckk,zckk,sfjzcjl    ,zcjl,sfkfkje,fkje,sfjjlje,jlje,sfjqtje,qtje,yfje,jsrq,lrr   ,lrsj,lrbm,bz,spzt ) ";
	ls_sql+=" values (                 ?,?,?,?,?,?,?,?,?,?                                               ,?,?,?,?,?,?,?,?,?,?                                          ,?,?,?,?,?,?,?,?,?,?                                                               ,?,?,?,?,?,?,?,?,?,?                                               ,?,?,?,?,?,?,?,?,?,?                                                     ,?,?,?,?,?,?,?,?,?,?                                                  ,?,?,?,?,?,?,?,?,?,?                                                 ,?,?,?,?,?,?,?,?,?,?                                         ,?,?,?,'1' ) ";//1：未审批；2：审批同意；3：审批不同意
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDouble(5,htgcf);
	ps.setDouble(6,htqtsf);
	ps.setDouble(7,gcfzjx);
	ps.setDouble(8,qtsfzjx);
	ps.setString(9,qtfsm);
	ps.setDouble(10,htsgcb);

	ps.setDouble(11,zjxsgcb);
	ps.setDouble(12,ljclf);
	ps.setDouble(13,ljrgf);
	ps.setDouble(14,ssk);
	ps.setDouble(15,jsyh);
	ps.setDouble(16,khpck);
	ps.setDouble(17,yqf);
	ps.setDouble(18,khqk);
	ps.setString(19,jsjs);
	ps.setDouble(20,htjsjs);

	ps.setDouble(21,zjxjsjs);
	ps.setDouble(22,jsjsxjje);
	ps.setString(23,sdljsfs);
	ps.setString(24,sdlqz);
	ps.setDouble(25,sdlje);
	ps.setDouble(26,sdljsbl);
	ps.setDouble(27,sdljsje);
	ps.setString(28,zjxjffs);
	ps.setString(29,zjxbhfw);
	ps.setString(30,zjxsjd);

	ps.setDouble(31,ljzjxxs);
	ps.setDouble(32,ljzjxje);
	ps.setDouble(33,zxxs);
	ps.setDouble(34,zxje);
	ps.setDouble(35,jxxs);
	ps.setDouble(36,jxje);
	ps.setString(37,sfkyqpc);
	ps.setDouble(38,kyqf);
	ps.setDouble(39,kkhpck);
	ps.setDouble(40,kkhqk);

	ps.setString(41,zcsfjs);
	ps.setString(42,zcjehqfs);
	ps.setString(43,zcjsblkg);
	ps.setDouble(44,zcjsbl);
	ps.setDouble(45,zcje);
	ps.setDouble(46,zcjsje);
	ps.setDouble(47,jsjsze);
	ps.setDouble(48,jsbl);
	ps.setDouble(49,tzjsbl);
	ps.setDouble(50,jsje);

	ps.setDouble(51,rgfjse);
	ps.setDouble(52,flfjse);
	ps.setString(53,sfkclk);
	ps.setDouble(54,clf);
	ps.setString(55,sfkgdyp);
	ps.setDouble(56,gdyp);
	ps.setString(57,sfkyfgf);
	ps.setDouble(58,yfgf);
	ps.setString(59,sfkzbj);
	ps.setString(60,kzbjjs);

	ps.setDouble(61,kzbjbl);
	ps.setDouble(62,kzbj);
	ps.setDouble(63,zbjce);
	ps.setString(64,sfkclfk);
	ps.setDouble(65,clfk);
	ps.setString(66,sfkclyf);
	ps.setDouble(67,clyf);
	ps.setString(68,sfkzckk);
	ps.setDouble(69,zckk);
	ps.setString(70,sfjzcjl);

	ps.setDouble(71,zcjl);
	ps.setString(72,sfkfkje);
	ps.setDouble(73,fkje);
	ps.setString(74,sfjjlje);
	ps.setDouble(75,jlje);
	ps.setString(76,sfjqtje);
	ps.setDouble(77,qtje);
	ps.setDouble(78,yfje);
	ps.setDate(79,jsrq);
	ps.setString(80,lrr);

	ps.setDate(81,lrsj);
	ps.setString(82,lrbm);
	ps.setString(83,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>