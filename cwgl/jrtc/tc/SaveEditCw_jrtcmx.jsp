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
	out.println("<BR>����[fwmj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zk");
try{
	if (!(ls.equals("")))  zk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[suijin]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhjtjs");
try{
	if (!(ls.equals("")))  zhjtjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhjtjs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxbl");
try{
	if (!(ls.equals("")))  zjxbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcwzczx");
try{
	if (!(ls.equals("")))  tcwzczx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcwzczx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzsjftcbl");
try{
	if (!(ls.equals("")))  dzsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzsjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzqysjftc");
try{
	if (!(ls.equals("")))  dzqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzqysjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤ǩԼ��Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzjssjftc");
try{
	if (!(ls.equals("")))  dzjssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzjssjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤������Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzzxftcbl");
try{
	if (!(ls.equals("")))  dzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzqyzxtc");
try{
	if (!(ls.equals("")))  dzqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzjszxtc");
try{
	if (!(ls.equals("")))  dzjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dztcxj");
try{
	if (!(ls.equals("")))  dztcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dztcxj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤���С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzkhbl");
try{
	if (!(ls.equals("")))  dzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤���˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dztcze");
try{
	if (!(ls.equals("")))  dztcze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dztcze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�곤����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("wyzxftcbl");
try{
	if (!(ls.equals("")))  wyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wyqyzxtc");
try{
	if (!(ls.equals("")))  wyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wyjszxtc");
try{
	if (!(ls.equals("")))  wyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wyjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlsjftcbl");
try{
	if (!(ls.equals("")))  khjlsjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlsjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ����Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlqysjftc");
try{
	if (!(ls.equals("")))  khjlqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlqysjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ��ǩԼ��Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjljssjftc");
try{
	if (!(ls.equals("")))  khjljssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjljssjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�������Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlzxftcbl");
try{
	if (!(ls.equals("")))  khjlzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ��װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlqyzxtc");
try{
	if (!(ls.equals("")))  khjlqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ��ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjljszxtc");
try{
	if (!(ls.equals("")))  khjljszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjljszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjltcxj");
try{
	if (!(ls.equals("")))  khjltcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjltcxj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�����С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjlkhbl");
try{
	if (!(ls.equals("")))  khjlkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjlkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�񿼺˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjltcze");
try{
	if (!(ls.equals("")))  khjltcze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjltcze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ������ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjssjftcbl");
try{
	if (!(ls.equals("")))  sjssjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjssjftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsqysjftc");
try{
	if (!(ls.equals("")))  sjsqysjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsqysjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦǩԼ��Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsjssjftc");
try{
	if (!(ls.equals("")))  sjsjssjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsjssjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ������Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjszxftcbl");
try{
	if (!(ls.equals("")))  sjszxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjszxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsqyzxtc");
try{
	if (!(ls.equals("")))  sjsqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsjszxtc");
try{
	if (!(ls.equals("")))  sjsjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsycftcbl");
try{
	if (!(ls.equals("")))  sjsycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsycftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦԶ�̷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsycftc");
try{
	if (!(ls.equals("")))  sjsycftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsycftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦԶ�̷����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjstchj");
try{
	if (!(ls.equals("")))  sjstchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjstchj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ��ɺϼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjzxftcbl");
try{
	if (!(ls.equals("")))  zjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjqyzxtc");
try{
	if (!(ls.equals("")))  zjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjjszxtc");
try{
	if (!(ls.equals("")))  zjjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��������װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjycftcbl");
try{
	if (!(ls.equals("")))  zjycftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjycftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����Զ�̷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjycftc");
try{
	if (!(ls.equals("")))  zjycftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjycftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����Զ�̷����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjtcxj");
try{
	if (!(ls.equals("")))  zjtcxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjtcxj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��������С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjkhbl");
try{
	if (!(ls.equals("")))  zjkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ������˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjtchj");
try{
	if (!(ls.equals("")))  zjtchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjtchj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�������ɺϼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("clyzxftcbl");
try{
	if (!(ls.equals("")))  clyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("clyqyzxtc");
try{
	if (!(ls.equals("")))  clyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("clyjszxtc");
try{
	if (!(ls.equals("")))  clyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ա����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("clykhbl");
try{
	if (!(ls.equals("")))  clykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clykhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ա���˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("clytc");
try{
	if (!(ls.equals("")))  clytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clytc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ա���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgzxftcbl");
try{
	if (!(ls.equals("")))  xqzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С������װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgqyzxtc");
try{
	if (!(ls.equals("")))  xqzgqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С������ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgjszxtc");
try{
	if (!(ls.equals("")))  xqzgjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С�����ܽ���װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgkhbl");
try{
	if (!(ls.equals("")))  xqzgkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С�����ܿ��˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzgtc");
try{
	if (!(ls.equals("")))  xqzgtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzgtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzzzxftcbl");
try{
	if (!(ls.equals("")))  xqzzzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzzzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzzqyzxtc");
try{
	if (!(ls.equals("")))  xqzzqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzzqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzzjszxtc");
try{
	if (!(ls.equals("")))  xqzzjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzzjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzzkhbl");
try{
	if (!(ls.equals("")))  xqzzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzzkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤���˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzztc");
try{
	if (!(ls.equals("")))  xqzztc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzztc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���鳤���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzyzxftcbl");
try{
	if (!(ls.equals("")))  xqzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzyqyzxtc");
try{
	if (!(ls.equals("")))  xqzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzyjszxtc");
try{
	if (!(ls.equals("")))  xqzyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzyjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱ����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzykhbl");
try{
	if (!(ls.equals("")))  xqzykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzykhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱ���˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqzytc");
try{
	if (!(ls.equals("")))  xqzytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xqzytc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[С��רԱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgzxftcbl");
try{
	if (!(ls.equals("")))  wlyxzgzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ������װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgqyzxtc");
try{
	if (!(ls.equals("")))  wlyxzgqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ������ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgjszxtc");
try{
	if (!(ls.equals("")))  wlyxzgjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ�����ܽ���װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgkhbl");
try{
	if (!(ls.equals("")))  wlyxzgkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ�����ܿ��˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wlyxzgtc");
try{
	if (!(ls.equals("")))  wlyxzgtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wlyxzgtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӫ���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxzyzxftcbl");
try{
	if (!(ls.equals("")))  yxzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӫ��רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxzyqyzxtc");
try{
	if (!(ls.equals("")))  yxzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxzyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӫ��רԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzchzxftcbl");
try{
	if (!(ls.equals("")))  wzchzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzchzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�߻�װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzchqyzxtc");
try{
	if (!(ls.equals("")))  wzchqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzchqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�߻�ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wysjzxftcbl");
try{
	if (!(ls.equals("")))  wysjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wysjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ҳ���װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wysjqyzxtc");
try{
	if (!(ls.equals("")))  wysjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wysjqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ҳ���ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzcxyzxftcbl");
try{
	if (!(ls.equals("")))  wzcxyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzcxyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ����Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wzcxyqyzxtc");
try{
	if (!(ls.equals("")))  wzcxyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wzcxyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ����ԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dhzyzxftcbl");
try{
	if (!(ls.equals("")))  dhzyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dhzyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�绰רԱװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dhzyqyzxtc");
try{
	if (!(ls.equals("")))  dhzyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dhzyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�绰רԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgyzxftcbl");
try{
	if (!(ls.equals("")))  wztgyzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgyzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�Աװ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgyqyzxtc");
try{
	if (!(ls.equals("")))  wztgyqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgyqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�ԱǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgyjszxtc");
try{
	if (!(ls.equals("")))  wztgyjszxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgyjszxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�Ա����װ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgykhbl");
try{
	if (!(ls.equals("")))  wztgykhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgykhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�Ա���˱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wztgytc");
try{
	if (!(ls.equals("")))  wztgytc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wztgytc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��վ�ƹ�Ա���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzxftcbl");
try{
	if (!(ls.equals("")))  sjzxftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzxftcbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˾��װ�޷���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjqyzxtc");
try{
	if (!(ls.equals("")))  sjqyzxtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjqyzxtc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[˾��ǩԼװ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jjze");
try{
	if (!(ls.equals("")))  jjze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jjze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܶ�]����ת����������:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
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
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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