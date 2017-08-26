<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
java.sql.Date jsrq=null;
double jsbl=0;
double jsje=0;
double clf=0;
double gdyp=0;
double sjbk=0;
String gdjsjd=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String jsjs=null;
double htje=0;
double zjxje=0;
double jsjsze=0;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdyp");
try{
	if (!(ls.equals("")))  gdyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gdyp]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工地用品]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjbk");
try{
	if (!(ls.equals("")))  sjbk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjbk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际拨款]类型转换发生意外:"+e);
	return;
}
gdjsjd=cf.GB2Uni(request.getParameter("gdjsjd"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsjsze");
try{
	if (!(ls.equals("")))  jsjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsjsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算基数总额]类型转换发生意外:"+e);
	return;
}
double yfgf=0;
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付工费]类型转换发生意外:"+e);
	return;
}
double lkhjbfb=0;
ls=request.getParameter("lkhjbfb");
try{
	if (!(ls.equals("")))  lkhjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lkhjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最大领款合计百分比]类型转换发生意外:"+e);
	return;
}

String wherejsjlh=null;
wherejsjlh=cf.GB2Uni(request.getParameter("wherejsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set sgdfbj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsjsze);
	ps.executeUpdate();
	ps.close();
	

	ls_sql="update cw_sgdbgfty set jsrq=?,jsbl=?,jsje=?,clf=?,gdyp=?,sjbk=?,lrr=?,lrsj=?,lrbm=?,bz=?,jsjs=?,htje=?,zjxje=?,jsjsze=? ";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jsrq);
	ps.setDouble(2,jsbl);
	ps.setDouble(3,jsje);
	ps.setDouble(4,clf);
	ps.setDouble(5,gdyp);
	ps.setDouble(6,sjbk);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,jsjs);
	ps.setDouble(12,htje);
	ps.setDouble(13,zjxje);
	ps.setDouble(14,jsjsze);
	ps.executeUpdate();
	ps.close();

	//检查领款合计不能大于lkhjbfb％＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (sjbk>0)
	{
		double bgfhj=cf.round(yfgf+sjbk,2);
		double sgdlkhj=cf.round(bgfhj+clf+gdyp,2);

		if (sgdlkhj>cf.round(jsjsze*lkhjbfb/100+1,2))
		{
			conn.rollback();
			out.println("错误！<P>客户领款合计【材料款("+clf+")＋工地用品("+gdyp+")＋拨工费("+bgfhj+")＝"+sgdlkhj+"】 大于 拨付基数的"+lkhjbfb+"%【"+jsjsze+"×"+lkhjbfb+"％＝"+cf.round(jsjsze*lkhjbfb/100,2)+"】");
			return;
		}
	}
	//检查领款合计不能大于lkhjbfb％＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		
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