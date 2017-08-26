<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xb=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
long fwmj=0;
double qye=0;
double wdzgce=0;
double suijinbfb=0;
double suijin=0;
double sjf=0;
double glf=0;
double zqguanlif=0;
double guanlif=0;
String sfyyh=null;
long pmjj=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cgdz=null;
String hdr=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdr=cf.GB2Uni(request.getParameter("hdr"));

String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
String yhyy=cf.GB2Uni(request.getParameter("yhyy"));
String qyxh=cf.GB2Uni(request.getParameter("qyxh"));
xb=cf.GB2Uni(request.getParameter("xb"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房屋面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折工程额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("suijinbfb");
try{
	if (!(ls.equals("")))  suijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量suijinbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量suijin不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[服务费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqguanlif");
try{
	if (!(ls.equals("")))  zqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前－管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("guanlif");
try{
	if (!(ls.equals("")))  guanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量guanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费]类型转换发生意外:"+e);
	return;
}
sfyyh=cf.GB2Uni(request.getParameter("sfyyh"));
ls=request.getParameter("pmjj");
try{
	if (!(ls.equals("")))  pmjj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每平米均价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应开工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应竣工日期]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String zybm=request.getParameter("zybm");
String czbm=request.getParameter("czbm");
String fjfwbm=cf.GB2Uni(request.getParameter("fjfwbm"));

String sffj=cf.GB2Uni(request.getParameter("sffj"));
double fjje=0;
double gsfje=0;
ls=request.getParameter("fjje");
try{
	if (!(ls.equals("")))  fjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返卷总金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsfje");
try{
	if (!(ls.equals("")))  gsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担返卷额]类型转换发生意外:"+e);
	return;
}
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));

java.sql.Date jyjdrq=null;
ls=request.getParameter("jyjdrq");
try{
	if (!(ls.equals("")))  jyjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jyjdrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[建议交底日期]类型转换发生意外:"+e);
	return;
}

String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sfcjq=cf.GB2Uni(request.getParameter("sfcjq"));
String sffby=cf.GB2Uni(request.getParameter("sffby"));

String hykh=cf.GB2Uni(request.getParameter("hykh"));
String hyklxbm=cf.GB2Uni(request.getParameter("hyklxbm"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
java.sql.Date yxsjs=null;
ls=request.getParameter("yxsjs");
try{
	if (!(ls.equals("")))  yxsjs=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxsjs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[会员有效时间始]类型转换发生意外:"+e);
	return;
}
java.sql.Date yxsjz=null;
ls=request.getParameter("yxsjz");
try{
	if (!(ls.equals("")))  yxsjz=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxsjz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[会员有效时间止]类型转换发生意外:"+e);
	return;
}

String sffk=cf.GB2Uni(request.getParameter("sffk"));
String djkh=cf.GB2Uni(request.getParameter("djkh"));
java.sql.Date fkrq=null;
ls=request.getParameter("fkrq");
try{
	if (!(ls.equals("")))  fkrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发卡日期]类型转换发生意外:"+e);
	return;
}


//折扣率
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同折扣率]类型转换发生意外:"+e);
	return;
}

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String kgsjqd=cf.GB2Uni(request.getParameter("kgsjqd"));

String rzsc=cf.GB2Uni(request.getParameter("rzsc"));
String email=cf.GB2Uni(request.getParameter("email"));

String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));
int gqts=0;
ls=request.getParameter("gqts");
try{
	if (!(ls.equals("")))  gqts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gqts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工期天数]类型转换发生意外:"+e);
	return;
}


double cdzwjmje=0;
ls=request.getParameter("cdzwjmje");
try{
	if (!(ls.equals("")))  cdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cdzwjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同减免额]类型转换发生意外:"+e);
	return;
}
double glfjmje=0;
ls=request.getParameter("glfjmje");
try{
	if (!(ls.equals("")))  glfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费减免额]类型转换发生意外:"+e);
	return;
}
double sjjmje=0;
ls=request.getParameter("sjjmje");
try{
	if (!(ls.equals("")))  sjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金减免额]类型转换发生意外:"+e);
	return;
}


double glfbfb=0;
ls=request.getParameter("glfbfb");
try{
	if (!(ls.equals("")))  glfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费百分比]类型转换发生意外:"+e);
	return;
}
double zqwjrqyexm=0;
ls=request.getParameter("zqwjrqyexm");
try{
	if (!(ls.equals("")))  zqwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前未记入签约额项目]类型转换发生意外:"+e);
	return;
}
double zhwjrqyexm=0;
ls=request.getParameter("zhwjrqyexm");
try{
	if (!(ls.equals("")))  zhwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后未记入签约额项目]类型转换发生意外:"+e);
	return;
}
String wjrqyexmsm=cf.GB2Uni(request.getParameter("wjrqyexmsm"));


double zqgczjf=0;
ls=request.getParameter("zqgczjf");
try{
	if (!(ls.equals("")))  zqgczjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqgczjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程直接费－折前]类型转换发生意外:"+e);
	return;
}
double zhgczjf=0;
ls=request.getParameter("zhgczjf");
try{
	if (!(ls.equals("")))  zhgczjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhgczjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程直接费－折后]类型转换发生意外:"+e);
	return;
}
double zqqtsf=0;
ls=request.getParameter("zqqtsf");
try{
	if (!(ls.equals("")))  zqqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[记入业绩其它费－折前]类型转换发生意外:"+e);
	return;
}
double zhqtsf=0;
ls=request.getParameter("zhqtsf");
try{
	if (!(ls.equals("")))  zhqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[记入业绩其它费－折后]类型转换发生意外:"+e);
	return;
}
String qtsfsm=cf.GB2Uni(request.getParameter("qtsfsm"));

double zqsuijin=0;
ls=request.getParameter("zqsuijin");
try{
	if (!(ls.equals("")))  zqsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqsuijin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前税金]类型转换发生意外:"+e);
	return;
}
double zqsjf=0;
ls=request.getParameter("zqsjf");
try{
	if (!(ls.equals("")))  zqsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费－折前]类型转换发生意外:"+e);
	return;
}
double hdzsjz=0;
ls=request.getParameter("hdzsjz");
try{
	if (!(ls.equals("")))  hdzsjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hdzsjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[活动赠送净值]类型转换发生意外:"+e);
	return;
}
double djjje=0;
ls=request.getParameter("djjje");
try{
	if (!(ls.equals("")))  djjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送代金券]类型转换发生意外:"+e);
	return;
}
double cbj=0;
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}


double sgcbj=0;
ls=request.getParameter("sgcbj");
try{
	if (!(ls.equals("")))  sgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工成本价]类型转换发生意外:"+e);
	return;
}
double gcjcbj=0;
ls=request.getParameter("gcjcbj");
try{
	if (!(ls.equals("")))  gcjcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcjcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程基础报价]类型转换发生意外:"+e);
	return;
}
double htjz=0;
ls=request.getParameter("htjz");
try{
	if (!(ls.equals("")))  htjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同净值]类型转换发生意外:"+e);
	return;
}

double mll=0;
ls=request.getParameter("mll");
try{
	if (!(ls.equals("")))  mll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[毛利率]类型转换发生意外:"+e);
	return;
}
double mle=0;
ls=request.getParameter("mle");
try{
	if (!(ls.equals("")))  mle=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[mle]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[毛利额]类型转换发生意外:"+e);
	return;
}
double yjjzcs=0;
ls=request.getParameter("yjjzcs");
try{
	if (!(ls.equals("")))  yjjzcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjjzcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩净值参数]类型转换发生意外:"+e);
	return;
}
double yjjz=0;
ls=request.getParameter("yjjz");
try{
	if (!(ls.equals("")))  yjjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩净值]类型转换发生意外:"+e);
	return;
}


double gcfqdzk=0;
ls=request.getParameter("gcfqdzk");
try{
	if (!(ls.equals("")))  gcfqdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcfqdzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费签单折扣]类型转换发生意外:"+e);
	return;
}
double glfzk=0;
ls=request.getParameter("glfzk");
try{
	if (!(ls.equals("")))  glfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[glfzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费折扣]类型转换发生意外:"+e);
	return;
}
double sjzk=0;
ls=request.getParameter("sjzk");
try{
	if (!(ls.equals("")))  sjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金折扣]类型转换发生意外:"+e);
	return;
}
double sjfzk=0;
ls=request.getParameter("sjfzk");
try{
	if (!(ls.equals("")))  sjfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjfzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费折扣]类型转换发生意外:"+e);
	return;
}
double djjbfb=0;
ls=request.getParameter("djjbfb");
try{
	if (!(ls.equals("")))  djjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代金券百分比]类型转换发生意外:"+e);
	return;
}
double rzfbfb=0;
ls=request.getParameter("rzfbfb");
try{
	if (!(ls.equals("")))  rzfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rzfbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[认证费百分比]类型转换发生意外:"+e);
	return;
}
double zqhtzcbj=0;
ls=request.getParameter("zqhtzcbj");
try{
	if (!(ls.equals("")))  zqhtzcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqhtzcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同主材报价－折前]类型转换发生意外:"+e);
	return;
}
double zhhtzcbj=0;
ls=request.getParameter("zhhtzcbj");
try{
	if (!(ls.equals("")))  zhhtzcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhhtzcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同主材报价－折后]类型转换发生意外:"+e);
	return;
}
double djfxje=0;
ls=request.getParameter("djfxje");
try{
	if (!(ls.equals("")))  djfxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djfxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金返现金额]类型转换发生意外:"+e);
	return;
}

double gcfzjxzk=gcfqdzk;

String hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
String hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));

String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));
String fkfabm=request.getParameter("fkfabm");
String dzbjjc=request.getParameter("dzbjjc");

String hdsfss=null;
if (!hdbz.equals("1"))
{
	hdsfss="0";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;

	String nian=request.getParameter("qyrq").substring(0,4);
	String yue=request.getParameter("qyrq").substring(5,7);
	ls_sql="select count(*)";
	ls_sql+=" from  cw_yjdjjl";
	ls_sql+=" where  nian='"+nian+"' and yue='"+yue+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<font color='#FF0000'>注意！["+nian+"年"+yue+"月]业绩已冻结，不能再修改签单信息</font>");
		return;
	}



	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	ls_sql="select hxmjbm";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" where  qd<"+fwmj+" and "+fwmj+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxmjbm=rs.getString("hxmjbm");
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);

	if (!dzbjjc.equals("4") && !dzbjjc.equals("7"))
	{
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khzk";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			ls_sql="insert into crm_khzk (khbh,gcfqdzk,gcfzjxzk,glfzk,sjzk,sjfzk  ,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk) ";
			ls_sql+=" values(?,?,?,?,?,?,10,10,10,10,10,10,10)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setDouble(2,gcfqdzk);
			ps.setDouble(3,gcfzjxzk);
			ps.setDouble(4,glfzk);
			ps.setDouble(5,sjzk);
			ps.setDouble(6,sjfzk);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update crm_khzk set gcfqdzk=?,gcfzjxzk=?,glfzk=?,sjzk=?,sjfzk=?";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,gcfqdzk);
			ps.setDouble(2,gcfzjxzk);
			ps.setDouble(3,glfzk);
			ps.setDouble(4,sjzk);
			ps.setDouble(5,sjfzk);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="delete from cw_khfkfa  ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_khfkfa(khbh,fkfabm)";
	ls_sql+=" values(?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,fkfabm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set xb=?,email=?,qdsj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xb);
	ps.setString(2,email);
	ps.setDate(3,qyrq);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khqye ";
	ls_sql+=" set hdzsjz=?,zxzsjz=?,cbj=?,zxcbj=?,sgcbj=?,zxsgcbj=?,gcjcbj=?,zxgcjcbj=?,htjz=?,zxhtjz=? ";
	ls_sql+=" ,mll=?,zxmll=?,mle=?,zxmle=?,yjjzcs=?,yjjz=?,zxyjjz=?,djjbfb=?,djjje=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,hdzsjz);
	ps.setDouble(2,hdzsjz);
	ps.setDouble(3,cbj);
	ps.setDouble(4,cbj);
	ps.setDouble(5,sgcbj);
	ps.setDouble(6,sgcbj);
	ps.setDouble(7,gcjcbj);
	ps.setDouble(8,gcjcbj);
	ps.setDouble(9,htjz);
	ps.setDouble(10,htjz);

	ps.setDouble(11,mll);
	ps.setDouble(12,mll);
	ps.setDouble(13,mle);
	ps.setDouble(14,mle);
	ps.setDouble(15,yjjzcs);
	ps.setDouble(16,yjjz);
	ps.setDouble(17,yjjz);
	ps.setDouble(18,djjbfb);
	ps.setDouble(19,djjje);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set xb=?,hxbm=?,fgflbm=?,zxjwbm=?,ysbm=?,hxmjbm=?,fwmj=?,pmjj=?,qyrq=?,kgrq=?";
	ls_sql+=" ,hdbz=?,khlxbm=?,bz=?,jgrq=?,cgdz=?,hdr=?,hdsfss=?,nlqjbm=?,zybm=?,fjfwbm=?";
	ls_sql+=" ,czbm=?,sffj=?,sfyrz=?,jyjdrq=?,email=?,fjje=?,gsfje=?,jzbz=?,sfcjq=?,sffby=?";
	ls_sql+=" ,sfzhm=?,hykh=?,hyklxbm=?,yxsjs=?,yxsjz=?,kgsjqd=?,ysrbm=?,sffk=?,djkh=?,fkrq=?";
	ls_sql+=" ,rzsc=?,smhtbh=?,gqts=?,hdsgd=?,hdsgbz=?,xxlysm=?,wdzgce=?,qye=?,zkl=?,suijinbfb=? ";
	ls_sql+=" ,zqsuijin=?,suijin=?,glfbfb=?,zqguanlif=?,guanlif=?,zqgczjf=?,zhgczjf=?,zqqtsf=?,zhqtsf=?,qtsfsm=? ";
	ls_sql+=" ,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,zqsjf=?,sjf=?,glf=?,cdzwjmje=?,glfjmje=?,sjjmje=?,zqhtzcbj=?,zhhtzcbj=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xb);
	ps.setString(2,hxbm);
	ps.setString(3,fgflbm);
	ps.setString(4,zxjwbm);
	ps.setString(5,ysbm);
	ps.setString(6,hxmjbm);
	ps.setLong(7,fwmj);
	ps.setLong(8,pmjj);
	ps.setDate(9,qyrq);
	ps.setDate(10,kgrq);

	ps.setString(11,hdbz);
	ps.setString(12,khlxbm);
	ps.setString(13,bz);
	ps.setDate(14,jgrq);
	ps.setString(15,cgdz);
	ps.setString(16,hdr);
	ps.setString(17,hdsfss);
	ps.setString(18,nlqjbm);
	ps.setString(19,zybm);
	ps.setString(20,fjfwbm);

	ps.setString(21,czbm);
	ps.setString(22,sffj);
	ps.setString(23,sfyrz);
	ps.setDate(24,jyjdrq);
	ps.setString(25,email);
	ps.setDouble(26,fjje);
	ps.setDouble(27,gsfje);
	ps.setString(28,jzbz);
	ps.setString(29,sfcjq);
	ps.setString(30,sffby);

	ps.setString(31,sfzhm);
	ps.setString(32,hykh);
	ps.setString(33,hyklxbm);
	ps.setDate(34,yxsjs);
	ps.setDate(35,yxsjz);
	ps.setString(36,kgsjqd);
	ps.setString(37,ysrbm);
	ps.setString(38,sffk);
	ps.setString(39,djkh);
	ps.setDate(40,fkrq);
	
	ps.setString(41,rzsc);
	ps.setString(42,smhtbh);
	ps.setInt(43,gqts);
	ps.setString(44,hdsgd);
	ps.setString(45,hdsgbz);
	ps.setString(46,xxlysm);
	ps.setDouble(47,wdzgce);
	ps.setDouble(48,qye);
	ps.setDouble(49,zkl);
	ps.setDouble(50,suijinbfb);

	ps.setDouble(51,zqsuijin);
	ps.setDouble(52,suijin);
	ps.setDouble(53,glfbfb);
	ps.setDouble(54,zqguanlif);
	ps.setDouble(55,guanlif);
	ps.setDouble(56,zqgczjf);
	ps.setDouble(57,zhgczjf);
	ps.setDouble(58,zqqtsf);
	ps.setDouble(59,zhqtsf);
	ps.setString(60,qtsfsm);

	ps.setDouble(61,zqwjrqyexm);
	ps.setDouble(62,zhwjrqyexm);
	ps.setString(63,wjrqyexmsm);
	ps.setDouble(64,zqsjf);
	ps.setDouble(65,sjf);
	ps.setDouble(66,glf);
	ps.setDouble(67,cdzwjmje);
	ps.setDouble(68,glfjmje);
	ps.setDouble(69,sjjmje);
	ps.setDouble(70,zqhtzcbj);
	ps.setDouble(71,zhhtzcbj);


	ps.executeUpdate();
	ps.close();




	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>