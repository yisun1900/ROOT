<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double jbgz=0;
double gwgz=0;
double glgz=0;
double jtbt=0;
double dhbt=0;
double cb=0;
double buzhu=0;
double dxsf=0;
double khgz=0;
double jxfz=0;
double jxgz=0;
double khyj=0;
double bqyjze=0;
double cqts=0;
double sjts=0;
double bjts=0;
double kgts=0;
double sjkk=0;
double bjkk=0;
double cjkk=0;
double kgkk=0;
double qqkk=0;
double jbf=0;
double kbx=0;
double jf=0;
double kzbj=0;
double qtkk=0;
double yfgz=0;
double ksk=0;
double sfgz=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String khzq=null;
double jxgzjs=0;
double yjkhkk=0;
double cjts=0;
double jbts=0;
double dixin=0;
double sqyj=0;
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jbgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基本工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gwgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗位工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[glgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工龄工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jtbt]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交通补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dhbt]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[通讯补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[餐饮补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("buzhu");
try{
	if (!(ls.equals("")))  buzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[buzhu]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dxsf");
try{
	if (!(ls.equals("")))  dxsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dxsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[底薪上浮]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khgz");
try{
	if (!(ls.equals("")))  khgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[绩效工资基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxfz");
try{
	if (!(ls.equals("")))  jxfz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxfz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[绩效分值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxgz");
try{
	if (!(ls.equals("")))  jxgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[绩效工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khyj");
try{
	if (!(ls.equals("")))  khyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核业绩]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bqyjze");
try{
	if (!(ls.equals("")))  bqyjze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bqyjze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本期业绩总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cqts");
try{
	if (!(ls.equals("")))  cqts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cqts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际出勤天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjts");
try{
	if (!(ls.equals("")))  sjts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事假天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjts");
try{
	if (!(ls.equals("")))  bjts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bjts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[病假天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgts");
try{
	if (!(ls.equals("")))  kgts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kgts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[旷工天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjkk");
try{
	if (!(ls.equals("")))  sjkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事假扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjkk");
try{
	if (!(ls.equals("")))  bjkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bjkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[病假扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjkk");
try{
	if (!(ls.equals("")))  cjkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cjkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产假扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgkk");
try{
	if (!(ls.equals("")))  kgkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kgkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[旷工扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qqkk");
try{
	if (!(ls.equals("")))  qqkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qqkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[缺勤扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jbf");
try{
	if (!(ls.equals("")))  jbf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jbf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加班费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kbx");
try{
	if (!(ls.equals("")))  kbx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kbx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣保险]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jf");
try{
	if (!(ls.equals("")))  jf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖罚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kzbj");
try{
	if (!(ls.equals("")))  kzbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtkk");
try{
	if (!(ls.equals("")))  qtkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其他款项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yfgz");
try{
	if (!(ls.equals("")))  yfgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应发工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ksk");
try{
	if (!(ls.equals("")))  ksk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ksk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣个税]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sfgz");
try{
	if (!(ls.equals("")))  sfgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sfgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实发工资]类型转换发生意外:"+e);
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
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
khzq=cf.GB2Uni(request.getParameter("khzq"));
ls=request.getParameter("jxgzjs");
try{
	if (!(ls.equals("")))  jxgzjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxgzjs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[绩效工资基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjkhkk");
try{
	if (!(ls.equals("")))  yjkhkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjkhkk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩考核扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjts");
try{
	if (!(ls.equals("")))  cjts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cjts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产假天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jbts");
try{
	if (!(ls.equals("")))  jbts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jbts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加班天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dixin");
try{
	if (!(ls.equals("")))  dixin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dixin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[底薪]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqyj");
try{
	if (!(ls.equals("")))  sqyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[连续3期业绩]类型转换发生意外:"+e);
	return;
}
String wheressfgs=null;
String whereygbh=null;
String wherekhzq=null;
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_gzmxb set jbgz=?,gwgz=?,glgz=?,jtbt=?,dhbt=?,cb=?,buzhu=?,dxsf=?,khgz=?,jxfz=?,jxgz=?,khyj=?,bqyjze=?,cqts=?,sjts=?,bjts=?,kgts=?,sjkk=?,bjkk=?,cjkk=?,kgkk=?,qqkk=?,jbf=?,kbx=?,jf=?,kzbj=?,qtkk=?,yfgz=?,ksk=?,sfgz=?,lrr=?,lrsj=?,bz=?,khzq=?,jxgzjs=?,yjkhkk=?,cjts=?,jbts=?,dixin=?,sqyj=? ";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (ygbh="+whereygbh+") and  (khzq='"+wherekhzq+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jbgz);
	ps.setDouble(2,gwgz);
	ps.setDouble(3,glgz);
	ps.setDouble(4,jtbt);
	ps.setDouble(5,dhbt);
	ps.setDouble(6,cb);
	ps.setDouble(7,buzhu);
	ps.setDouble(8,dxsf);
	ps.setDouble(9,khgz);
	ps.setDouble(10,jxfz);
	ps.setDouble(11,jxgz);
	ps.setDouble(12,khyj);
	ps.setDouble(13,bqyjze);
	ps.setDouble(14,cqts);
	ps.setDouble(15,sjts);
	ps.setDouble(16,bjts);
	ps.setDouble(17,kgts);
	ps.setDouble(18,sjkk);
	ps.setDouble(19,bjkk);
	ps.setDouble(20,cjkk);
	ps.setDouble(21,kgkk);
	ps.setDouble(22,qqkk);
	ps.setDouble(23,jbf);
	ps.setDouble(24,kbx);
	ps.setDouble(25,jf);
	ps.setDouble(26,kzbj);
	ps.setDouble(27,qtkk);
	ps.setDouble(28,yfgz);
	ps.setDouble(29,ksk);
	ps.setDouble(30,sfgz);
	ps.setString(31,lrr);
	ps.setDate(32,lrsj);
	ps.setString(33,bz);
	ps.setString(34,khzq);
	ps.setDouble(35,jxgzjs);
	ps.setDouble(36,yjkhkk);
	ps.setDouble(37,cjts);
	ps.setDouble(38,jbts);
	ps.setDouble(39,dixin);
	ps.setDouble(40,sqyj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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