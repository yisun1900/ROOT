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
double zqhj=0;
double zhhj=0;
double jsze=0;
double yjzxk=0;
double dj=0;
double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double djfxje=0;
double dyq=0;
double yhze=0;
double shfqje=0;
double yjzck=0;
double zcddjezq=0;
double zcddyh=0;
double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double pck=0;
double khbjk=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("htsjf");
try{
	if (!(ls.equals("")))  htsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sssjf");
try{
	if (!(ls.equals("")))  sssjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sssjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wdzgce]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约总额－折前]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qye]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约总额－折后]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqljzjx");
try{
	if (!(ls.equals("")))  zqljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqljzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项总额－折前]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhljzjx");
try{
	if (!(ls.equals("")))  zhljzjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhljzjx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项总额－折后]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqhj");
try{
	if (!(ls.equals("")))  zqhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqhj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程合计－折前]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhhj");
try{
	if (!(ls.equals("")))  zhhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zhhj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程合计－折后]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsze");
try{
	if (!(ls.equals("")))  jsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算施工总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjzxk");
try{
	if (!(ls.equals("")))  yjzxk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjzxk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已交装修款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[定金转装修款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjwk");
try{
	if (!(ls.equals("")))  yjwk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjwk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应交尾款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhje");
try{
	if (!(ls.equals("")))  yhje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yhje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fqbl");
try{
	if (!(ls.equals("")))  fqbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fqbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返券比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fqje");
try{
	if (!(ls.equals("")))  fqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返券优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djfxje");
try{
	if (!(ls.equals("")))  djfxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djfxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金折现优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dyq");
try{
	if (!(ls.equals("")))  dyq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dyq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[抵用券]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhze");
try{
	if (!(ls.equals("")))  yhze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yhze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shfqje");
try{
	if (!(ls.equals("")))  shfqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shfqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收回返券金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjzck");
try{
	if (!(ls.equals("")))  yjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjzck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已交主材款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcddjezq");
try{
	if (!(ls.equals("")))  zcddjezq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcddjezq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机电代销]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcddyh");
try{
	if (!(ls.equals("")))  zcddyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcddyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机电代销优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgzcjezq");
try{
	if (!(ls.equals("")))  dgzcjezq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dgzcjezq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代购主材]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgzcyh");
try{
	if (!(ls.equals("")))  dgzcyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dgzcyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代购主材优惠]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcjsje");
try{
	if (!(ls.equals("")))  zcjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材结算额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pck");
try{
	if (!(ls.equals("")))  pck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赔偿款延期费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khbjk");
try{
	if (!(ls.equals("")))  khbjk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khbjk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户补交款]类型转换发生意外:"+e);
	return;
}
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
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
double zctcze=0;
ls=request.getParameter("zctcze");
try{
	if (!(ls.equals("")))  zctcze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zctcze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材套餐]类型转换发生意外:"+e);
	return;
}
String bxkh=cf.GB2Uni(request.getParameter("bxkh"));
double fxjzck=0;
ls=request.getParameter("fxjzck");
try{
	if (!(ls.equals("")))  fxjzck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fxjzck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非现金交主材款]类型转换发生意外:"+e);
	return;
}

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String khjsclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  cw_jrkhjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjsclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (khjsclzt.equals("2"))//1：未审批；2：审批同意；3：审批不同意 
	{
		out.println("错误！客户已审核");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set khjsbz='Y',khjsje=?,khjssj=?,bxkh=?,kbxbz='Y',bxkssj=?,bxjzsj=ADD_MONTHS(?,24)";//Y：保修；M：部分保修；N：不保修；0：未办理；1：预办理保修
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsze);
	ps.setDate(2,lrsj);
	ps.setString(3,bxkh);
	ps.setDate(4,lrsj);
	ps.setDate(5,lrsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_jrkhjs set htsjf=?,sssjf=?,wdzgce=?,qye=?,zqljzjx=?,zhljzjx=?,zqhj=?,zhhj=?,jsze=?,yjzxk=?,dj=?,yjwk=?,yhje=?,fqbl=?,fqje=?,djfxje=?,dyq=?,yhze=?,shfqje=?,yjzck=?,zcddjezq=?,zcddyh=?,dgzcjezq=?,dgzcyh=?,zcjsje=?,pck=?,khbjk=?,lrr=?,lrsj=?,lrbm=?,bz=?,zctcze=?,fxjzck=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,htsjf);
	ps.setDouble(2,sssjf);
	ps.setDouble(3,wdzgce);
	ps.setDouble(4,qye);
	ps.setDouble(5,zqljzjx);
	ps.setDouble(6,zhljzjx);
	ps.setDouble(7,zqhj);
	ps.setDouble(8,zhhj);
	ps.setDouble(9,jsze);
	ps.setDouble(10,yjzxk);
	ps.setDouble(11,dj);
	ps.setDouble(12,yjwk);
	ps.setDouble(13,yhje);
	ps.setDouble(14,fqbl);
	ps.setDouble(15,fqje);
	ps.setDouble(16,djfxje);
	ps.setDouble(17,dyq);
	ps.setDouble(18,yhze);
	ps.setDouble(19,shfqje);
	ps.setDouble(20,yjzck);
	ps.setDouble(21,zcddjezq);
	ps.setDouble(22,zcddyh);
	ps.setDouble(23,dgzcjezq);
	ps.setDouble(24,dgzcyh);
	ps.setDouble(25,zcjsje);
	ps.setDouble(26,pck);
	ps.setDouble(27,khbjk);
	ps.setString(28,lrr);
	ps.setDate(29,lrsj);
	ps.setString(30,lrbm);
	ps.setString(31,bz);
	ps.setDouble(32,zctcze);
	ps.setDouble(33,fxjzck);
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
	out.print("<BR>出错:" + e);
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