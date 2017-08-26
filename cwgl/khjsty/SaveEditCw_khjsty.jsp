<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double htsjf=0;
double sssjf=0;
double wdzgce=0;
double qye=0;
double zqljzjx=0;
double zhljzjx=0;
double zqgchj=0;
double zhgchj=0;
double gcjsze=0;
double yjgck=0;
double djzgck=0;
double yjgcwk=0;
String sfxmbm1=null;
double sfxmbm1je=0;
String sfxmbm2=null;
double sfxmbm2je=0;
String sfxmbm3=null;
double sfxmbm3je=0;
String sftzk=null;
double zxzkl=0;
double zxqye=0;
double zxzhljzjx=0;
String sfyfq=null;
double fqbl=0;
double fqje=0;
double shfqje=0;
double shsgfq=0;
double shzcfq=0;
String sfydjfx=null;
double djfxje=0;
String sfydyq=null;
double dyq=0;
double gcyhze=0;
String sfydxpzc=null;
double dxpzcje=0;
double dxpzcyh=0;
String sfydgzc=null;
double dgzcje=0;
double dgzcyh=0;
double zcjsze=0;
double xjjzck=0;
double fxjjzck=0;
double ybjzck=0;
String sfyzcfk=null;
double zcfkje=0;
String sfykhpc=null;
double khpck=0;
String sfyyqf=null;
double yqf=0;
double sgdyqf=0;
double sjsyqf=0;
double csyqf=0;
String sfyqtx1=null;
String qtx1mc=null;
double qtx1je=0;
String sfyqtx2=null;
String qtx2mc=null;
double qtx2je=0;
String sfyqtx3=null;
String qtx3mc=null;
double qtx3je=0;
double khbjk=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
double zkl=0;
double gczkyh=0;
double tzkxzyh=0;
String sfyjsgcyh=null;
double jsgcyh=0;
String sfydxpzcyh=null;
String sfydgzcyh=null;
String sfyjszcyh=null;
double jszcyh=0;

ls=request.getParameter("htsjf");
try{
	if (!(ls.equals("")))  htsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sssjf");
try{
	if (!(ls.equals("")))  sssjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sssjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wdzgce]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前签约总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qye]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后签约总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqljzjx");
try{
	if (!(ls.equals("")))  zqljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqljzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前增减项总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhljzjx");
try{
	if (!(ls.equals("")))  zhljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhljzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqgchj");
try{
	if (!(ls.equals("")))  zqgchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqgchj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前工程合计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhgchj");
try{
	if (!(ls.equals("")))  zhgchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhgchj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后工程合计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcjsze");
try{
	if (!(ls.equals("")))  gcjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcjsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程结算总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjgck");
try{
	if (!(ls.equals("")))  yjgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjgck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户已交工程款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djzgck");
try{
	if (!(ls.equals("")))  djzgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djzgck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[定金转工程款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjgcwk");
try{
	if (!(ls.equals("")))  yjgcwk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjgcwk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应交工程尾款]类型转换发生意外:"+e);
	return;
}
sfxmbm1=cf.GB2Uni(request.getParameter("sfxmbm1"));
ls=request.getParameter("sfxmbm1je");
try{
	if (!(ls.equals("")))  sfxmbm1je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sfxmbm1je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目1金额]类型转换发生意外:"+e);
	return;
}
sfxmbm2=cf.GB2Uni(request.getParameter("sfxmbm2"));
ls=request.getParameter("sfxmbm2je");
try{
	if (!(ls.equals("")))  sfxmbm2je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sfxmbm2je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目2金额]类型转换发生意外:"+e);
	return;
}
sfxmbm3=cf.GB2Uni(request.getParameter("sfxmbm3"));
ls=request.getParameter("sfxmbm3je");
try{
	if (!(ls.equals("")))  sfxmbm3je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sfxmbm3je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目3金额]类型转换发生意外:"+e);
	return;
}
sftzk=cf.GB2Uni(request.getParameter("sftzk"));
ls=request.getParameter("zxzkl");
try{
	if (!(ls.equals("")))  zxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxzkl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最新客户折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zxqye");
try{
	if (!(ls.equals("")))  zxqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxqye]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最新折后签约总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zxzhljzjx");
try{
	if (!(ls.equals("")))  zxzhljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxzhljzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最新折后增减项总额]类型转换发生意外:"+e);
	return;
}
sfyfq=cf.GB2Uni(request.getParameter("sfyfq"));
ls=request.getParameter("fqbl");
try{
	if (!(ls.equals("")))  fqbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fqbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返券比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fqje");
try{
	if (!(ls.equals("")))  fqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返券优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shfqje");
try{
	if (!(ls.equals("")))  shfqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shfqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收回减项返券金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shsgfq");
try{
	if (!(ls.equals("")))  shsgfq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shsgfq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收回施工返券]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shzcfq");
try{
	if (!(ls.equals("")))  shzcfq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shzcfq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收回主材返券]类型转换发生意外:"+e);
	return;
}
sfydjfx=cf.GB2Uni(request.getParameter("sfydjfx"));
ls=request.getParameter("djfxje");
try{
	if (!(ls.equals("")))  djfxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djfxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金返现优惠]类型转换发生意外:"+e);
	return;
}
sfydyq=cf.GB2Uni(request.getParameter("sfydyq"));
ls=request.getParameter("dyq");
try{
	if (!(ls.equals("")))  dyq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dyq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[抵用券]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcyhze");
try{
	if (!(ls.equals("")))  gcyhze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcyhze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程优惠总额]类型转换发生意外:"+e);
	return;
}
sfydxpzc=cf.GB2Uni(request.getParameter("sfydxpzc"));
ls=request.getParameter("dxpzcje");
try{
	if (!(ls.equals("")))  dxpzcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dxpzcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代销品主材金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dxpzcyh");
try{
	if (!(ls.equals("")))  dxpzcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dxpzcyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代销品主材优惠]类型转换发生意外:"+e);
	return;
}
sfydgzc=cf.GB2Uni(request.getParameter("sfydgzc"));
ls=request.getParameter("dgzcje");
try{
	if (!(ls.equals("")))  dgzcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dgzcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代购主材金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgzcyh");
try{
	if (!(ls.equals("")))  dgzcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dgzcyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代购主材优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcjsze");
try{
	if (!(ls.equals("")))  zcjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材结算总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xjjzck");
try{
	if (!(ls.equals("")))  xjjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xjjzck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[现金交主材款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fxjjzck");
try{
	if (!(ls.equals("")))  fxjjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fxjjzck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非现金交主材款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ybjzck");
try{
	if (!(ls.equals("")))  ybjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ybjzck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应补交主材款]类型转换发生意外:"+e);
	return;
}
sfyzcfk=cf.GB2Uni(request.getParameter("sfyzcfk"));
ls=request.getParameter("zcfkje");
try{
	if (!(ls.equals("")))  zcfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcfkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材返款金额]类型转换发生意外:"+e);
	return;
}
sfykhpc=cf.GB2Uni(request.getParameter("sfykhpc"));
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
sfyyqf=cf.GB2Uni(request.getParameter("sfyyqf"));
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
ls=request.getParameter("sgdyqf");
try{
	if (!(ls.equals("")))  sgdyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgdyqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队承担延期费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsyqf");
try{
	if (!(ls.equals("")))  sjsyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsyqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师承担延期费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("csyqf");
try{
	if (!(ls.equals("")))  csyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[csyqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厂商承担延期费]类型转换发生意外:"+e);
	return;
}
sfyqtx1=cf.GB2Uni(request.getParameter("sfyqtx1"));
qtx1mc=cf.GB2Uni(request.getParameter("qtx1mc"));
ls=request.getParameter("qtx1je");
try{
	if (!(ls.equals("")))  qtx1je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtx1je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它项1金额]类型转换发生意外:"+e);
	return;
}
sfyqtx2=cf.GB2Uni(request.getParameter("sfyqtx2"));
qtx2mc=cf.GB2Uni(request.getParameter("qtx2mc"));
ls=request.getParameter("qtx2je");
try{
	if (!(ls.equals("")))  qtx2je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtx2je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它项2金额]类型转换发生意外:"+e);
	return;
}
sfyqtx3=cf.GB2Uni(request.getParameter("sfyqtx3"));
qtx3mc=cf.GB2Uni(request.getParameter("qtx3mc"));
ls=request.getParameter("qtx3je");
try{
	if (!(ls.equals("")))  qtx3je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtx3je]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它项3金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khbjk");
try{
	if (!(ls.equals("")))  khbjk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khbjk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户补交款]类型转换发生意外:"+e);
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
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zkl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gczkyh");
try{
	if (!(ls.equals("")))  gczkyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gczkyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程折扣优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tzkxzyh");
try{
	if (!(ls.equals("")))  tzkxzyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tzkxzyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调折扣新增优惠]类型转换发生意外:"+e);
	return;
}
sfyjsgcyh=cf.GB2Uni(request.getParameter("sfyjsgcyh"));
ls=request.getParameter("jsgcyh");
try{
	if (!(ls.equals("")))  jsgcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsgcyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算工程优惠]类型转换发生意外:"+e);
	return;
}
sfydxpzcyh=cf.GB2Uni(request.getParameter("sfydxpzcyh"));
sfydgzcyh=cf.GB2Uni(request.getParameter("sfydgzcyh"));
sfyjszcyh=cf.GB2Uni(request.getParameter("sfyjszcyh"));
ls=request.getParameter("jszcyh");
try{
	if (!(ls.equals("")))  jszcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jszcyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算主材优惠]类型转换发生意外:"+e);
	return;
}
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_khjsty set khbh=?,htsjf=?,sssjf=?,wdzgce=?,qye=?,zqljzjx=?,zhljzjx=?,zqgchj=?,zhgchj=?,gcjsze=?,yjgck=?,djzgck=?,yjgcwk=?,sfxmbm1=?,sfxmbm1je=?,sfxmbm2=?,sfxmbm2je=?,sfxmbm3=?,sfxmbm3je=?,sftzk=?,zxzkl=?,zxqye=?,zxzhljzjx=?,sfyfq=?,fqbl=?,fqje=?,shfqje=?,shsgfq=?,shzcfq=?,sfydjfx=?,djfxje=?,sfydyq=?,dyq=?,gcyhze=?,sfydxpzc=?,dxpzcje=?,dxpzcyh=?,sfydgzc=?,dgzcje=?,dgzcyh=?,zcjsze=?,xjjzck=?,fxjjzck=?,ybjzck=?,sfyzcfk=?,zcfkje=?,sfykhpc=?,khpck=?,sfyyqf=?,yqf=?,sgdyqf=?,sjsyqf=?,csyqf=?,sfyqtx1=?,qtx1mc=?,qtx1je=?,sfyqtx2=?,qtx2mc=?,qtx2je=?,sfyqtx3=?,qtx3mc=?,qtx3je=?,khbjk=?,lrr=?,lrsj=?,lrbm=?,bz=?,zkl=?,gczkyh=?,tzkxzyh=?,sfyjsgcyh=?,jsgcyh=?,sfydxpzcyh=?,sfydgzcyh=?,sfyjszcyh=?,jszcyh=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDouble(2,htsjf);
	ps.setDouble(3,sssjf);
	ps.setDouble(4,wdzgce);
	ps.setDouble(5,qye);
	ps.setDouble(6,zqljzjx);
	ps.setDouble(7,zhljzjx);
	ps.setDouble(8,zqgchj);
	ps.setDouble(9,zhgchj);
	ps.setDouble(10,gcjsze);
	ps.setDouble(11,yjgck);
	ps.setDouble(12,djzgck);
	ps.setDouble(13,yjgcwk);
	ps.setString(14,sfxmbm1);
	ps.setDouble(15,sfxmbm1je);
	ps.setString(16,sfxmbm2);
	ps.setDouble(17,sfxmbm2je);
	ps.setString(18,sfxmbm3);
	ps.setDouble(19,sfxmbm3je);
	ps.setString(20,sftzk);
	ps.setDouble(21,zxzkl);
	ps.setDouble(22,zxqye);
	ps.setDouble(23,zxzhljzjx);
	ps.setString(24,sfyfq);
	ps.setDouble(25,fqbl);
	ps.setDouble(26,fqje);
	ps.setDouble(27,shfqje);
	ps.setDouble(28,shsgfq);
	ps.setDouble(29,shzcfq);
	ps.setString(30,sfydjfx);
	ps.setDouble(31,djfxje);
	ps.setString(32,sfydyq);
	ps.setDouble(33,dyq);
	ps.setDouble(34,gcyhze);
	ps.setString(35,sfydxpzc);
	ps.setDouble(36,dxpzcje);
	ps.setDouble(37,dxpzcyh);
	ps.setString(38,sfydgzc);
	ps.setDouble(39,dgzcje);
	ps.setDouble(40,dgzcyh);
	ps.setDouble(41,zcjsze);
	ps.setDouble(42,xjjzck);
	ps.setDouble(43,fxjjzck);
	ps.setDouble(44,ybjzck);
	ps.setString(45,sfyzcfk);
	ps.setDouble(46,zcfkje);
	ps.setString(47,sfykhpc);
	ps.setDouble(48,khpck);
	ps.setString(49,sfyyqf);
	ps.setDouble(50,yqf);
	ps.setDouble(51,sgdyqf);
	ps.setDouble(52,sjsyqf);
	ps.setDouble(53,csyqf);
	ps.setString(54,sfyqtx1);
	ps.setString(55,qtx1mc);
	ps.setDouble(56,qtx1je);
	ps.setString(57,sfyqtx2);
	ps.setString(58,qtx2mc);
	ps.setDouble(59,qtx2je);
	ps.setString(60,sfyqtx3);
	ps.setString(61,qtx3mc);
	ps.setDouble(62,qtx3je);
	ps.setDouble(63,khbjk);
	ps.setString(64,lrr);
	ps.setDate(65,lrsj);
	ps.setString(66,lrbm);
	ps.setString(67,bz);
	ps.setDouble(68,zkl);
	ps.setDouble(69,gczkyh);
	ps.setDouble(70,tzkxzyh);
	ps.setString(71,sfyjsgcyh);
	ps.setDouble(72,jsgcyh);
	ps.setString(73,sfydxpzcyh);
	ps.setString(74,sfydgzcyh);
	ps.setString(75,sfyjszcyh);
	ps.setDouble(76,jszcyh);
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