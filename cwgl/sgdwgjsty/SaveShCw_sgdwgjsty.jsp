<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

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
double jsjsxjje=0;

khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("htgcf");
try{
	if (!(ls.equals("")))  htgcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htgcf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ���̶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("htqtsf");
try{
	if (!(ls.equals("")))  htqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htqtsf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�����շ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcfzjx");
try{
	if (!(ls.equals("")))  gcfzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcfzjx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̷�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtsfzjx");
try{
	if (!(ls.equals("")))  qtsfzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtsfzjx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
qtfsm=cf.GB2Uni(request.getParameter("qtfsm"));
ls=request.getParameter("htsgcb");
try{
	if (!(ls.equals("")))  htsgcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htsgcb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��ʩ���ɱ�]����ת����������:"+e);
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
ls=request.getParameter("ljclf");
try{
	if (!(ls.equals("")))  ljclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ljclf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼƲ��Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ljrgf");
try{
	if (!(ls.equals("")))  ljrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ljrgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼ��˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ssk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�տ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsyh");
try{
	if (!(ls.equals("")))  jsyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ������Ż�]����ת����������:"+e);
	return;
}
ls=request.getParameter("khpck");
try{
	if (!(ls.equals("")))  khpck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khpck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��⳥��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yqf");
try{
	if (!(ls.equals("")))  yqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yqf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("khqk");
try{
	if (!(ls.equals("")))  khqk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khqk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�Ƿ��]����ת����������:"+e);
	return;
}
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
ls=request.getParameter("htjsjs");
try{
	if (!(ls.equals("")))  htjsjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[htjsjs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxjsjs");
try{
	if (!(ls.equals("")))  zjxjsjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxjsjs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
sdlqz=cf.GB2Uni(request.getParameter("sdlqz"));
ls=request.getParameter("sdlje");
try{
	if (!(ls.equals("")))  sdlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sdlje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sdljsbl");
try{
	if (!(ls.equals("")))  sdljsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sdljsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sdljsje");
try{
	if (!(ls.equals("")))  sdljsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sdljsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ˮ��·������]����ת����������:"+e);
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
	out.println("<BR>����[ljzjxxs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼ�������ϵ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ljzjxje");
try{
	if (!(ls.equals("")))  ljzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ljzjxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۼ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxxs");
try{
	if (!(ls.equals("")))  zxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxxs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ϵ��]����ת����������:"+e);
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
ls=request.getParameter("jxxs");
try{
	if (!(ls.equals("")))  jxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxxs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ϵ��]����ת����������:"+e);
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
sfkyqpc=cf.GB2Uni(request.getParameter("sfkyqpc"));
ls=request.getParameter("kyqf");
try{
	if (!(ls.equals("")))  kyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kyqf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kkhpck");
try{
	if (!(ls.equals("")))  kkhpck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kkhpck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿͻ��⳥��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kkhqk");
try{
	if (!(ls.equals("")))  kkhqk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kkhqk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿͻ�Ƿ��]����ת����������:"+e);
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
	out.println("<BR>����[zcjsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ľ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zcje");
try{
	if (!(ls.equals("")))  zcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ľ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zcjsje");
try{
	if (!(ls.equals("")))  zcjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcjsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ľ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsjsze");
try{
	if (!(ls.equals("")))  jsjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsjsze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("tzjsbl");
try{
	if (!(ls.equals("")))  tzjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tzjsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("rgfjse");
try{
	if (!(ls.equals("")))  rgfjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rgfjse]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹��ѽ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("flfjse");
try{
	if (!(ls.equals("")))  flfjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[flfjse]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸѽ����]����ת����������:"+e);
	return;
}
sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
sfkgdyp=cf.GB2Uni(request.getParameter("sfkgdyp"));
ls=request.getParameter("gdyp");
try{
	if (!(ls.equals("")))  gdyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gdyp]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ʒ]����ת����������:"+e);
	return;
}
sfkyfgf=cf.GB2Uni(request.getParameter("sfkyfgf"));
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ�����]����ת����������:"+e);
	return;
}
sfkzbj=cf.GB2Uni(request.getParameter("sfkzbj"));
kzbjjs=cf.GB2Uni(request.getParameter("kzbjjs"));
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kzbjbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ������]����ת����������:"+e);
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
	out.println("<BR>[���ʱ���]����ת����������:"+e);
	return;
}
sfkclfk=cf.GB2Uni(request.getParameter("sfkclfk"));
ls=request.getParameter("clfk");
try{
	if (!(ls.equals("")))  clfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clfk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ķ���]����ת����������:"+e);
	return;
}
sfkclyf=cf.GB2Uni(request.getParameter("sfkclyf"));
ls=request.getParameter("clyf");
try{
	if (!(ls.equals("")))  clyf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clyf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����˷�]����ת����������:"+e);
	return;
}
sfkzckk=cf.GB2Uni(request.getParameter("sfkzckk"));
ls=request.getParameter("zckk");
try{
	if (!(ls.equals("")))  zckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zckk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ŀۿ�]����ת����������:"+e);
	return;
}
sfjzcjl=cf.GB2Uni(request.getParameter("sfjzcjl"));
ls=request.getParameter("zcjl");
try{
	if (!(ls.equals("")))  zcjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcjl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ľ���]����ת����������:"+e);
	return;
}
sfkfkje=cf.GB2Uni(request.getParameter("sfkfkje"));
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fkje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
sfjjlje=cf.GB2Uni(request.getParameter("sfjjlje"));
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jlje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
sfjqtje=cf.GB2Uni(request.getParameter("sfjqtje"));
ls=request.getParameter("qtje");
try{
	if (!(ls.equals("")))  qtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfje");
try{
	if (!(ls.equals("")))  yfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ�����]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("jsjsxjje");
try{
	if (!(ls.equals("")))  jsjsxjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsjsxjje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������]����ת����������:"+e);
	return;
}
String jsjlh=request.getParameter("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double getkzbj=0;
	String getspzt=null;
	ls_sql="select kzbj,spzt";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where  jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkzbj=rs.getDouble("kzbj");
		getspzt=cf.fillNull(rs.getString("spzt"));
	}
	rs.close();
	ps.close();

	if (!getspzt.equals("1"))//1��δ������2������ͬ�⣻3��������ͬ��
	{
		out.println("����������");
		return;
	}


	String getgdjsjd="";
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getgdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!getgdjsjd.equals("Y"))
	{
		out.println("<BR>����������״̬����ȷ");
		return;
	}


	int ztjc=0;
	ls_sql="select count(*)";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+getgdjsjd+"' and ztlx='3'";//1����Ȩ��2�������ѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztjc=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (ztjc==0)
	{
		conn.rollback();
		out.println("����״̬����ȷ");
		return;
	}
	
	long xuhao=-1;
	ls_sql="select xuhao";
	ls_sql+=" from cw_zbjxgjl";
	ls_sql+=" where  sgd='"+sgd+"' and jsjlh='"+jsjlh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xuhao=rs.getLong("xuhao");
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	if (xuhao!=-1)
	{
		ls_sql="update sq_sgd set zbj=zbj+?";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,kzbj-getkzbj);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update cw_zbjxgjl set je=?,lrr=?,lrsj=?,lrbm=?,bz=?";
		ls_sql+=" where xuhao="+xuhao;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,kzbj);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.setString(4,lrbm);
		ps.setString(5,"�깤�����޸�");
		ps.executeUpdate();
		ps.close();
	}
	else{
		if (kzbj>0)//���ʱ���
		{
			xuhao=0;
			//��ȡ��¼��
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
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'2','N' ) ";//1���ֹ�¼�룻2���깤���㣻3������ά��
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xuhao);
			ps.setString(2,sgd);
			ps.setString(3,"");
			ps.setDouble(4,kzbj);
			ps.setString(5,jsjlh);
			ps.setString(6,lrr);
			ps.setDate(7,lrsj);
			ps.setString(8,lrbm);
			ps.setString(9,"ʩ�����깤����");
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update crm_khxx set gdjsjd=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"Z");
	ps.executeUpdate();
	ps.close();

	String spr=(String)session.getAttribute("yhmc");

	ls_sql="update cw_sgdwgjsty set jsyh=?,khpck=?,yqf=?,khqk=?,jsjs=?,htjsjs=?,zjxjsjs=?,sdljsfs=?,sdlqz=?,sdlje=?   ,sdljsbl=?,sdljsje=?,zjxjffs=?,zjxbhfw=?,zjxsjd=?,ljzjxxs=?,ljzjxje=?,zxxs=?,zxje=?,jxxs=?,jxje=?,sfkyqpc=?,kyqf=?,kkhpck=?,kkhqk=?,zcsfjs=?,zcjehqfs=?,zcjsblkg=?,zcjsbl=?,zcje=?,zcjsje=?,jsjsze=?,jsbl=?,tzjsbl=?,jsje=?,rgfjse=?,flfjse=?,sfkclk=?,clf=?,sfkgdyp=?,gdyp=?,sfkyfgf=?,yfgf=?,sfkzbj=?,kzbjjs=?,kzbjbl=?,kzbj=?,sfkclfk=?,clfk=?,sfkclyf=?,clyf=?,sfkzckk=?,zckk=?,sfjzcjl=?,zcjl=?,sfkfkje=?,fkje=?,sfjjlje=?,jlje=?,sfjqtje=?,qtje=?,yfje=?,jsrq=?,lrr=?,lrsj=?,lrbm=?,bz=?,jsjsxjje=?,spzt='2',spr=?,spsj=TRUNC(SYSDATE) ";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsyh);
	ps.setDouble(2,khpck);
	ps.setDouble(3,yqf);
	ps.setDouble(4,khqk);
	ps.setString(5,jsjs);
	ps.setDouble(6,htjsjs);
	ps.setDouble(7,zjxjsjs);
	ps.setString(8,sdljsfs);
	ps.setString(9,sdlqz);
	ps.setDouble(10,sdlje);

	ps.setDouble(11,sdljsbl);
	ps.setDouble(12,sdljsje);
	ps.setString(13,zjxjffs);
	ps.setString(14,zjxbhfw);
	ps.setString(15,zjxsjd);
	ps.setDouble(16,ljzjxxs);
	ps.setDouble(17,ljzjxje);
	ps.setDouble(18,zxxs);
	ps.setDouble(19,zxje);
	ps.setDouble(20,jxxs);

	ps.setDouble(21,jxje);
	ps.setString(22,sfkyqpc);
	ps.setDouble(23,kyqf);
	ps.setDouble(24,kkhpck);
	ps.setDouble(25,kkhqk);
	ps.setString(26,zcsfjs);
	ps.setString(27,zcjehqfs);
	ps.setString(28,zcjsblkg);
	ps.setDouble(29,zcjsbl);
	ps.setDouble(30,zcje);

	ps.setDouble(31,zcjsje);
	ps.setDouble(32,jsjsze);
	ps.setDouble(33,jsbl);
	ps.setDouble(34,tzjsbl);
	ps.setDouble(35,jsje);
	ps.setDouble(36,rgfjse);
	ps.setDouble(37,flfjse);
	ps.setString(38,sfkclk);
	ps.setDouble(39,clf);
	ps.setString(40,sfkgdyp);

	ps.setDouble(41,gdyp);
	ps.setString(42,sfkyfgf);
	ps.setDouble(43,yfgf);
	ps.setString(44,sfkzbj);
	ps.setString(45,kzbjjs);
	ps.setDouble(46,kzbjbl);
	ps.setDouble(47,kzbj);
	ps.setString(48,sfkclfk);
	ps.setDouble(49,clfk);
	ps.setString(50,sfkclyf);

	ps.setDouble(51,clyf);
	ps.setString(52,sfkzckk);
	ps.setDouble(53,zckk);
	ps.setString(54,sfjzcjl);
	ps.setDouble(55,zcjl);
	ps.setString(56,sfkfkje);
	ps.setDouble(57,fkje);
	ps.setString(58,sfjjlje);
	ps.setDouble(59,jlje);
	ps.setString(60,sfjqtje);

	ps.setDouble(61,qtje);
	ps.setDouble(62,yfje);
	ps.setDate(63,jsrq);
	ps.setString(64,lrr);
	ps.setDate(65,lrsj);
	ps.setString(66,lrbm);
	ps.setString(67,bz);
	ps.setDouble(68,jsjsxjje);
	ps.setString(69,spr);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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
	conn.rollback();
	out.print("<BR>����:" + e);
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