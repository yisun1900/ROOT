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
	out.println("<BR>����[htsjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ��Ʒ�]����ת����������:"+e);
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
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wdzgce]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰǩԼ�ܶ�]����ת����������:"+e);
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
	out.println("<BR>[�ۺ�ǩԼ�ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqljzjx");
try{
	if (!(ls.equals("")))  zqljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqljzjx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ�������ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhljzjx");
try{
	if (!(ls.equals("")))  zhljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhljzjx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ��������ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqgchj");
try{
	if (!(ls.equals("")))  zqgchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqgchj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ���̺ϼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhgchj");
try{
	if (!(ls.equals("")))  zhgchj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhgchj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ󹤳̺ϼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcjsze");
try{
	if (!(ls.equals("")))  gcjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjsze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̽����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjgck");
try{
	if (!(ls.equals("")))  yjgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjgck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��ѽ����̿�]����ת����������:"+e);
	return;
}
ls=request.getParameter("djzgck");
try{
	if (!(ls.equals("")))  djzgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[djzgck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת���̿�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjgcwk");
try{
	if (!(ls.equals("")))  yjgcwk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjgcwk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ������β��]����ת����������:"+e);
	return;
}
sfxmbm1=cf.GB2Uni(request.getParameter("sfxmbm1"));
ls=request.getParameter("sfxmbm1je");
try{
	if (!(ls.equals("")))  sfxmbm1je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sfxmbm1je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ���Ŀ1���]����ת����������:"+e);
	return;
}
sfxmbm2=cf.GB2Uni(request.getParameter("sfxmbm2"));
ls=request.getParameter("sfxmbm2je");
try{
	if (!(ls.equals("")))  sfxmbm2je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sfxmbm2je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ���Ŀ2���]����ת����������:"+e);
	return;
}
sfxmbm3=cf.GB2Uni(request.getParameter("sfxmbm3"));
ls=request.getParameter("sfxmbm3je");
try{
	if (!(ls.equals("")))  sfxmbm3je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sfxmbm3je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ���Ŀ3���]����ת����������:"+e);
	return;
}
sftzk=cf.GB2Uni(request.getParameter("sftzk"));
ls=request.getParameter("zxzkl");
try{
	if (!(ls.equals("")))  zxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxzkl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���¿ͻ��ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxqye");
try{
	if (!(ls.equals("")))  zxqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxqye]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۺ�ǩԼ�ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxzhljzjx");
try{
	if (!(ls.equals("")))  zxzhljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxzhljzjx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۺ��������ܶ�]����ת����������:"+e);
	return;
}
sfyfq=cf.GB2Uni(request.getParameter("sfyfq"));
ls=request.getParameter("fqbl");
try{
	if (!(ls.equals("")))  fqbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fqbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȯ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("fqje");
try{
	if (!(ls.equals("")))  fqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fqje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȯ�Ż�]����ת����������:"+e);
	return;
}
ls=request.getParameter("shfqje");
try{
	if (!(ls.equals("")))  shfqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[shfqje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ջؼ��ȯ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("shsgfq");
try{
	if (!(ls.equals("")))  shsgfq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[shsgfq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ջ�ʩ����ȯ]����ת����������:"+e);
	return;
}
ls=request.getParameter("shzcfq");
try{
	if (!(ls.equals("")))  shzcfq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[shzcfq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ջ����ķ�ȯ]����ת����������:"+e);
	return;
}
sfydjfx=cf.GB2Uni(request.getParameter("sfydjfx"));
ls=request.getParameter("djfxje");
try{
	if (!(ls.equals("")))  djfxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[djfxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������Ż�]����ת����������:"+e);
	return;
}
sfydyq=cf.GB2Uni(request.getParameter("sfydyq"));
ls=request.getParameter("dyq");
try{
	if (!(ls.equals("")))  dyq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dyq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȯ]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcyhze");
try{
	if (!(ls.equals("")))  gcyhze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcyhze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����Ż��ܶ�]����ת����������:"+e);
	return;
}
sfydxpzc=cf.GB2Uni(request.getParameter("sfydxpzc"));
ls=request.getParameter("dxpzcje");
try{
	if (!(ls.equals("")))  dxpzcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dxpzcje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ���Ľ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dxpzcyh");
try{
	if (!(ls.equals("")))  dxpzcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dxpzcyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ�����Ż�]����ת����������:"+e);
	return;
}
sfydgzc=cf.GB2Uni(request.getParameter("sfydgzc"));
ls=request.getParameter("dgzcje");
try{
	if (!(ls.equals("")))  dgzcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dgzcje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������Ľ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dgzcyh");
try{
	if (!(ls.equals("")))  dgzcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dgzcyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������Ż�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zcjsze");
try{
	if (!(ls.equals("")))  zcjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcjsze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ľ����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xjjzck");
try{
	if (!(ls.equals("")))  xjjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xjjzck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ֽ����Ŀ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("fxjjzck");
try{
	if (!(ls.equals("")))  fxjjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fxjjzck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ֽ����Ŀ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ybjzck");
try{
	if (!(ls.equals("")))  ybjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ybjzck]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ�������Ŀ�]����ת����������:"+e);
	return;
}
sfyzcfk=cf.GB2Uni(request.getParameter("sfyzcfk"));
ls=request.getParameter("zcfkje");
try{
	if (!(ls.equals("")))  zcfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcfkje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ķ�����]����ת����������:"+e);
	return;
}
sfykhpc=cf.GB2Uni(request.getParameter("sfykhpc"));
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
sfyyqf=cf.GB2Uni(request.getParameter("sfyyqf"));
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
ls=request.getParameter("sgdyqf");
try{
	if (!(ls.equals("")))  sgdyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgdyqf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӳе����ڷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsyqf");
try{
	if (!(ls.equals("")))  sjsyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjsyqf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ�е����ڷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("csyqf");
try{
	if (!(ls.equals("")))  csyqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[csyqf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̳е����ڷ�]����ת����������:"+e);
	return;
}
sfyqtx1=cf.GB2Uni(request.getParameter("sfyqtx1"));
qtx1mc=cf.GB2Uni(request.getParameter("qtx1mc"));
ls=request.getParameter("qtx1je");
try{
	if (!(ls.equals("")))  qtx1je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtx1je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������1���]����ת����������:"+e);
	return;
}
sfyqtx2=cf.GB2Uni(request.getParameter("sfyqtx2"));
qtx2mc=cf.GB2Uni(request.getParameter("qtx2mc"));
ls=request.getParameter("qtx2je");
try{
	if (!(ls.equals("")))  qtx2je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtx2je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������2���]����ת����������:"+e);
	return;
}
sfyqtx3=cf.GB2Uni(request.getParameter("sfyqtx3"));
qtx3mc=cf.GB2Uni(request.getParameter("qtx3mc"));
ls=request.getParameter("qtx3je");
try{
	if (!(ls.equals("")))  qtx3je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtx3je]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������3���]����ת����������:"+e);
	return;
}
ls=request.getParameter("khbjk");
try{
	if (!(ls.equals("")))  khbjk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khbjk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�������]����ת����������:"+e);
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
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zkl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gczkyh");
try{
	if (!(ls.equals("")))  gczkyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gczkyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ��Ż�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tzkxzyh");
try{
	if (!(ls.equals("")))  tzkxzyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tzkxzyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ۿ������Ż�]����ת����������:"+e);
	return;
}
sfyjsgcyh=cf.GB2Uni(request.getParameter("sfyjsgcyh"));
ls=request.getParameter("jsgcyh");
try{
	if (!(ls.equals("")))  jsgcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsgcyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���㹤���Ż�]����ת����������:"+e);
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
	out.println("<BR>����[jszcyh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������Ż�]����ת����������:"+e);
	return;
}
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khjsclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  cw_khjsty";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjsclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!khjsclzt.equals("1"))//1��δ������2������ͬ�⣻3��������ͬ�� 
	{
		out.println("���󣡿ͻ������");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_khxx set khjsbz=?";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"2");
	ps.executeUpdate();
	ps.close();

String spr=(String)session.getAttribute("yhmc");


	ls_sql="update cw_khjsty set  spr=?,spsj=?,spyj=SYSDATE,clzt=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,spr);
	ps.setString(2,"");
	ps.setString(3,"2");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>