<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String jzbz=null;
double wdzgce=0;
double qye=0;
double zkl=0;
double zjxje=0;
double khjskze=0;
double khsskze=0;
double sjcb=0;

String tdjs=null;
double tdjsje=0;

String bz=null;
double hbssk=0;

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

tdjs=cf.GB2Uni(request.getParameter("tdjs"));

bz=cf.GB2Uni(request.getParameter("bz"));
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
	out.println("<BR>变量tdjsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提点基数金额]类型转换发生意外:"+e);
	return;
}

double gckk=0;
double sjsfy=0;
double sgdfy=0;
double zjfy=0;
double gsfy=0;
double qtfy=0;
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
ls=request.getParameter("sjsfy");
try{
	if (!(ls.equals("")))  sjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdfy");
try{
	if (!(ls.equals("")))  sgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjfy");
try{
	if (!(ls.equals("")))  zjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质检承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsfy");
try{
	if (!(ls.equals("")))  gsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtfy");
try{
	if (!(ls.equals("")))  qtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它方承担费用]类型转换发生意外:"+e);
	return;
}

double glftd=0;
double wxjbfb=0;
double wxj=0;
double bk=0;

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
String spr=null;
java.sql.Date spsj=null;
String spjl=cf.GB2Uni(request.getParameter("spjl"));
String spyj=cf.GB2Uni(request.getParameter("spyj"));

spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}


String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsjd=null;
	String khbh=null;
	ls_sql="select jsjd,khbh";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjd=cf.fillNull(rs.getString("jsjd"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!jsjd.equals("2"))//1：结算部结算；2：结算审批；3：财务结算
	{
		out.println("错误！未审批");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set zkl=?,khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zkl);
	ps.setDouble(2,khjskze);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update cw_gdjsjl set sgd=?,jzbz=?,wdzgce=?,qye=?,zkl=?,zjxje=?,khjskze=?,khsskze=?,sjcb=?,tdjs=?,bz=?,tdjsje=?,gckk=?,sjsfy=?,sgdfy=?,zjfy=?,gsfy=?,qtfy=?,glftd=?,wxjbfb=?,wxj=?,bk=?,spjl=?,spr=?,spsj=?,spyj=?,jsjd='2'";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,jzbz);
	ps.setDouble(3,wdzgce);
	ps.setDouble(4,qye);
	ps.setDouble(5,zkl);
	ps.setDouble(6,zjxje);
	ps.setDouble(7,khjskze);
	ps.setDouble(8,khsskze);
	ps.setDouble(9,sjcb);
	ps.setString(10,tdjs);
	ps.setString(11,bz);
	ps.setDouble(12,tdjsje);
	ps.setDouble(13,gckk);
	ps.setDouble(14,sjsfy);
	ps.setDouble(15,sgdfy);
	ps.setDouble(16,zjfy);
	ps.setDouble(17,gsfy);
	ps.setDouble(18,qtfy);
	ps.setDouble(19,glftd);
	ps.setDouble(20,wxjbfb);
	ps.setDouble(21,wxj);
	ps.setDouble(22,bk);
	ps.setString(23,spjl);
	ps.setString(24,spr);
	ps.setDate(25,spsj);
	ps.setString(26,spyj);
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
	out.print("Exception: " + e);
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