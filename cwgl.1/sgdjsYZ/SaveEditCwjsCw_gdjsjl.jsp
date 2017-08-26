<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
String jzbz=null;
double wdzgce=0;
double qye=0;
double zkl=0;
double zjxje=0;
double khjskze=0;
double khsskze=0;
double sjcb=0;
double sj=0;
String sptdjs=null;
double glftd=0;
double glf=0;
double wxjbfb=0;
double wxj=0;
double clf=0;
double zgclf=0;
double jkje=0;
double fakuan=0;
double kwxf=0;
double gckk=0;
double ksdf=0;
double kqtk=0;
double bk=0;
double gdjskze=0;
String cwjsr=null;
java.sql.Date cwjssj=null;
String jsdw=null;
String cwjssm=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
jzbz=cf.GB2Uni(request.getParameter("jzbz"));
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
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程签约额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjskze");
try{
	if (!(ls.equals("")))  khjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khjskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户结算金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程实收款总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjcb");
try{
	if (!(ls.equals("")))  sjcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjcb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际成本]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sj");
try{
	if (!(ls.equals("")))  sj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
sptdjs=cf.GB2Uni(request.getParameter("sptdjs"));
ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费提点]类型转换发生意外:"+e);
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
	out.println("<BR>[管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wxjbfb");
try{
	if (!(ls.equals("")))  wxjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修金百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wxj");
try{
	if (!(ls.equals("")))  wxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[物流材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zgclf");
try{
	if (!(ls.equals("")))  zgclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zgclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自购材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[借款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fakuan");
try{
	if (!(ls.equals("")))  fakuan=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fakuan不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kwxf");
try{
	if (!(ls.equals("")))  kwxf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kwxf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣维修费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ksdf");
try{
	if (!(ls.equals("")))  ksdf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksdf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣水电费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣其它款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bk");
try{
	if (!(ls.equals("")))  bk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[补款]类型转换发生意外:"+e);
	return;
}

cwjsr=cf.GB2Uni(request.getParameter("cwjsr"));
ls=request.getParameter("cwjssj");
try{
	if (!(ls.equals("")))  cwjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
cwjssm=cf.GB2Uni(request.getParameter("cwjssm"));

double hbssk=0;
double tdjsje=0;
ls=request.getParameter("hbssk");
try{
	if (!(ls.equals("")))  hbssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hbssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[环保项目实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tdjsje");
try{
	if (!(ls.equals("")))  tdjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sptdjsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提点基数金额]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	ls_sql="select jsjd,spjl";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjd=cf.fillNull(rs.getString("jsjd"));
		spjl=cf.fillNull(rs.getString("spjl"));
	}
	rs.close();
	ps.close();

	if (!jsjd.equals("3"))//1：结算部结算；2：结算审批；3：财务结算
	{
		out.println("错误！财务未结算");
		return;
	}

	//结算款＝提点基数－税金－管理费－材料费（物流和自购）-工程扣款-扣水电费＋补款
	gdjskze=tdjsje-sj-glf-clf-zgclf-sgdfy-ksdf+bk;

	//税前工资＝工队结算款总额－借款－扣其它款－罚款金额-扣维修费－维修金
	double sqgz=gdjskze-jkje-kqtk-fakuan-kwxf-wxj;

	
	conn.setAutoCommit(false);


	ls_sql="update crm_khxx set zkl=?,khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zkl);
	ps.setDouble(2,khjskze);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_gdjsjl set kwxf=?,sj=?,clf=?,zgclf=?,jkje=?,fakuan=?,kqtk=?,ksdf=?,glf=?,gdjskze=?,sqgz=?,cwjsr=?,cwjssj=?,cwjssm=?,jsjd='3' ";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,kwxf);
	ps.setDouble(2,sj);
	ps.setDouble(3,clf);
	ps.setDouble(4,zgclf);
	ps.setDouble(5,jkje);
	ps.setDouble(6,fakuan);
	ps.setDouble(7,kqtk);
	ps.setDouble(8,ksdf);
	ps.setDouble(9,glf);
	ps.setDouble(10,gdjskze);
	ps.setDouble(11,sqgz);
	ps.setString(12,cwjsr);
	ps.setDate(13,cwjssj);
	ps.setString(14,cwjssm);

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