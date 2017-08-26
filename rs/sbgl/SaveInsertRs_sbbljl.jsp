<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sbbljlh=null;
String shbxh=null;
java.sql.Date sbblsj=null;
long ygbh=0;
String bianhao=null;
String yhmc=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String jbxdd=null;
double sbzrjs=0;
double yjsxe=0;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
double gsjgjj=0;
double grjgjj=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
sbbljlh=cf.GB2Uni(request.getParameter("sbbljlh"));
shbxh=cf.GB2Uni(request.getParameter("shbxh"));
ls=request.getParameter("sbblsj");
try{
	if (!(ls.equals("")))  sbblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sbblsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[社保办理时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
ylbx=cf.GB2Uni(request.getParameter("ylbx"));
jylbx=cf.GB2Uni(request.getParameter("jylbx"));
sybx=cf.GB2Uni(request.getParameter("sybx"));
gsby=cf.GB2Uni(request.getParameter("gsby"));
syx=cf.GB2Uni(request.getParameter("syx"));
jbxdd=cf.GB2Uni(request.getParameter("jbxdd"));
ls=request.getParameter("sbzrjs");
try{
	if (!(ls.equals("")))  sbzrjs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sbzrjs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[转入基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjsxe");
try{
	if (!(ls.equals("")))  yjsxe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsxe不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交纳基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsjbfe");
try{
	if (!(ls.equals("")))  gsjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsjbfe不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司交保费额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("grjbfe");
try{
	if (!(ls.equals("")))  grjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grjbfe不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[个人交保费额]类型转换发生意外:"+e);
	return;
}
sfjgjj=cf.GB2Uni(request.getParameter("sfjgjj"));
ls=request.getParameter("gsjgjj");
try{
	if (!(ls.equals("")))  gsjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsjgjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司交住房公积金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("grjgjj");
try{
	if (!(ls.equals("")))  grjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grjgjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[个人交住房公积金]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

double jndbtc=0;
ls=request.getParameter("jndbtc");
try{
	if (!(ls.equals("")))  jndbtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jndbtc不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交纳大病统筹]类型转换发生意外:"+e);
	return;
}

lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ysbbljlh=cf.GB2Uni(request.getParameter("ysbbljlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="insert into rs_sbbljl ( sbbljlh,shbxh,sbblsj,ygbh,bianhao,yhmc,ylbx,jylbx,sybx,gsby   ,syx,jbxdd,sbzrjs,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,lrr   ,lrsj,lrbm,bz,lx,ysbbljlh,jndbtc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,'1',?,?) ";//1：办理；2：变更；2：停保；3：转出
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sbbljlh);
	ps.setString(2,shbxh);
	ps.setDate(3,sbblsj);
	ps.setLong(4,ygbh);
	ps.setString(5,bianhao);
	ps.setString(6,yhmc);
	ps.setString(7,ylbx);
	ps.setString(8,jylbx);
	ps.setString(9,sybx);
	ps.setString(10,gsby);

	ps.setString(11,syx);
	ps.setString(12,jbxdd);
	ps.setDouble(13,sbzrjs);
	ps.setDouble(14,yjsxe);
	ps.setDouble(15,gsjbfe);
	ps.setDouble(16,grjbfe);
	ps.setString(17,sfjgjj);
	ps.setDouble(18,gsjgjj);
	ps.setDouble(19,grjgjj);
	ps.setString(20,lrr);

	ps.setDate(21,lrsj);
	ps.setString(22,lrbm);
	ps.setString(23,bz);
	ps.setString(24,ysbbljlh);
	ps.setDouble(25,jndbtc);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_ygsbxx set sfcjbx='Y',shbxh=?,sbblsj=?,ylbx=?,jylbx=?,sybx=?,gsby=?,syx=?,jbxdd=?,sbzrjs=?,yjsxe=?  ,gsjbfe=?,grjbfe=?,sfjgjj=?,gsjgjj=?,grjgjj=?,sbbljlh=?,jndbtc=?";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbxh);
	ps.setDate(2,sbblsj);
	ps.setString(3,ylbx);
	ps.setString(4,jylbx);
	ps.setString(5,sybx);
	ps.setString(6,gsby);
	ps.setString(7,syx);
	ps.setString(8,jbxdd);
	ps.setDouble(9,sbzrjs);
	ps.setDouble(10,yjsxe);

	ps.setDouble(11,gsjbfe);
	ps.setDouble(12,grjbfe);
	ps.setString(13,sfjgjj);
	ps.setDouble(14,gsjgjj);
	ps.setDouble(15,grjgjj);
	ps.setString(16,sbbljlh);
	ps.setDouble(17,jndbtc);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>