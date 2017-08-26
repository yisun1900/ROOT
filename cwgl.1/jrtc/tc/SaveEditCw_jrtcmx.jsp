<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
String khbh=null;
String hdbz=null;
String tckh=null;
String dianz=null;
String weny=null;
String khjl=null;
String sjs=null;
String cly=null;
String zjxm=null;
String xqzg=null;
String xqzz=null;
String xqzy=null;
String wlyxzg=null;
String yxzy=null;
String wzch=null;
String wysj=null;
String wzcxy=null;
String dhzy=null;
String wztgy=null;
String siji=null;
long fwmj=0;
double sjf=0;
double ycf=0;
double zqje=0;
double zk=0;
double suijin=0;
double zhjtjs=0;
double zjxje=0;
double zjxbl=0;
double tcwzczx=0;
double dzsjftcbl=0;
double dzqysjftc=0;
double dzjssjftc=0;
double dzzxftcbl=0;
double dzqyzxtc=0;
double dzjszxtc=0;
double dztcxj=0;
double dzkhbl=0;
double dztcze=0;
double wyzxftcbl=0;
double wyqyzxtc=0;
double wyjszxtc=0;
double khjlsjftcbl=0;
double khjlqysjftc=0;
double khjljssjftc=0;
double khjlzxftcbl=0;
double khjlqyzxtc=0;
double khjljszxtc=0;
double khjltcxj=0;
double khjlkhbl=0;
double khjltcze=0;
double sjssjftcbl=0;
double sjsqysjftc=0;
double sjsjssjftc=0;
double sjszxftcbl=0;
double sjsqyzxtc=0;
double sjsjszxtc=0;
double sjsycftcbl=0;
double sjsycftc=0;
double sjstchj=0;
double zjzxftcbl=0;
double zjqyzxtc=0;
double zjjszxtc=0;
double zjycftcbl=0;
double zjycftc=0;
double zjtcxj=0;
double zjkhbl=0;
double zjtchj=0;
double clyzxftcbl=0;
double clyqyzxtc=0;
double clyjszxtc=0;
double clykhbl=0;
double clytc=0;
double xqzgzxftcbl=0;
double xqzgqyzxtc=0;
double xqzgjszxtc=0;
double xqzgkhbl=0;
double xqzgtc=0;
double xqzzzxftcbl=0;
double xqzzqyzxtc=0;
double xqzzjszxtc=0;
double xqzzkhbl=0;
double xqzztc=0;
double xqzyzxftcbl=0;
double xqzyqyzxtc=0;
double xqzyjszxtc=0;
double xqzykhbl=0;
double xqzytc=0;
double wlyxzgzxftcbl=0;
double wlyxzgqyzxtc=0;
double wlyxzgjszxtc=0;
double wlyxzgkhbl=0;
double wlyxzgtc=0;
double yxzyzxftcbl=0;
double yxzyqyzxtc=0;
double wzchzxftcbl=0;
double wzchqyzxtc=0;
double wysjzxftcbl=0;
double wysjqyzxtc=0;
double wzcxyzxftcbl=0;
double wzcxyqyzxtc=0;
double dhzyzxftcbl=0;
double dhzyqyzxtc=0;
double wztgyzxftcbl=0;
double wztgyqyzxtc=0;
double wztgyjszxtc=0;
double wztgykhbl=0;
double wztgytc=0;
double sjzxftcbl=0;
double sjqyzxtc=0;
double jjze=0;
String lx=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
tckh=cf.GB2Uni(request.getParameter("tckh"));
dianz=cf.GB2Uni(request.getParameter("dianz"));
weny=cf.GB2Uni(request.getParameter("weny"));
khjl=cf.GB2Uni(request.getParameter("khjl"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
cly=cf.GB2Uni(request.getParameter("cly"));
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
xqzg=cf.GB2Uni(request.getParameter("xqzg"));
xqzz=cf.GB2Uni(request.getParameter("xqzz"));
xqzy=cf.GB2Uni(request.getParameter("xqzy"));
wlyxzg=cf.GB2Uni(request.getParameter("wlyxzg"));
yxzy=cf.GB2Uni(request.getParameter("yxzy"));
wzch=cf.GB2Uni(request.getParameter("wzch"));
wysj=cf.GB2Uni(request.getParameter("wysj"));
wzcxy=cf.GB2Uni(request.getParameter("wzcxy"));
dhzy=cf.GB2Uni(request.getParameter("dhzy"));
wztgy=cf.GB2Uni(request.getParameter("wztgy"));
siji=cf.GB2Uni(request.getParameter("siji"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fwmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[建筑面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ycf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zk");
try{
	if (!(ls.equals("")))  zk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[suijin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhjtjs");
try{
	if (!(ls.equals("")))  zhjtjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhjtjs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后计提基数]类型转换发生意外:"+e);
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
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxbl");
try{
	if (!(ls.equals("")))  zjxbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcwzczx");
try{
	if (!(ls.equals("")))  tcwzczx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcwzczx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐外主材增项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzsjftcbl");
try{
	if (!(ls.equals("")))  dzsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzsjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzqysjftc");
try{
	if (!(ls.equals("")))  dzqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzqysjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长签约设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzjssjftc");
try{
	if (!(ls.equals("")))  dzjssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzjssjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长结算设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzzxftcbl");
try{
	if (!(ls.equals("")))  dzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzqyzxtc");
try{
	if (!(ls.equals("")))  dzqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzjszxtc");
try{
	if (!(ls.equals("")))  dzjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dztcxj");
try{
	if (!(ls.equals("")))  dztcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dztcxj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长提成小计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzkhbl");
try{
	if (!(ls.equals("")))  dzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dztcze");
try{
	if (!(ls.equals("")))  dztcze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dztcze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店长提成总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wyzxftcbl");
try{
	if (!(ls.equals("")))  wyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[文员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wyqyzxtc");
try{
	if (!(ls.equals("")))  wyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[文员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wyjszxtc");
try{
	if (!(ls.equals("")))  wyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wyjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[文员结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlsjftcbl");
try{
	if (!(ls.equals("")))  khjlsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlsjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlqysjftc");
try{
	if (!(ls.equals("")))  khjlqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlqysjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务签约设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjljssjftc");
try{
	if (!(ls.equals("")))  khjljssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjljssjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务结算设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlzxftcbl");
try{
	if (!(ls.equals("")))  khjlzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlqyzxtc");
try{
	if (!(ls.equals("")))  khjlqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjljszxtc");
try{
	if (!(ls.equals("")))  khjljszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjljszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjltcxj");
try{
	if (!(ls.equals("")))  khjltcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjltcxj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务提成小计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjlkhbl");
try{
	if (!(ls.equals("")))  khjlkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjlkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjltcze");
try{
	if (!(ls.equals("")))  khjltcze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjltcze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面业务提成总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjssjftcbl");
try{
	if (!(ls.equals("")))  sjssjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjssjftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师设计费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsqysjftc");
try{
	if (!(ls.equals("")))  sjsqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsqysjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师签约设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsjssjftc");
try{
	if (!(ls.equals("")))  sjsjssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsjssjftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师结算设计费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjszxftcbl");
try{
	if (!(ls.equals("")))  sjszxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjszxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsqyzxtc");
try{
	if (!(ls.equals("")))  sjsqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsjszxtc");
try{
	if (!(ls.equals("")))  sjsjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsycftcbl");
try{
	if (!(ls.equals("")))  sjsycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsycftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师远程费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsycftc");
try{
	if (!(ls.equals("")))  sjsycftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjsycftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师远程费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjstchj");
try{
	if (!(ls.equals("")))  sjstchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjstchj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师提成合计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjzxftcbl");
try{
	if (!(ls.equals("")))  zjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjqyzxtc");
try{
	if (!(ls.equals("")))  zjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjjszxtc");
try{
	if (!(ls.equals("")))  zjjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjycftcbl");
try{
	if (!(ls.equals("")))  zjycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjycftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理远程费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjycftc");
try{
	if (!(ls.equals("")))  zjycftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjycftc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理远程费提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjtcxj");
try{
	if (!(ls.equals("")))  zjtcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjtcxj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理提成小计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjkhbl");
try{
	if (!(ls.equals("")))  zjkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjtchj");
try{
	if (!(ls.equals("")))  zjtchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjtchj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户经理提成合计]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyzxftcbl");
try{
	if (!(ls.equals("")))  clyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyqyzxtc");
try{
	if (!(ls.equals("")))  clyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyjszxtc");
try{
	if (!(ls.equals("")))  clyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clykhbl");
try{
	if (!(ls.equals("")))  clykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clykhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clytc");
try{
	if (!(ls.equals("")))  clytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clytc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料员提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgzxftcbl");
try{
	if (!(ls.equals("")))  xqzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgqyzxtc");
try{
	if (!(ls.equals("")))  xqzgqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgjszxtc");
try{
	if (!(ls.equals("")))  xqzgjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgkhbl");
try{
	if (!(ls.equals("")))  xqzgkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzgtc");
try{
	if (!(ls.equals("")))  xqzgtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzgtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区主管提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzzzxftcbl");
try{
	if (!(ls.equals("")))  xqzzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzzzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzzqyzxtc");
try{
	if (!(ls.equals("")))  xqzzqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzzqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzzjszxtc");
try{
	if (!(ls.equals("")))  xqzzjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzzjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzzkhbl");
try{
	if (!(ls.equals("")))  xqzzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzzkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzztc");
try{
	if (!(ls.equals("")))  xqzztc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzztc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区组长提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzyzxftcbl");
try{
	if (!(ls.equals("")))  xqzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzyqyzxtc");
try{
	if (!(ls.equals("")))  xqzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzyjszxtc");
try{
	if (!(ls.equals("")))  xqzyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzyjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzykhbl");
try{
	if (!(ls.equals("")))  xqzykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzykhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqzytc");
try{
	if (!(ls.equals("")))  xqzytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xqzytc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区专员提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgzxftcbl");
try{
	if (!(ls.equals("")))  wlyxzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgqyzxtc");
try{
	if (!(ls.equals("")))  wlyxzgqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgjszxtc");
try{
	if (!(ls.equals("")))  wlyxzgjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgkhbl");
try{
	if (!(ls.equals("")))  wlyxzgkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wlyxzgtc");
try{
	if (!(ls.equals("")))  wlyxzgtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wlyxzgtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网络营销主管提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxzyzxftcbl");
try{
	if (!(ls.equals("")))  yxzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[营销专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxzyqyzxtc");
try{
	if (!(ls.equals("")))  yxzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxzyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[营销专员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzchzxftcbl");
try{
	if (!(ls.equals("")))  wzchzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzchzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站策划装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzchqyzxtc");
try{
	if (!(ls.equals("")))  wzchqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzchqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站策划签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wysjzxftcbl");
try{
	if (!(ls.equals("")))  wysjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wysjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网页设计装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wysjqyzxtc");
try{
	if (!(ls.equals("")))  wysjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wysjqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网页设计签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzcxyzxftcbl");
try{
	if (!(ls.equals("")))  wzcxyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzcxyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站程序员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzcxyqyzxtc");
try{
	if (!(ls.equals("")))  wzcxyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wzcxyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站程序员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhzyzxftcbl");
try{
	if (!(ls.equals("")))  dhzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dhzyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电话专员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhzyqyzxtc");
try{
	if (!(ls.equals("")))  dhzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dhzyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电话专员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgyzxftcbl");
try{
	if (!(ls.equals("")))  wztgyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgyzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgyqyzxtc");
try{
	if (!(ls.equals("")))  wztgyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgyqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgyjszxtc");
try{
	if (!(ls.equals("")))  wztgyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgyjszxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员结算装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgykhbl");
try{
	if (!(ls.equals("")))  wztgykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgykhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员考核比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wztgytc");
try{
	if (!(ls.equals("")))  wztgytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wztgytc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[网站推广员提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzxftcbl");
try{
	if (!(ls.equals("")))  sjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzxftcbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[司机装修费提成比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjqyzxtc");
try{
	if (!(ls.equals("")))  sjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjqyzxtc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[司机签约装修提成]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jjze");
try{
	if (!(ls.equals("")))  jjze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖金总额]类型转换发生意外:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
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

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jrtcmx set khzq=?,khbh=?,hdbz=?,tckh=?,dianz=?,weny=?,khjl=?,sjs=?,cly=?,zjxm=?,xqzg=?,xqzz=?,xqzy=?,wlyxzg=?,yxzy=?,wzch=?,wysj=?,wzcxy=?,dhzy=?,wztgy=?,siji=?,fwmj=?,sjf=?,ycf=?,zqje=?,zk=?,suijin=?,zhjtjs=?,zjxje=?,zjxbl=?,tcwzczx=?,dzsjftcbl=?,dzqysjftc=?,dzjssjftc=?,dzzxftcbl=?,dzqyzxtc=?,dzjszxtc=?,dztcxj=?,dzkhbl=?,dztcze=?,wyzxftcbl=?,wyqyzxtc=?,wyjszxtc=?,khjlsjftcbl=?,khjlqysjftc=?,khjljssjftc=?,khjlzxftcbl=?,khjlqyzxtc=?,khjljszxtc=?,khjltcxj=?,khjlkhbl=?,khjltcze=?,sjssjftcbl=?,sjsqysjftc=?,sjsjssjftc=?,sjszxftcbl=?,sjsqyzxtc=?,sjsjszxtc=?,sjsycftcbl=?,sjsycftc=?,sjstchj=?,zjzxftcbl=?,zjqyzxtc=?,zjjszxtc=?,zjycftcbl=?,zjycftc=?,zjtcxj=?,zjkhbl=?,zjtchj=?,clyzxftcbl=?,clyqyzxtc=?,clyjszxtc=?,clykhbl=?,clytc=?,xqzgzxftcbl=?,xqzgqyzxtc=?,xqzgjszxtc=?,xqzgkhbl=?,xqzgtc=?,xqzzzxftcbl=?,xqzzqyzxtc=?,xqzzjszxtc=?,xqzzkhbl=?,xqzztc=?,xqzyzxftcbl=?,xqzyqyzxtc=?,xqzyjszxtc=?,xqzykhbl=?,xqzytc=?,wlyxzgzxftcbl=?,wlyxzgqyzxtc=?,wlyxzgjszxtc=?,wlyxzgkhbl=?,wlyxzgtc=?,yxzyzxftcbl=?,yxzyqyzxtc=?,wzchzxftcbl=?,wzchqyzxtc=?,wysjzxftcbl=?,wysjqyzxtc=?,wzcxyzxftcbl=?,wzcxyqyzxtc=?,dhzyzxftcbl=?,dhzyqyzxtc=?,wztgyzxftcbl=?,wztgyqyzxtc=?,wztgyjszxtc=?,wztgykhbl=?,wztgytc=?,sjzxftcbl=?,sjqyzxtc=?,jjze=?,lx=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (khzq='"+khzq+"') and  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,khbh);
	ps.setString(3,hdbz);
	ps.setString(4,tckh);
	ps.setString(5,dianz);
	ps.setString(6,weny);
	ps.setString(7,khjl);
	ps.setString(8,sjs);
	ps.setString(9,cly);
	ps.setString(10,zjxm);
	ps.setString(11,xqzg);
	ps.setString(12,xqzz);
	ps.setString(13,xqzy);
	ps.setString(14,wlyxzg);
	ps.setString(15,yxzy);
	ps.setString(16,wzch);
	ps.setString(17,wysj);
	ps.setString(18,wzcxy);
	ps.setString(19,dhzy);
	ps.setString(20,wztgy);
	ps.setString(21,siji);
	ps.setLong(22,fwmj);
	ps.setDouble(23,sjf);
	ps.setDouble(24,ycf);
	ps.setDouble(25,zqje);
	ps.setDouble(26,zk);
	ps.setDouble(27,suijin);
	ps.setDouble(28,zhjtjs);
	ps.setDouble(29,zjxje);
	ps.setDouble(30,zjxbl);
	ps.setDouble(31,tcwzczx);
	ps.setDouble(32,dzsjftcbl);
	ps.setDouble(33,dzqysjftc);
	ps.setDouble(34,dzjssjftc);
	ps.setDouble(35,dzzxftcbl);
	ps.setDouble(36,dzqyzxtc);
	ps.setDouble(37,dzjszxtc);
	ps.setDouble(38,dztcxj);
	ps.setDouble(39,dzkhbl);
	ps.setDouble(40,dztcze);
	ps.setDouble(41,wyzxftcbl);
	ps.setDouble(42,wyqyzxtc);
	ps.setDouble(43,wyjszxtc);
	ps.setDouble(44,khjlsjftcbl);
	ps.setDouble(45,khjlqysjftc);
	ps.setDouble(46,khjljssjftc);
	ps.setDouble(47,khjlzxftcbl);
	ps.setDouble(48,khjlqyzxtc);
	ps.setDouble(49,khjljszxtc);
	ps.setDouble(50,khjltcxj);
	ps.setDouble(51,khjlkhbl);
	ps.setDouble(52,khjltcze);
	ps.setDouble(53,sjssjftcbl);
	ps.setDouble(54,sjsqysjftc);
	ps.setDouble(55,sjsjssjftc);
	ps.setDouble(56,sjszxftcbl);
	ps.setDouble(57,sjsqyzxtc);
	ps.setDouble(58,sjsjszxtc);
	ps.setDouble(59,sjsycftcbl);
	ps.setDouble(60,sjsycftc);
	ps.setDouble(61,sjstchj);
	ps.setDouble(62,zjzxftcbl);
	ps.setDouble(63,zjqyzxtc);
	ps.setDouble(64,zjjszxtc);
	ps.setDouble(65,zjycftcbl);
	ps.setDouble(66,zjycftc);
	ps.setDouble(67,zjtcxj);
	ps.setDouble(68,zjkhbl);
	ps.setDouble(69,zjtchj);
	ps.setDouble(70,clyzxftcbl);
	ps.setDouble(71,clyqyzxtc);
	ps.setDouble(72,clyjszxtc);
	ps.setDouble(73,clykhbl);
	ps.setDouble(74,clytc);
	ps.setDouble(75,xqzgzxftcbl);
	ps.setDouble(76,xqzgqyzxtc);
	ps.setDouble(77,xqzgjszxtc);
	ps.setDouble(78,xqzgkhbl);
	ps.setDouble(79,xqzgtc);
	ps.setDouble(80,xqzzzxftcbl);
	ps.setDouble(81,xqzzqyzxtc);
	ps.setDouble(82,xqzzjszxtc);
	ps.setDouble(83,xqzzkhbl);
	ps.setDouble(84,xqzztc);
	ps.setDouble(85,xqzyzxftcbl);
	ps.setDouble(86,xqzyqyzxtc);
	ps.setDouble(87,xqzyjszxtc);
	ps.setDouble(88,xqzykhbl);
	ps.setDouble(89,xqzytc);
	ps.setDouble(90,wlyxzgzxftcbl);
	ps.setDouble(91,wlyxzgqyzxtc);
	ps.setDouble(92,wlyxzgjszxtc);
	ps.setDouble(93,wlyxzgkhbl);
	ps.setDouble(94,wlyxzgtc);
	ps.setDouble(95,yxzyzxftcbl);
	ps.setDouble(96,yxzyqyzxtc);
	ps.setDouble(97,wzchzxftcbl);
	ps.setDouble(98,wzchqyzxtc);
	ps.setDouble(99,wysjzxftcbl);
	ps.setDouble(100,wysjqyzxtc);
	ps.setDouble(101,wzcxyzxftcbl);
	ps.setDouble(102,wzcxyqyzxtc);
	ps.setDouble(103,dhzyzxftcbl);
	ps.setDouble(104,dhzyqyzxtc);
	ps.setDouble(105,wztgyzxftcbl);
	ps.setDouble(106,wztgyqyzxtc);
	ps.setDouble(107,wztgyjszxtc);
	ps.setDouble(108,wztgykhbl);
	ps.setDouble(109,wztgytc);
	ps.setDouble(110,sjzxftcbl);
	ps.setDouble(111,sjqyzxtc);
	ps.setDouble(112,jjze);
	ps.setString(113,lx);
	ps.setString(114,lrr);
	ps.setDate(115,lrsj);
	ps.setString(116,bz);
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