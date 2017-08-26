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
	out.println("<BR>变量khcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mbcz");
try{
	if (!(ls.equals("")))  mbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mbcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wccz");
try{
	if (!(ls.equals("")))  wccz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wccz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qdgs");
try{
	if (!(ls.equals("")))  qdgs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qdgs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单个数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yczdcl");
try{
	if (!(ls.equals("")))  yczdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yczdcl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[月产值达成率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mbczdcl");
try{
	if (!(ls.equals("")))  mbczdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mbczdcl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[目标产值达成率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjde");
try{
	if (!(ls.equals("")))  pjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平均单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqdj");
try{
	if (!(ls.equals("")))  sqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ljdj");
try{
	if (!(ls.equals("")))  ljdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ljdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wjdjqds");
try{
	if (!(ls.equals("")))  wjdjqds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjdjqds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未交定金签单数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbcz");
try{
	if (!(ls.equals("")))  scbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zdmczbl");
try{
	if (!(ls.equals("")))  zdmczbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdmczbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占店面产值比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbgds");
try{
	if (!(ls.equals("")))  scbgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbgds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部供单数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbcds");
try{
	if (!(ls.equals("")))  scbcds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbcds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部成单数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbcdbl");
try{
	if (!(ls.equals("")))  scbcdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbcdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部成单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbpjde");
try{
	if (!(ls.equals("")))  scbpjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbpjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部平均单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kllzs");
try{
	if (!(ls.equals("")))  kllzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kllzs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客流量总数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbkllb");
try{
	if (!(ls.equals("")))  scbkllb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbkllb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部占总流量比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbqdsb");
try{
	if (!(ls.equals("")))  scbqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbqdsb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占总签单数比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dmzrs");
try{
	if (!(ls.equals("")))  dmzrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dmzrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[店面总人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bzrysl");
try{
	if (!(ls.equals("")))  bzrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzrysl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准人员数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xzsl");
try{
	if (!(ls.equals("")))  xzsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xzsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小组数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjrysl");
try{
	if (!(ls.equals("")))  sjrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjrysl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计人员数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsrjcz");
try{
	if (!(ls.equals("")))  sjsrjcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsrjcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师人均产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wcdbrs");
try{
	if (!(ls.equals("")))  wcdbrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wcdbrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成达标人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsdcl");
try{
	if (!(ls.equals("")))  sjsdcl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsdcl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师达成率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lczrs");
try{
	if (!(ls.equals("")))  lczrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lczrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零产值人员数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lczrrbl");
try{
	if (!(ls.equals("")))  lczrrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lczrrbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零产值人员比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjscz");
try{
	if (!(ls.equals("")))  zrsjscz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjscz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrscbcz");
try{
	if (!(ls.equals("")))  zrscbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrscbcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任市场部产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjsdj");
try{
	if (!(ls.equals("")))  zrsjsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjsdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师收取定金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjsrs");
try{
	if (!(ls.equals("")))  zrsjsrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjsrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjsqds");
try{
	if (!(ls.equals("")))  zrsjsqds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjsqds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师签单数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zdmczb");
try{
	if (!(ls.equals("")))  zdmczb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdmczb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占店面产值比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zscbczb");
try{
	if (!(ls.equals("")))  zscbczb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscbczb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占市场部产值比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zdmdjb");
try{
	if (!(ls.equals("")))  zdmdjb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdmdjb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占店面定金比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzrsb");
try{
	if (!(ls.equals("")))  zzrsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzrsb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占总人数比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzqdsb");
try{
	if (!(ls.equals("")))  zzqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzqdsb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占总签单数比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjspjde");
try{
	if (!(ls.equals("")))  zrsjspjde=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjspjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师平均单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjssjf");
try{
	if (!(ls.equals("")))  zrsjssjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjssjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师收设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjsmj");
try{
	if (!(ls.equals("")))  zrsjsmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjsmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师设计费面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsjfzsrb");
try{
	if (!(ls.equals("")))  zsjfzsrb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsjfzsrb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占设计费总收入比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrsjspmsjf");
try{
	if (!(ls.equals("")))  zrsjspmsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrsjspmsjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师平米设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrrjcz");
try{
	if (!(ls.equals("")))  zrrjcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrrjcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主任设计师人均产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjfsr");
try{
	if (!(ls.equals("")))  sjfsr=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfsr不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费收入]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqsjfds");
try{
	if (!(ls.equals("")))  sqsjfds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsjfds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取设计费单数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqsjfmj");
try{
	if (!(ls.equals("")))  sqsjfmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsjfmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取设计费面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjmhsjf");
try{
	if (!(ls.equals("")))  pjmhsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjmhsjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平均每户设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjfzqdsb");
try{
	if (!(ls.equals("")))  sjfzqdsb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfzqdsb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费占总签单数比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjpmsjf");
try{
	if (!(ls.equals("")))  pjpmsjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjpmsjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平均每平米设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spxse");
try{
	if (!(ls.equals("")))  spxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spxse不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[5S商品销售金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zycpxse");
try{
	if (!(ls.equals("")))  zycpxse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zycpxse不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自有产品销售金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wckhrysl");
try{
	if (!(ls.equals("")))  wckhrysl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wckhrysl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成考核人员数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wczcz");
try{
	if (!(ls.equals("")))  wczcz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wczcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成总产值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wczmj");
try{
	if (!(ls.equals("")))  wczmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wczmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成总面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ytb");
try{
	if (!(ls.equals("")))  ytb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ytb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[月同比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhb");
try{
	if (!(ls.equals("")))  yhb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[月环比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pfmhtzj");
try{
	if (!(ls.equals("")))  pfmhtzj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pfmhtzj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平方米合同造价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cyczyg");
try{
	if (!(ls.equals("")))  cyczyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cyczyg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[次月产值预估]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cydjyg");
try{
	if (!(ls.equals("")))  cydjyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cydjyg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[次月定金预估]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scbcyczyg");
try{
	if (!(ls.equals("")))  scbcyczyg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbcyczyg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部次月产值预估]类型转换发生意外:"+e);
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
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
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