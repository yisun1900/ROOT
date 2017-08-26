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
double htje=0;
double suijin=0;
double glf=0;
double gczxzq=0;
double gcjxzq=0;
double gcjse=0;

double jsbl=0;
double jsje=0;
double kzbjbl=0;
double kzb=0;
double gcglfk=0;
double gcqtfk=0;
double jsyfje=0;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
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
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[suijin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[glf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gczxzq");
try{
	if (!(ls.equals("")))  gczxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gczxzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程增项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcjxzq");
try{
	if (!(ls.equals("")))  gcjxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcjxzq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程减项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcjse");
try{
	if (!(ls.equals("")))  gcjse=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcjse]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程结算额]类型转换发生意外:"+e);
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
	out.println("<BR>[承包结算比例]类型转换发生意外:"+e);
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
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应扣质保金比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kzb");
try{
	if (!(ls.equals("")))  kzb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcglfk");
try{
	if (!(ls.equals("")))  gcglfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcglfk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程管理处罚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcqtfk");
try{
	if (!(ls.equals("")))  gcqtfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcqtfk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程其它处罚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsyfje");
try{
	if (!(ls.equals("")))  jsyfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsyfje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算应付金额]类型转换发生意外:"+e);
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


lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


double clfk=0;
double llje=0;
double yfgck=0;
double ykgccf=0;
double qtkk=0;
double xcyxfy=0;
double clyf=0;

double gcsfje=0;
ls=request.getParameter("clfk");
try{
	if (!(ls.equals("")))  clfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clfk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料评审处罚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("llje");
try{
	if (!(ls.equals("")))  llje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[llje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[库房领料金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yfgck");
try{
	if (!(ls.equals("")))  yfgck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付工程款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ykgccf");
try{
	if (!(ls.equals("")))  ykgccf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ykgccf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已扣工程处罚]类型转换发生意外:"+e);
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
	out.println("<BR>[其它扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xcyxfy");
try{
	if (!(ls.equals("")))  xcyxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xcyxfy]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[现场营销费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clyf");
try{
	if (!(ls.equals("")))  clyf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clyf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料运费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcsfje");
try{
	if (!(ls.equals("")))  gcsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcsfje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程实付金额]类型转换发生意外:"+e);
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

	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("8"))//8:完工结算
	{
		conn.rollback();
		out.println("错误！结算进度不正确");
		return;
	}

	ls_sql="update cw_sgdwgjsjlkb set htje=?,suijin=?,glf=?,gczxzq=?,gcjxzq=?,gcjse=?,jsbl=?,jsje=?   ,kzbjbl=?,kzb=?,gcglfk=?,gcqtfk=?,jsyfje=?   ,clfk=?,llje=?,yfgck=?,ykgccf=?,qtkk=?,xcyxfy=?,clyf=?,gcsfje=?,  jsrq=?,lrr=?,lrsj=?,lrbm=?,bz=?";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,htje);
	ps.setDouble(2,suijin);
	ps.setDouble(3,glf);
	ps.setDouble(4,gczxzq);
	ps.setDouble(5,gcjxzq);
	ps.setDouble(6,gcjse);

	ps.setDouble(7,jsbl);
	ps.setDouble(8,jsje);
	ps.setDouble(9,kzbjbl);
	ps.setDouble(10,kzb);
	ps.setDouble(11,gcglfk);
	ps.setDouble(12,gcqtfk);
	ps.setDouble(13,jsyfje);
	ps.setDouble(14,clfk);
	ps.setDouble(15,llje);
	ps.setDouble(16,yfgck);

	ps.setDouble(17,ykgccf);
	ps.setDouble(18,qtkk);
	ps.setDouble(19,xcyxfy);
	ps.setDouble(20,clyf);
	ps.setDouble(21,gcsfje);

	ps.setDate(22,jsrq);
	ps.setString(23,lrr);

	ps.setDate(24,lrsj);
	ps.setString(25,lrbm);
	ps.setString(26,bz);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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