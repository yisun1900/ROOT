<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long kpjlh=0;
String sgd=null;
String sgdjbbm=null;
long zbj=0;
long bzs=0;
long jcf=0;
long kpgds=0;
long zjyzldf=0;
long xjyzldf=0;
long cczldf=0;
long zjyaqdf=0;
long xjyaqdf=0;
long ccaqdf=0;
long zjygqdf=0;
long zjygldf=0;
long xjygldf=0;
long ccgldf=0;
long khpjdf=0;
long tsdf=0;
long wxdf=0;
long ybjdf=0;
long bqdf=0;
long sqzf=0;
long bqzf=0;
long sqpm=0;
long bqpm=0;
String pmfd=null;
String hjwbz=null;
String qjwbz=null;
String sjbz=null;
String jjbz=null;
double ddbl=0;
double zdbl=0;
double xdbl=0;
long ddbzs=0;
long zdbzs=0;
long xdbzs=0;
long ddjls=0;
long zdjls=0;
long xdjls=0;
long kdds=0;
long kzds=0;
long kxds=0;
long tsjcdd=0;
long tsjczd=0;
long tsjcxd=0;
long kjdds=0;
long kjzds=0;
long kjxds=0;
long kjdzs=0;
long kjdze=0;
long yjdds=0;
long yjddje=0;
long yjzds=0;
long yjzdje=0;
long yjxds=0;
long yjxdje=0;
long ywgs=0;
long zsgds=0;
long yztscs=0;
long tbyztscs=0;
long fcyztscs=0;
ls=request.getParameter("kpjlh");
try{
	if (!(ls.equals("")))  kpjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kpjlh������");
	return;
}
catch (Exception e){
	out.println("<BR>[������¼��]����ת����������:"+e);
	return;
}
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
ls=request.getParameter("zbj");
try{
	if (!(ls.equals("")))  zbj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bzs");
try{
	if (!(ls.equals("")))  bzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jcf");
try{
	if (!(ls.equals("")))  jcf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jcf������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kpgds");
try{
	if (!(ls.equals("")))  kpgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kpgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjyzldf");
try{
	if (!(ls.equals("")))  zjyzldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjyzldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�Ա�����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xjyzldf");
try{
	if (!(ls.equals("")))  xjyzldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xjyzldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ѳ��Ա�����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cczldf");
try{
	if (!(ls.equals("")))  cczldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cczldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾��������÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjyaqdf");
try{
	if (!(ls.equals("")))  zjyaqdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjyaqdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�Ա��ȫ����ʩ���÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xjyaqdf");
try{
	if (!(ls.equals("")))  xjyaqdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xjyaqdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ѳ��Ա��ȫ����ʩ���÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ccaqdf");
try{
	if (!(ls.equals("")))  ccaqdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ccaqdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾��鰲ȫ����ʩ���÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjygqdf");
try{
	if (!(ls.equals("")))  zjygqdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjygqdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�Ա���ڵ÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjygldf");
try{
	if (!(ls.equals("")))  zjygldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjygldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�Ա����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xjygldf");
try{
	if (!(ls.equals("")))  xjygldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xjygldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ѳ��Ա����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ccgldf");
try{
	if (!(ls.equals("")))  ccgldf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ccgldf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾������÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("khpjdf");
try{
	if (!(ls.equals("")))  khpjdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khpjdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ����۵÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsdf");
try{
	if (!(ls.equals("")))  tsdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ͷ����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("wxdf");
try{
	if (!(ls.equals("")))  wxdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wxdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[ά����÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ybjdf");
try{
	if (!(ls.equals("")))  ybjdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ybjdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bqdf");
try{
	if (!(ls.equals("")))  bqdf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bqdf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڵ÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqzf");
try{
	if (!(ls.equals("")))  sqzf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqzf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʷ�ܵ÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bqzf");
try{
	if (!(ls.equals("")))  bqzf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bqzf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sqpm");
try{
	if (!(ls.equals("")))  sqpm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqpm������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bqpm");
try{
	if (!(ls.equals("")))  bqpm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bqpm������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
pmfd=cf.GB2Uni(request.getParameter("pmfd"));
hjwbz=cf.GB2Uni(request.getParameter("hjwbz"));
qjwbz=cf.GB2Uni(request.getParameter("qjwbz"));
sjbz=cf.GB2Uni(request.getParameter("sjbz"));
jjbz=cf.GB2Uni(request.getParameter("jjbz"));
ls=request.getParameter("ddbl");
try{
	if (!(ls.equals("")))  ddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdbl");
try{
	if (!(ls.equals("")))  zdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xdbl");
try{
	if (!(ls.equals("")))  xdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ddbzs");
try{
	if (!(ls.equals("")))  ddbzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ddbzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɽӴ󵥱�׼��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdbzs");
try{
	if (!(ls.equals("")))  zdbzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdbzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɽ��е���׼��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xdbzs");
try{
	if (!(ls.equals("")))  xdbzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xdbzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɽ�С����׼��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ddjls");
try{
	if (!(ls.equals("")))  ddjls=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ddjls������");
	return;
}
catch (Exception e){
	out.println("<BR>[�󵥻ص�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zdjls");
try{
	if (!(ls.equals("")))  zdjls=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdjls������");
	return;
}
catch (Exception e){
	out.println("<BR>[�е��ص�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("xdjls");
try{
	if (!(ls.equals("")))  xdjls=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xdjls������");
	return;
}
catch (Exception e){
	out.println("<BR>[С���ص�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kdds");
try{
	if (!(ls.equals("")))  kdds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kdds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿۴�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzds");
try{
	if (!(ls.equals("")))  kzds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kzds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿��е�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kxds");
try{
	if (!(ls.equals("")))  kxds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kxds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ش�Ͷ�߿�С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjcdd");
try{
	if (!(ls.equals("")))  tsjcdd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjcdd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjczd");
try{
	if (!(ls.equals("")))  tsjczd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjczd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷��е�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tsjcxd");
try{
	if (!(ls.equals("")))  tsjcxd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjcxd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���⽱���򴦷�С��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjdds");
try{
	if (!(ls.equals("")))  kjdds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڿɽӴ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjzds");
try{
	if (!(ls.equals("")))  kjzds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjzds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڿɽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxds");
try{
	if (!(ls.equals("")))  kjxds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڿɽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjdzs");
try{
	if (!(ls.equals("")))  kjdzs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdzs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڿɽӵ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjdze");
try{
	if (!(ls.equals("")))  kjdze=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڿɽӵ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjdds");
try{
	if (!(ls.equals("")))  yjdds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjdds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽӴ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjddje");
try{
	if (!(ls.equals("")))  yjddje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjddje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽӴ󵥽��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjzds");
try{
	if (!(ls.equals("")))  yjzds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽ��е���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjzdje");
try{
	if (!(ls.equals("")))  yjzdje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽ��е����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjxds");
try{
	if (!(ls.equals("")))  yjxds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjxds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽ�С����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjxdje");
try{
	if (!(ls.equals("")))  yjxdje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjxdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ѽ�С�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("ywgs");
try{
	if (!(ls.equals("")))  ywgs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ywgs������");
	return;
}
catch (Exception e){
	out.println("<BR>[���깤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsgds");
try{
	if (!(ls.equals("")))  zsgds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʩ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yztscs");
try{
	if (!(ls.equals("")))  yztscs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yztscs������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ͷ�ߴ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tbyztscs");
try{
	if (!(ls.equals("")))  tbyztscs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tbyztscs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ر�����Ͷ�ߴ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("fcyztscs");
try{
	if (!(ls.equals("")))  fcyztscs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fcyztscs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ǳ�����Ͷ�ߴ���]����ת����������:"+e);
	return;
}
String wherekpjlh=null;
String wheresgd=null;
wherekpjlh=cf.GB2Uni(request.getParameter("wherekpjlh"));
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_sgdkpjg set kpjlh=?,sgd=?,sgdjbbm=?,zbj=?,bzs=?,jcf=?,kpgds=?,zjyzldf=?,xjyzldf=?,cczldf=?,zjyaqdf=?,xjyaqdf=?,ccaqdf=?,zjygqdf=?,zjygldf=?,xjygldf=?,ccgldf=?,khpjdf=?,tsdf=?,wxdf=?,ybjdf=?,bqdf=?,sqzf=?,bqzf=?,sqpm=?,bqpm=?,pmfd=?,hjwbz=?,qjwbz=?,sjbz=?,jjbz=?,ddbl=?,zdbl=?,xdbl=?,ddbzs=?,zdbzs=?,xdbzs=?,ddjls=?,zdjls=?,xdjls=?,kdds=?,kzds=?,kxds=?,tsjcdd=?,tsjczd=?,tsjcxd=?,kjdds=?,kjzds=?,kjxds=?,kjdzs=?,kjdze=?,yjdds=?,yjddje=?,yjzds=?,yjzdje=?,yjxds=?,yjxdje=?,ywgs=?,zsgds=?,yztscs=?,tbyztscs=?,fcyztscs=? ";
	ls_sql+=" where  (kpjlh="+wherekpjlh+") and  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,kpjlh);
	ps.setString(2,sgd);
	ps.setString(3,sgdjbbm);
	ps.setLong(4,zbj);
	ps.setLong(5,bzs);
	ps.setLong(6,jcf);
	ps.setLong(7,kpgds);
	ps.setLong(8,zjyzldf);
	ps.setLong(9,xjyzldf);
	ps.setLong(10,cczldf);
	ps.setLong(11,zjyaqdf);
	ps.setLong(12,xjyaqdf);
	ps.setLong(13,ccaqdf);
	ps.setLong(14,zjygqdf);
	ps.setLong(15,zjygldf);
	ps.setLong(16,xjygldf);
	ps.setLong(17,ccgldf);
	ps.setLong(18,khpjdf);
	ps.setLong(19,tsdf);
	ps.setLong(20,wxdf);
	ps.setLong(21,ybjdf);
	ps.setLong(22,bqdf);
	ps.setLong(23,sqzf);
	ps.setLong(24,bqzf);
	ps.setLong(25,sqpm);
	ps.setLong(26,bqpm);
	ps.setString(27,pmfd);
	ps.setString(28,hjwbz);
	ps.setString(29,qjwbz);
	ps.setString(30,sjbz);
	ps.setString(31,jjbz);
	ps.setDouble(32,ddbl);
	ps.setDouble(33,zdbl);
	ps.setDouble(34,xdbl);
	ps.setLong(35,ddbzs);
	ps.setLong(36,zdbzs);
	ps.setLong(37,xdbzs);
	ps.setLong(38,ddjls);
	ps.setLong(39,zdjls);
	ps.setLong(40,xdjls);
	ps.setLong(41,kdds);
	ps.setLong(42,kzds);
	ps.setLong(43,kxds);
	ps.setLong(44,tsjcdd);
	ps.setLong(45,tsjczd);
	ps.setLong(46,tsjcxd);
	ps.setLong(47,kjdds);
	ps.setLong(48,kjzds);
	ps.setLong(49,kjxds);
	ps.setLong(50,kjdzs);
	ps.setLong(51,kjdze);
	ps.setLong(52,yjdds);
	ps.setLong(53,yjddje);
	ps.setLong(54,yjzds);
	ps.setLong(55,yjzdje);
	ps.setLong(56,yjxds);
	ps.setLong(57,yjxdje);
	ps.setLong(58,ywgs);
	ps.setLong(59,zsgds);
	ps.setLong(60,yztscs);
	ps.setLong(61,tbyztscs);
	ps.setLong(62,fcyztscs);
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
	out.print("Exception: " + e);
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