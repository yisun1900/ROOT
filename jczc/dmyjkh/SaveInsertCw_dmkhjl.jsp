<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String dwbh=null;
String nian=null;
String yue=null;
double khcz=0;
double mbcz=0;
double wccz=0;
long qdgs=0;
double yczdcl=0;
double mbczdcl=0;
long pjde=0;
double sqdj=0;
double ljdj=0;
long wjdjqds=0;
double scbcz=0;
double zdmczbl=0;
long scbgds=0;
long scbcds=0;
double scbcdbl=0;
long scbpjde=0;
long kllzs=0;
double scbkllb=0;
double scbqdsb=0;
long dmzrs=0;
long bzrysl=0;
long xzsl=0;
long sjrysl=0;
long sjsrjcz=0;
long wcdbrs=0;
double sjsdcl=0;
long lczrs=0;
double lczrrbl=0;
double zrsjscz=0;
double zrscbcz=0;
double zrsjsdj=0;
long zrsjsrs=0;
long zrsjsqds=0;
double zdmczb=0;
double zscbczb=0;
double zdmdjb=0;
double zzrsb=0;
double zzqdsb=0;
long zrsjspjde=0;
double zrsjssjf=0;
long zrsjsmj=0;
double zsjfzsrb=0;
long zrsjspmsjf=0;
long zrrjcz=0;
double sjfsr=0;
long sqsjfds=0;
long sqsjfmj=0;
long pjmhsjf=0;
double sjfzqdsb=0;
long pjpmsjf=0;
double spxse=0;
double zycpxse=0;
long wckhrysl=0;
long wczcz=0;
long wczmj=0;
double ytb=0;
double yhb=0;
long pfmhtzj=0;
double cyczyg=0;
double cydjyg=0;
double scbcyczyg=0;
String byczsm=null;
String cyczsm=null;
String fzyj=null;

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
nian=cf.GB2Uni(request.getParameter("nian"));
yue=cf.GB2Uni(request.getParameter("yue"));
ls=request.getParameter("khcz");
try{
	if (!(ls.equals("")))  khcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˲�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("mbcz");
try{
	if (!(ls.equals("")))  mbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mbcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ���ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("wccz");
try{
	if (!(ls.equals("")))  wccz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wccz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ɲ�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("qdgs");
try{
	if (!(ls.equals("")))  qdgs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qdgs������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yczdcl");
try{
	if (!(ls.equals("")))  yczdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yczdcl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�²�ֵ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("mbczdcl");
try{
	if (!(ls.equals("")))  mbczdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mbczdcl������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ���ֵ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("pjde");
try{
	if (!(ls.equals("")))  pjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqdj");
try{
	if (!(ls.equals("")))  sqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("ljdj");
try{
	if (!(ls.equals("")))  ljdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ljdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼƶ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("wjdjqds");
try{
	if (!(ls.equals("")))  wjdjqds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wjdjqds������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ������ǩ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbcz");
try{
	if (!(ls.equals("")))  scbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г�����ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdmczbl");
try{
	if (!(ls.equals("")))  zdmczbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdmczbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ�����ֵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbgds");
try{
	if (!(ls.equals("")))  scbgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbcds");
try{
	if (!(ls.equals("")))  scbcds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbcds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г����ɵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbcdbl");
try{
	if (!(ls.equals("")))  scbcdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbcdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г����ɵ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbpjde");
try{
	if (!(ls.equals("")))  scbpjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbpjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г���ƽ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kllzs");
try{
	if (!(ls.equals("")))  kllzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kllzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbkllb");
try{
	if (!(ls.equals("")))  scbkllb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbkllb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г���ռ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbqdsb");
try{
	if (!(ls.equals("")))  scbqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbqdsb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ��ǩ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("dmzrs");
try{
	if (!(ls.equals("")))  dmzrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dmzrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bzrysl");
try{
	if (!(ls.equals("")))  bzrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bzrysl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼��Ա����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xzsl");
try{
	if (!(ls.equals("")))  xzsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xzsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjrysl");
try{
	if (!(ls.equals("")))  sjrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjrysl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����Ա����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsrjcz");
try{
	if (!(ls.equals("")))  sjsrjcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjsrjcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ�˾���ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("wcdbrs");
try{
	if (!(ls.equals("")))  wcdbrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wcdbrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ɴ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsdcl");
try{
	if (!(ls.equals("")))  sjsdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjsdcl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("lczrs");
try{
	if (!(ls.equals("")))  lczrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lczrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ֵ��Ա��]����ת����������:"+e);
	return;
}
ls=request.getParameter("lczrrbl");
try{
	if (!(ls.equals("")))  lczrrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lczrrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ֵ��Ա����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjscz");
try{
	if (!(ls.equals("")))  zrsjscz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjscz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ��ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrscbcz");
try{
	if (!(ls.equals("")))  zrscbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrscbcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����г�����ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjsdj");
try{
	if (!(ls.equals("")))  zrsjsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjsdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ��ȡ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjsrs");
try{
	if (!(ls.equals("")))  zrsjsrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjsrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjsqds");
try{
	if (!(ls.equals("")))  zrsjsqds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjsqds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦǩ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdmczb");
try{
	if (!(ls.equals("")))  zdmczb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdmczb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ�����ֵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zscbczb");
try{
	if (!(ls.equals("")))  zscbczb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscbczb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ�г�����ֵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdmdjb");
try{
	if (!(ls.equals("")))  zdmdjb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdmdjb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ���涨�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzrsb");
try{
	if (!(ls.equals("")))  zzrsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzrsb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzqdsb");
try{
	if (!(ls.equals("")))  zzqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzqdsb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ��ǩ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjspjde");
try{
	if (!(ls.equals("")))  zrsjspjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjspjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦƽ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjssjf");
try{
	if (!(ls.equals("")))  zrsjssjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjssjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ����Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjsmj");
try{
	if (!(ls.equals("")))  zrsjsmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjsmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ��Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsjfzsrb");
try{
	if (!(ls.equals("")))  zsjfzsrb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsjfzsrb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ռ��Ʒ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrsjspmsjf");
try{
	if (!(ls.equals("")))  zrsjspmsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrsjspmsjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦƽ����Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zrrjcz");
try{
	if (!(ls.equals("")))  zrrjcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zrrjcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʦ�˾���ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjfsr");
try{
	if (!(ls.equals("")))  sjfsr=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfsr������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqsjfds");
try{
	if (!(ls.equals("")))  sqsjfds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqsjfds������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ��Ʒѵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqsjfmj");
try{
	if (!(ls.equals("")))  sqsjfmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqsjfmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ��Ʒ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("pjmhsjf");
try{
	if (!(ls.equals("")))  pjmhsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjmhsjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ��ÿ����Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjfzqdsb");
try{
	if (!(ls.equals("")))  sjfzqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfzqdsb������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�ռ��ǩ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("pjpmsjf");
try{
	if (!(ls.equals("")))  pjpmsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjpmsjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ��ÿƽ����Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("spxse");
try{
	if (!(ls.equals("")))  spxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spxse������");
	return;
}
catch (Exception e){
	out.println("<BR>[5S��Ʒ���۽��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zycpxse");
try{
	if (!(ls.equals("")))  zycpxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zycpxse������");
	return;
}
catch (Exception e){
	out.println("<BR>[���в�Ʒ���۽��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wckhrysl");
try{
	if (!(ls.equals("")))  wckhrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wckhrysl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ɿ�����Ա����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wczcz");
try{
	if (!(ls.equals("")))  wczcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wczcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ܲ�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("wczmj");
try{
	if (!(ls.equals("")))  wczmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wczmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ytb");
try{
	if (!(ls.equals("")))  ytb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ytb������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yhb");
try{
	if (!(ls.equals("")))  yhb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�»���]����ת����������:"+e);
	return;
}
ls=request.getParameter("pfmhtzj");
try{
	if (!(ls.equals("")))  pfmhtzj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pfmhtzj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ���׺�ͬ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("cyczyg");
try{
	if (!(ls.equals("")))  cyczyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cyczyg������");
	return;
}
catch (Exception e){
	out.println("<BR>[���²�ֵԤ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("cydjyg");
try{
	if (!(ls.equals("")))  cydjyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cydjyg������");
	return;
}
catch (Exception e){
	out.println("<BR>[���¶���Ԥ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("scbcyczyg");
try{
	if (!(ls.equals("")))  scbcyczyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbcyczyg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г������²�ֵԤ��]����ת����������:"+e);
	return;
}
byczsm=cf.GB2Uni(request.getParameter("byczsm"));
cyczsm=cf.GB2Uni(request.getParameter("cyczsm"));
fzyj=cf.GB2Uni(request.getParameter("fzyj"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into cw_dmkhjl ( dwbh,nian,yue,khcz,wccz,qdgs,yczdcl,pjde,sqdj,ljdj";
	ls_sql+=" ,wjdjqds,scbcz,zdmczbl,scbgds,scbcds,scbcdbl,scbpjde,kllzs,scbkllb,scbqdsb";
	ls_sql+=" ,dmzrs,bzrysl,xzsl,sjrysl,sjsrjcz,wcdbrs,sjsdcl,lczrs,lczrrbl,zrsjscz";
	ls_sql+=" ,zrscbcz,zrsjsdj,zrsjsrs,zrsjsqds,zdmczb,zscbczb,zdmdjb,zzrsb,zzqdsb,zrsjspjde";
	ls_sql+=" ,zrsjssjf,zrsjsmj,zsjfzsrb,zrsjspmsjf,zrrjcz,sjfsr,sqsjfds,sqsjfmj,pjmhsjf,sjfzqdsb";
	ls_sql+=" ,pjpmsjf,spxse,zycpxse,wckhrysl,wczcz,wczmj,ytb,yhb,pfmhtzj,cyczyg";
	ls_sql+=" ,cydjyg,scbcyczyg,byczsm,cyczsm,fzyj,lrr,lrsj,mbczdcl,mbcz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,nian);
	ps.setString(3,yue);
	ps.setDouble(4,khcz);
	ps.setDouble(5,wccz);
	ps.setLong(6,qdgs);
	ps.setDouble(7,yczdcl);
	ps.setLong(8,pjde);
	ps.setDouble(9,sqdj);
	ps.setDouble(10,ljdj);

	ps.setLong(11,wjdjqds);
	ps.setDouble(12,scbcz);
	ps.setDouble(13,zdmczbl);
	ps.setLong(14,scbgds);
	ps.setLong(15,scbcds);
	ps.setDouble(16,scbcdbl);
	ps.setLong(17,scbpjde);
	ps.setLong(18,kllzs);
	ps.setDouble(19,scbkllb);
	ps.setDouble(20,scbqdsb);

	ps.setLong(21,dmzrs);
	ps.setLong(22,bzrysl);
	ps.setLong(23,xzsl);
	ps.setLong(24,sjrysl);
	ps.setLong(25,sjsrjcz);
	ps.setLong(26,wcdbrs);
	ps.setDouble(27,sjsdcl);
	ps.setLong(28,lczrs);
	ps.setDouble(29,lczrrbl);
	ps.setDouble(30,zrsjscz);

	ps.setDouble(31,zrscbcz);
	ps.setDouble(32,zrsjsdj);
	ps.setLong(33,zrsjsrs);
	ps.setLong(34,zrsjsqds);
	ps.setDouble(35,zdmczb);
	ps.setDouble(36,zscbczb);
	ps.setDouble(37,zdmdjb);
	ps.setDouble(38,zzrsb);
	ps.setDouble(39,zzqdsb);
	ps.setLong(40,zrsjspjde);

	ps.setDouble(41,zrsjssjf);
	ps.setLong(42,zrsjsmj);
	ps.setDouble(43,zsjfzsrb);
	ps.setLong(44,zrsjspmsjf);
	ps.setLong(45,zrrjcz);
	ps.setDouble(46,sjfsr);
	ps.setLong(47,sqsjfds);
	ps.setLong(48,sqsjfmj);
	ps.setLong(49,pjmhsjf);
	ps.setDouble(50,sjfzqdsb);

	ps.setLong(51,pjpmsjf);
	ps.setDouble(52,spxse);
	ps.setDouble(53,zycpxse);
	ps.setLong(54,wckhrysl);
	ps.setLong(55,wczcz);
	ps.setLong(56,wczmj);
	ps.setDouble(57,ytb);
	ps.setDouble(58,yhb);
	ps.setLong(59,pfmhtzj);
	ps.setDouble(60,cyczyg);

	ps.setDouble(61,cydjyg);
	ps.setDouble(62,scbcyczyg);
	ps.setString(63,byczsm);
	ps.setString(64,cyczsm);
	ps.setString(65,fzyj);
	ps.setString(66,yhmc);
	ps.setDate(67,cf.getDate());
	ps.setDouble(68,mbczdcl);
	ps.setDouble(69,mbcz);
	ps.executeUpdate();
	ps.close(); 


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
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