<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jsrq=null;
double qye=0;
double zjxje=0;
double zxje=0;
double jxje=0;
double htsgcb=0;
double zjxsgcb=0;
double zjcbglfbl=0;
double zjcbglf=0;
double sdlzxje=0;
double sdlcbfbl=0;
double sldzjcb=0;
double htwzjje=0;
double htwzjcbbl=0;
double htwzjcb=0;
double sgcb=0;
double sgcbclf=0;
double sgcbrgf=0;
double sssjf=0;
double sjfbl=0;
double sjftc=0;
long fwmj=0;
double kqzlf=0;
double bbjf=0;
double bqtf=0;
String bqtfsm=null;
double htnsdje=0;
double htnsdjebl=0;
double bsdcb=0;
double ycfje=0;
double ycfbl=0;
double bycf=0;
double cbhjje=0;
double kzbjbl=0;
double kzbj=0;
double kgcyz=0;
double kfxbzjbl=0;
double kfxbzj=0;
double xxfh=0;
double clcb=0;
double cldbbl=0;
double clbdbkk=0;
double kgjsje=0;
double kqtf=0;
String kqtfsm=null;
double kxcf=0;
double sjzfe=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qye]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��]����ת����������:"+e);
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
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxje");
try{
	if (!(ls.equals("")))  zxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jxje");
try{
	if (!(ls.equals("")))  jxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("htsgcb");
try{
	if (!(ls.equals("")))  htsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htsgcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬʩ���ɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxsgcb");
try{
	if (!(ls.equals("")))  zjxsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxsgcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʩ���ɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjcbglfbl");
try{
	if (!(ls.equals("")))  zjcbglfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjcbglfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ�ӳɱ�����ѱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjcbglf");
try{
	if (!(ls.equals("")))  zjcbglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjcbglf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ�ӳɱ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sdlzxje");
try{
	if (!(ls.equals("")))  sdlzxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sdlzxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sdlcbfbl");
try{
	if (!(ls.equals("")))  sdlcbfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sdlcbfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·�ɱ��ѱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sldzjcb");
try{
	if (!(ls.equals("")))  sldzjcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sldzjcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·����ֱ�ӳɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("htwzjje");
try{
	if (!(ls.equals("")))  htwzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htwzjje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ����Ŀ���ӽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("htwzjcbbl");
try{
	if (!(ls.equals("")))  htwzjcbbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htwzjcbbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ����Ŀ���ӳɱ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("htwzjcb");
try{
	if (!(ls.equals("")))  htwzjcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htwzjcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ����Ŀ����ֱ�ӳɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgcb");
try{
	if (!(ls.equals("")))  sgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ɱ��˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgcbclf");
try{
	if (!(ls.equals("")))  sgcbclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgcbclf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ٲ��Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgcbrgf");
try{
	if (!(ls.equals("")))  sgcbrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgcbrgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sssjf");
try{
	if (!(ls.equals("")))  sssjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sssjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjfbl");
try{
	if (!(ls.equals("")))  sjfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ���ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjftc");
try{
	if (!(ls.equals("")))  sjftc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjftc]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ����]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("kqzlf");
try{
	if (!(ls.equals("")))  kqzlf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kqzlf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������Э����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bbjf");
try{
	if (!(ls.equals("")))  bbjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bbjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bqtf");
try{
	if (!(ls.equals("")))  bqtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bqtf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������]����ת����������:"+e);
	return;
}
bqtfsm=cf.GB2Uni(request.getParameter("bqtfsm"));
ls=request.getParameter("htnsdje");
try{
	if (!(ls.equals("")))  htnsdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htnsdje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��ˮ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("htnsdjebl");
try{
	if (!(ls.equals("")))  htnsdjebl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htnsdjebl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��ˮ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bsdcb");
try{
	if (!(ls.equals("")))  bsdcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bsdcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʩ���鳤ˮ��ɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycfje");
try{
	if (!(ls.equals("")))  ycfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷ѽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycfbl");
try{
	if (!(ls.equals("")))  ycfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷ѱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bycf");
try{
	if (!(ls.equals("")))  bycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bycf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʩ���鳤Զ�̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cbhjje");
try{
	if (!(ls.equals("")))  cbhjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cbhjje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���鳤�ɱ��ϼƽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۹����ʱ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kzbj");
try{
	if (!(ls.equals("")))  kzbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۹����ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("kgcyz");
try{
	if (!(ls.equals("")))  kgcyz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kgcyz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۹���Ԥ֧]����ת����������:"+e);
	return;
}
ls=request.getParameter("kfxbzjbl");
try{
	if (!(ls.equals("")))  kfxbzjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kfxbzjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷��ձ�֤�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kfxbzj");
try{
	if (!(ls.equals("")))  kfxbzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kfxbzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷��ձ�֤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xxfh");
try{
	if (!(ls.equals("")))  xxfh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xxfh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���鳤��Ϣ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("clcb");
try{
	if (!(ls.equals("")))  clcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϳɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cldbbl");
try{
	if (!(ls.equals("")))  cldbbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cldbbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϴ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("clbdbkk");
try{
	if (!(ls.equals("")))  clbdbkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clbdbkk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϲ����ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kgjsje");
try{
	if (!(ls.equals("")))  kgjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kgjsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�е��������ٽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kqtf");
try{
	if (!(ls.equals("")))  kqtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kqtf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʩ���鳤��������]����ת����������:"+e);
	return;
}
kqtfsm=cf.GB2Uni(request.getParameter("kqtfsm"));
ls=request.getParameter("kxcf");
try{
	if (!(ls.equals("")))  kxcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kxcf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzfe");
try{
	if (!(ls.equals("")))  sjzfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzfe]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ��֧��ʩ���鳤���]����ת����������:"+e);
	return;
}

double kfk=0;
ls=request.getParameter("kfk");
try{
	if (!(ls.equals("")))  kfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���湤�̷���]����ת����������:"+e);
	return;
}
double fwjcfk=0;
ls=request.getParameter("fwjcfk");
try{
	if (!(ls.equals("")))  fwjcfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fwjcfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����췣��]����ת����������:"+e);
	return;
}
double kdkk=0;
ls=request.getParameter("kdkk");
try{
	if (!(ls.equals("")))  kdkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kdkk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۴��ۿ�]����ת����������:"+e);
	return;
}

double wxxkk=0;
ls=request.getParameter("wxxkk");
try{
	if (!(ls.equals("")))  wxxkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wxxkk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ϣ�ۿ�]����ת����������:"+e);
	return;
}


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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String jsjlh=request.getParameter("jsjlh");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_chsgdjs set jsrq=?,qye=?,zjxje=?,zxje=?,jxje=?,htsgcb=?,zjxsgcb=?,zjcbglfbl=?,zjcbglf=?,sdlzxje=?,sdlcbfbl=?,sldzjcb=?,htwzjje=?,htwzjcbbl=?,htwzjcb=?,sgcb=?,sgcbclf=?,sgcbrgf=?,sssjf=?,sjfbl=?,sjftc=?,fwmj=?,kqzlf=?,bbjf=?,bqtf=?,bqtfsm=?,htnsdje=?,htnsdjebl=?,bsdcb=?,ycfje=?,ycfbl=?,bycf=?,cbhjje=?,kzbjbl=?,kzbj=?,kgcyz=?,kfxbzjbl=?,kfxbzj=?,xxfh=?,clcb=?,cldbbl=?,clbdbkk=?,kgjsje=?,kqtf=?,kqtfsm=?,kxcf=?,sjzfe=?,lrr=?,lrsj=?,lrbm=?,bz=?,kfk=?,fwjcfk=?,kdkk=?,wxxkk=? ";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jsrq);
	ps.setDouble(2,qye);
	ps.setDouble(3,zjxje);
	ps.setDouble(4,zxje);
	ps.setDouble(5,jxje);
	ps.setDouble(6,htsgcb);
	ps.setDouble(7,zjxsgcb);
	ps.setDouble(8,zjcbglfbl);
	ps.setDouble(9,zjcbglf);
	ps.setDouble(10,sdlzxje);
	ps.setDouble(11,sdlcbfbl);
	ps.setDouble(12,sldzjcb);
	ps.setDouble(13,htwzjje);
	ps.setDouble(14,htwzjcbbl);
	ps.setDouble(15,htwzjcb);
	ps.setDouble(16,sgcb);
	ps.setDouble(17,sgcbclf);
	ps.setDouble(18,sgcbrgf);
	ps.setDouble(19,sssjf);
	ps.setDouble(20,sjfbl);
	ps.setDouble(21,sjftc);
	ps.setLong(22,fwmj);
	ps.setDouble(23,kqzlf);
	ps.setDouble(24,bbjf);
	ps.setDouble(25,bqtf);
	ps.setString(26,bqtfsm);
	ps.setDouble(27,htnsdje);
	ps.setDouble(28,htnsdjebl);
	ps.setDouble(29,bsdcb);
	ps.setDouble(30,ycfje);
	ps.setDouble(31,ycfbl);
	ps.setDouble(32,bycf);
	ps.setDouble(33,cbhjje);
	ps.setDouble(34,kzbjbl);
	ps.setDouble(35,kzbj);
	ps.setDouble(36,kgcyz);
	ps.setDouble(37,kfxbzjbl);
	ps.setDouble(38,kfxbzj);
	ps.setDouble(39,xxfh);
	ps.setDouble(40,clcb);
	ps.setDouble(41,cldbbl);
	ps.setDouble(42,clbdbkk);
	ps.setDouble(43,kgjsje);
	ps.setDouble(44,kqtf);
	ps.setString(45,kqtfsm);
	ps.setDouble(46,kxcf);
	ps.setDouble(47,sjzfe);
	ps.setString(48,lrr);
	ps.setDate(49,lrsj);
	ps.setString(50,lrbm);
	ps.setString(51,bz);
	ps.setDouble(52,kfk);
	ps.setDouble(53,fwjcfk);
	ps.setDouble(54,kdkk);
	ps.setDouble(55,wxxkk);
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