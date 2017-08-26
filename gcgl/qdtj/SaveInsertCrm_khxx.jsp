<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
String hth=null;
String sjs=null;
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
String dwbh=null;
java.sql.Date lrsj=null;
String hdbz=null;
String khlxbm=null;
String lrr=null;
String bz=null;

String cgdz=null;
String hdr=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdr=cf.GB2Uni(request.getParameter("hdr"));

String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
String yhyy=cf.GB2Uni(request.getParameter("yhyy"));

khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
hth=cf.GB2Uni(request.getParameter("hth"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
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
	out.println("<BR>[折后－管理费]类型转换发生意外:"+e);
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
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上报日期]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));

String nlqjbm=request.getParameter("nlqjbm");
String zybm=request.getParameter("zybm");
String czbm=request.getParameter("czbm");
String fjfwbm=cf.GB2Uni(request.getParameter("fjfwbm"));

String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
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
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));
String kgsjqd=cf.GB2Uni(request.getParameter("kgsjqd"));

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

String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sfcjq=cf.GB2Uni(request.getParameter("sfcjq"));
String sffby=cf.GB2Uni(request.getParameter("sffby"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

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


String louhao=cf.GB2Uni(request.getParameter("louhao"));
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
	out.println("<BR>[综合折扣]类型转换发生意外:"+e);
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

String khjl=cf.GB2Uni(request.getParameter("khjl"));
String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));
String fkfabm=request.getParameter("fkfabm");


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


String hdsfss=null;
if (!hdbz.equals("1"))
{
	hdsfss="0";
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));


String rzsc=cf.GB2Uni(request.getParameter("rzsc"));
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));//启用电子报价检查
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

/*
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
*/
String hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
String hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
String yxtxdz=cf.GB2Uni(request.getParameter("yxtxdz"));
String fqkh=cf.GB2Uni(request.getParameter("fqkh"));
String hyh=cf.GB2Uni(request.getParameter("hyh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));
String ywyssxz=request.getParameter("ywyssxz");
String ysy=cf.GB2Uni(request.getParameter("ysy"));
String ywybm=request.getParameter("ywybm");
String pdqybm=request.getParameter("pdqybm");


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

double gcfzjxzk=gcfqdzk;

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

double tcbzjg=0;
ls=request.getParameter("tcbzjg");
try{
	if (!(ls.equals("")))  tcbzjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcbzjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐标准价格]类型转换发生意外:"+e);
	return;
}
double tcmjzjje=0;
ls=request.getParameter("tcmjzjje");
try{
	if (!(ls.equals("")))  tcmjzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcmjzjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积增加金额]类型转换发生意外:"+e);
	return;
}
double tczcsjcj=0;
ls=request.getParameter("tczcsjcj");
try{
	if (!(ls.equals("")))  tczcsjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tczcsjcj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材升级差价]类型转换发生意外:"+e);
	return;
}
double tczccljj=0;
ls=request.getParameter("tczccljj");
try{
	if (!(ls.equals("")))  tczccljj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tczccljj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材超量加价]类型转换发生意外:"+e);
	return;
}
double tcxsfzc=0;
ls=request.getParameter("tcxsfzc");
try{
	if (!(ls.equals("")))  tcxsfzc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcxsfzc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[需收费主材]类型转换发生意外:"+e);
	return;
}
double tczcjm=0;
ls=request.getParameter("tczcjm");
try{
	if (!(ls.equals("")))  tczcjm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tczcjm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材减免]类型转换发生意外:"+e);
	return;
}
double tcdpsj=0;
ls=request.getParameter("tcdpsj");
try{
	if (!(ls.equals("")))  tcdpsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcdpsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[顶配升级]类型转换发生意外:"+e);
	return;
}
double tcdpdlsf=0;
ls=request.getParameter("tcdpdlsf");
try{
	if (!(ls.equals("")))  tcdpdlsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcdpdlsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[顶配独立收费]类型转换发生意外:"+e);
	return;
}
double tcxpx=0;
ls=request.getParameter("tcxpx");
try{
	if (!(ls.equals("")))  tcxpx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcxpx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[选配项]类型转换发生意外:"+e);
	return;
}
double tcwsgzj=0;
ls=request.getParameter("tcwsgzj");
try{
	if (!(ls.equals("")))  tcwsgzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcwsgzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐外施工项造价]类型转换发生意外:"+e);
	return;
}
double tcwgccljj=0;
ls=request.getParameter("tcwgccljj");
try{
	if (!(ls.equals("")))  tcwgccljj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcwgccljj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程超量加价]类型转换发生意外:"+e);
	return;
}
double tcwzjzc=0;
ls=request.getParameter("tcwzjzc");
try{
	if (!(ls.equals("")))  tcwzjzc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcwzjzc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐外增加主材]类型转换发生意外:"+e);
	return;
}
double tcsgze=0;
ls=request.getParameter("tcsgze");
try{
	if (!(ls.equals("")))  tcsgze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcsgze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工总额]类型转换发生意外:"+e);
	return;
}
double tcqtsf=0;
ls=request.getParameter("tcqtsf");
try{
	if (!(ls.equals("")))  tcqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐－其它收费]类型转换发生意外:"+e);
	return;
}
double zctcje=0;
ls=request.getParameter("zctcje");
try{
	if (!(ls.equals("")))  zctcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zctcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材套餐金额]类型转换发生意外:"+e);
	return;
}
double wntcje=0;
ls=request.getParameter("wntcje");
try{
	if (!(ls.equals("")))  wntcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wntcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[温暖套餐金额]类型转换发生意外:"+e);
	return;
}
double jytcje=0;
ls=request.getParameter("jytcje");
try{
	if (!(ls.equals("")))  jytcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jytcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[静音套餐金额]类型转换发生意外:"+e);
	return;
}
double sctcje=0;
ls=request.getParameter("sctcje");
try{
	if (!(ls.equals("")))  sctcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sctcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[色彩套餐金额]类型转换发生意外:"+e);
	return;
}
double jktcje=0;
ls=request.getParameter("jktcje");
try{
	if (!(ls.equals("")))  jktcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jktcje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[健康套餐金额]类型转换发生意外:"+e);
	return;
}
double sjhtsjf=0;
ls=request.getParameter("sjhtsjf");
try{
	if (!(ls.equals("")))  sjhtsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjhtsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费]类型转换发生意外:"+e);
	return;
}



String sfyckh=cf.GB2Uni(request.getParameter("sfyckh"));

String clgw=cf.GB2Uni(request.getParameter("clgw"));
String xjf=cf.GB2Uni(request.getParameter("xjf"));
String cqhtbz=cf.GB2Uni(request.getParameter("cqhtbz"));
String dianz=cf.GB2Uni(request.getParameter("dianz"));
String weny=cf.GB2Uni(request.getParameter("weny"));
String scbjl=cf.GB2Uni(request.getParameter("scbjl"));

String sjsgh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	qddj.Qddj qddj=new qddj.Qddj();
	String ret="";

	//[电子报价金额]是否正确
	ret=qddj.checkBjje(conn,dzbjjc,khbh,wdzgce,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//[客户姓名]检查
	ret=qddj.checkKhxm(khxm,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	//[房屋地址]检查
	ret=qddj.checkFwdz(conn,khbh,fwdz,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	
	//[合同号]检查＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String sykhbh="";

	ls_sql="select khbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sykhbh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!sykhbh.equals(""))
	{
		out.println("<BR>错误！合同号已被客户["+sykhbh+"]使用");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_hthxx";
	ls_sql+=" where  hth='"+hth+"' and dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("<BR>错误！不存在合同号，请首先在系统中申请合同号");
		return;
	}

	//合同号检查
	sykhbh="";
	ls_sql="select khbh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sykhbh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!sykhbh.equals(""))
	{
		out.println("<BR>错误！合同号已被咨询客户["+sykhbh+"]使用");
		return;
	}
	//[合同号]检查＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//对[促销活动]做检查
	ret=qddj.checkCxhd(conn,fgsbh,cxhdbm,cxhdbmxq,cxhdbmzh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//[签单客户补录允许天数]检查
	ret=qddj.checkQyrq(conn,fgsbh,lrsj,qyrq,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}


	//取[设计师工号]
	sjsgh=qddj.getSjs(conn,dwbh,sjs,"yz");

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


	//项目专员
	String xmzy=null;
	ls_sql="select xmzy";
	ls_sql+=" from  sq_xmzy";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();

	//客户类型
	String mqzt=null;
	String mqxmzy=null;
	ls_sql="select zt,xmzy";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqzt=rs.getString("zt");//2：家装客户；3：退单客户；4：非家装客户；5：设计客户
		mqxmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	String fjtcbz="";
	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		fjtcbz="N";
	}
	else{
		fjtcbz="M";
	}


	String pdr=null;
	java.sql.Date pdsj=null;
	ls_sql="select pdr,pdsj";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdr=rs.getString("pdr");
		pdsj=rs.getDate("pdsj");
	}
	rs.close();
	ps.close();

	String gcysbbh=null;
	ls_sql="SELECT gcysbbh";
	ls_sql+=" FROM dm_hegcysbb ";
	ls_sql+=" where  sfzybb='2'";//1：未启用；2：当前版；3：可用版；4：已停用
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	
	if (!dzbjjc.equals("4") && !dzbjjc.equals("7"))
	{
		count=0;
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

	ls_sql="insert into cw_khfkfa(khbh,fkfabm)";
	ls_sql+=" values(?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,fkfabm);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from  crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_zxkhxx set zxzt='3',khxm=?,xb=?,fwdz=?,email=?,cqbm=?,xqbm=?,louhao=?,hth=?,qdsj=?,dianz=?,weny=?,scbjl=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,email);
	ps.setString(5,cqbm);
	ps.setString(6,xqbm);
	ps.setString(7,louhao);
	ps.setString(8,hth);
	ps.setDate(9,qyrq);
	ps.setString(10,dianz);
	ps.setString(11,weny);
	ps.setString(12,scbjl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_hthxx set sybz='Y',khbh=? ";
	ls_sql+=" where  hth='"+hth+"' and sybz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	String pdclzt=null;
	if (sgd.equals(""))
	{
		pdclzt="1";//1：申请派单；2：人工派单；5：电子派单；6：特权派单；7：拒单；8：换施工队；4：不许修改派单
	}
	else{
		pdclzt="2";
	}

	
	//主材合同毛利计算＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql=" update jc_zcdd  ";
	ls_sql+=" set sfjrht='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_zczjx  ";
	ls_sql+=" set sfjrht='Y'";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('00','99')";//00：录入未完成；01：录入已完成；02：已确认；03：已送货；04：厂家已接收；99；退单
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double zchtje=0;
	double zchtcb=0;
	ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zchtje=rs.getDouble(1);//主材销售额
		zchtcb=rs.getInt(2);//主材成本额
	}
	rs.close();
	ps.close();

	double zchtml=0;//主材合同毛利
	if (zchtje!=0)
	{
		zchtml=cf.round((zchtje-zchtcb)*100/zchtje,2);
	}

	double khhtml=0;//客户合同毛利
	if ((zchtje+htjz)!=0)
	{
		khhtml=cf.round((zchtje-zchtcb+mle)*100/(zchtje+htjz),2);
	}
	//主材合同毛利计算＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	ls_sql=" insert into crm_khqye (khbh,dzbjjc,hdzsjz,zxzsjz,djfxje,djjje,zjxdjjje,rzfbfb,htrzf,zjxrzf ";
	ls_sql+=" ,cbj,zxcbj,sgcbj,zxsgcbj,gcjcbj,zxgcjcbj,htjz,zxhtjz,mll,zxmll   ,mle,zxmle,yjjzcs,yjjz,zxyjjz,djjbfb   ,zchtje,zchtcb,zczxje,zczxcb,zchtml,zczxml,khhtml,khzxml) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,dzbjjc);
	ps.setDouble(3,hdzsjz);
	ps.setDouble(4,hdzsjz);
	ps.setDouble(5,djfxje);
	ps.setDouble(6,djjje);
	ps.setDouble(7,0);
	ps.setDouble(8,rzfbfb);
	ps.setDouble(9,0);
	ps.setDouble(10,0);

	ps.setDouble(11,cbj);
	ps.setDouble(12,cbj);
	ps.setDouble(13,sgcbj);
	ps.setDouble(14,sgcbj);
	ps.setDouble(15,gcjcbj);
	ps.setDouble(16,gcjcbj);
	ps.setDouble(17,htjz);
	ps.setDouble(18,htjz);
	ps.setDouble(19,mll);
	ps.setDouble(20,mll);

	ps.setDouble(21,mle);
	ps.setDouble(22,mle);
	ps.setDouble(23,yjjzcs);
	ps.setDouble(24,yjjz);
	ps.setDouble(25,yjjz);
	ps.setDouble(26,djjbfb);

	ps.setDouble(27,zchtje);
	ps.setDouble(28,zchtcb);
	ps.setDouble(29,zchtje);
	ps.setDouble(30,zchtcb);
	ps.setDouble(31,zchtml);
	ps.setDouble(32,zchtml);
	ps.setDouble(33,khhtml);
	ps.setDouble(34,khhtml);
	ps.executeUpdate();
	ps.close();
	

	ls_sql=" delete from crm_tckhqye ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		ls_sql=" insert into crm_tckhqye (khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje   ,tcbzjgzjx,tcmjzjjezjx,tczcsjcjzjx,tczccljjzjx,tcxsfzczjx,tczcjmzjx,tcdpsjzjx,tcdpdlsfzjx,tcxpxzjx,tcwsgzjzjx,tcwgccljjzjx,tcwzjzczjx,tcsgzezjx,tcqtsfzjx   ,zctcjezjx,wntcjezjx,jytcjezjx,sctcjezjx,jktcjezjx)  ";
		ls_sql+=" values ( ?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setDouble(2,tcbzjg);
		ps.setDouble(3,tcmjzjje);
		ps.setDouble(4,tczcsjcj);
		ps.setDouble(5,tczccljj);
		ps.setDouble(6,tcxsfzc);
		ps.setDouble(7,tczcjm);
		ps.setDouble(8,tcdpsj);
		ps.setDouble(9,tcdpdlsf);
		ps.setDouble(10,tcxpx);
		ps.setDouble(11,tcwsgzj);
		ps.setDouble(12,tcwgccljj);
		ps.setDouble(13,tcwzjzc);
		ps.setDouble(14,tcsgze);
		ps.setDouble(15,tcqtsf);

		ps.setDouble(16,zctcje);
		ps.setDouble(17,wntcje);
		ps.setDouble(18,jytcje);
		ps.setDouble(19,sctcje);
		ps.setDouble(20,jktcje);

		ps.setDouble(21,zctcje);
		ps.setDouble(22,wntcje);
		ps.setDouble(23,jytcje);
		ps.setDouble(24,sctcje);
		ps.setDouble(25,jktcje);
		ps.executeUpdate();
		ps.close();
	}
	

	ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm  ";
	ls_sql+=" ,hth,sjs,qye,sfyyh,pmjj,qyrq,kgrq,dwbh,hdbz,khlxbm ";
	ls_sql+=" ,cqbm,yhyy,fwmj,jgrq,cgdz,hdr,hdsfss,ysrbm,nlqjbm,zybm";
	ls_sql+=" ,fjfwbm,czbm,zkl,xqbm,sffj,sfyrz,jyjdrq,qtdh,email,fjje";
	ls_sql+=" ,cxhdbm,bjjb,ywy,sjf,glf,wdzgce,gsfje,jzbz,sfcjq,sffby ";
	ls_sql+=" ,sjsbh,fgsbh,sfzhm,hykh,hyklxbm,yxsjs,yxsjz,kgsjqd,xmzy,sffk";
	ls_sql+=" ,djkh,fkrq,louhao,zt,rzsc,sjsgh,suijinbfb,suijin,guanlif,cxhdbmxq";
	ls_sql+=" ,cxhdbmzh,zqguanlif,smhtbh,gqts,hdsgd,hdsgbz,cdzwjmje,glfbfb,zqwjrqyexm,zhwjrqyexm ";
	ls_sql+=" ,wjrqyexmsm,glfjmje,sjjmje,khjl,xxlysm,yxtxdz,fqkh,hyh,sgd,zqsuijin ";
	ls_sql+=" ,zqzjxsuijin,zjxm,jiedao,pdclzt,ywyssxz,ysy,zqgczjf,zhgczjf,zqqtsf,zhqtsf";
	ls_sql+=" ,zqsjf,zqqtsfzjx,zhqtsfzjx,zqwjrzjx,zhwjrzjx,wjrzjxsm,qtsfsm,lrr,lrsj,bz ";
	ls_sql+=" ,sgbz,fjtcbz,sfyckh,ywybm,pdqybm,clgw,xjf,zqhtzcbj,zhhtzcbj,dianz,weny,cqhtbz,sjhtsjf,scbjl ";
	ls_sql+=" ,pdr,pdsj,pdsm,pzjr,pzjsj,gcysbbh,mbbm ";

	ls_sql+=" ,tsbz,ybjbz,gcjdbm,sfxhf   ,kpbz,bxbz,hfdjbz,gdjsjd,htshbz";
	ls_sql+=" ,kbxbz,dalqbz,kgzbz,clf,sge    ,sfke,tgbz,sjsjsbz,ywyjsbz,zjxje";
	ls_sql+=" ,zjxwcbz,wtkhbz,sfyfdx,zhzjxje,zjxsuijin   ,khjsbz ,zjjsbz,sjssjfjsbz,jjwjbz,xmjfzt,xcjdbz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,SYSDATE,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,'01' ";

	ls_sql+=" ,'N','N','1','N'   ,'N','N','0','0','N' ";
	ls_sql+=" ,'0','1','N',0,0    ,0,'W','0','0',0 ";
	ls_sql+=" ,'1','N','1',0,0  ,'N','0','0','N','N','0') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,hxbm);
	ps.setString(7,fgflbm);
	ps.setString(8,zxjwbm);
	ps.setString(9,hxmjbm);
	ps.setString(10,ysbm);

	ps.setString(11,hth);
	ps.setString(12,sjs);
	ps.setDouble(13,qye);
	ps.setString(14,sfyyh);
	ps.setLong(15,pmjj);
	ps.setDate(16,qyrq);
	ps.setDate(17,kgrq);
	ps.setString(18,dwbh);
	ps.setString(19,hdbz);
	ps.setString(20,khlxbm);

	ps.setString(21,cqbm);
	ps.setString(22,yhyy);
	ps.setLong(23,fwmj);
	ps.setDate(24,jgrq);
	ps.setString(25,cgdz);
	ps.setString(26,hdr);
	ps.setString(27,hdsfss);
	ps.setString(28,ysrbm);
	ps.setString(29,nlqjbm);
	ps.setString(30,zybm);

	ps.setString(31,fjfwbm);
	ps.setString(32,czbm);
	ps.setDouble(33,zkl);
	ps.setString(34,xqbm);
	ps.setString(35,sffj);
	ps.setString(36,sfyrz);
	ps.setDate(37,jyjdrq);
	ps.setString(38,"");
	ps.setString(39,email);
	ps.setDouble(40,fjje);


	ps.setString(41,cxhdbm);
	ps.setString(42,bjjb);
	ps.setString(43,ywy);
	ps.setDouble(44,sjf);
	ps.setDouble(45,glf);
	ps.setDouble(46,wdzgce);
	ps.setDouble(47,gsfje);
	ps.setString(48,jzbz);
	ps.setString(49,sfcjq);
	ps.setString(50,sffby);

	ps.setString(51,sjsbh);
	ps.setString(52,fgsbh);
	ps.setString(53,sfzhm);
	ps.setString(54,hykh);
	ps.setString(55,hyklxbm);
	ps.setDate(56,yxsjs);
	ps.setDate(57,yxsjz);
	ps.setString(58,kgsjqd);
	ps.setString(59,xmzy);
	ps.setString(60,sffk);

	ps.setString(61,djkh);
	ps.setDate(62,fkrq);
	ps.setString(63,louhao);
	ps.setString(64,"2");//2：家装客户；3：退单客户；4：非家装客户；5：设计客户
	ps.setString(65,rzsc);
	ps.setString(66,sjsgh);
	ps.setDouble(67,suijinbfb);
	ps.setDouble(68,suijin);
	ps.setDouble(69,guanlif);
	ps.setString(70,cxhdbmxq);

	ps.setString(71,cxhdbmzh);
	ps.setDouble(72,zqguanlif);
	ps.setString(73,smhtbh);
	ps.setInt(74,gqts);
	ps.setString(75,hdsgd);
	ps.setString(76,hdsgbz);
	ps.setDouble(77,cdzwjmje);
	ps.setDouble(78,glfbfb);
	ps.setDouble(79,zqwjrqyexm);
	ps.setDouble(80,zhwjrqyexm);

	ps.setString(81,wjrqyexmsm);
	ps.setDouble(82,glfjmje);
	ps.setDouble(83,sjjmje);
	ps.setString(84,khjl);
	ps.setString(85,xxlysm);
	ps.setString(86,yxtxdz);
	ps.setString(87,fqkh);
	ps.setString(88,hyh);
	ps.setString(89,sgd);
	ps.setDouble(90,zqsuijin);

	ps.setDouble(91,0);
	ps.setString(92,zjxm);
	ps.setString(93,jiedao);
	ps.setString(94,pdclzt);
	ps.setString(95,ywyssxz);
	ps.setString(96,ysy);
	ps.setDouble(97,zqgczjf);
	ps.setDouble(98,zhgczjf);
	ps.setDouble(99,zqqtsf);
	ps.setDouble(100,zhqtsf);

	ps.setDouble(101,zqsjf);
	ps.setDouble(102,0);
	ps.setDouble(103,0);
	ps.setDouble(104,0);
	ps.setDouble(105,0);
	ps.setDouble(106,0);
	ps.setString(107,qtsfsm);
	ps.setString(108,lrr);
	ps.setString(109,bz);

	ps.setString(110,sgbz);
	ps.setString(111,fjtcbz);
	ps.setString(112,sfyckh);
	ps.setString(113,ywybm);
	ps.setString(114,pdqybm);
	ps.setString(115,clgw);
	ps.setString(116,xjf);
	ps.setDouble(117,zqhtzcbj);
	ps.setDouble(118,zhhtzcbj);
	ps.setString(119,dianz);
	ps.setString(120,weny);
	ps.setString(121,cqhtbz);
	ps.setDouble(122,sjhtsjf);
	ps.setString(123,scbjl);

	ps.setString(124,pdr);
	ps.setDate(125,pdsj);
	ps.setString(126,"");
	ps.setString(127,pdr);
	ps.setDate(128,pdsj);
	ps.setString(129,gcysbbh);
	ps.executeUpdate();
	ps.close();

	//删除临时报价＋＋＋＋＋＋＋＋＋＋＋＋开始

	//临时报价--项目明细
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工料分析表
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--房间信息
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工程量明细
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--主材用量
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--其它收费项目明细
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhgcxmxj ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhzcxmxj ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhzcxm ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除临时报价========================完成


	ls_sql="delete from  jxc_khfdbl ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jxc_khfdbl (khbh,ppbm,gysbm,ppmc,gysmc,khfdbl,khcxfdbl,xpkhfdbl,xpkhcxfdbl)";
	ls_sql+=" select          '"+khbh+"',ppbm,gysbm,ppmc,gysmc,khfdbl,khcxfdbl,xpkhfdbl,xpkhcxfdbl";
	ls_sql+=" from jxc_ppgysdzb";
	ls_sql+=" where  ssfgs='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>