<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String cgbm=null;
double dgcd=0;
long dggd=0;
long dgjs=0;
double dgdj=0;
double tdcd=0;
long tggd=0;
long tgjs=0;
double tgdj=0;
String tmbm=null;
double tmcd=0;
double tmdj=0;
double mbmj=0;
double mbdj=0;
String mbbm=null;
String mbfbbm=null;
double mbfbjg=0;
String xtbm=null;
double xtjg=0;
String lsbm=null;
double lsjg=0;
String tjbbm=null;
double tjbjg=0;
String ctbm=null;
double ctjg=0;
String jlbm=null;
double jljg=0;
double dgfbxs=0;
double tgfbxs=0;
double tmfbxs=0;
double sjzj=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
cgbm=cf.GB2Uni(request.getParameter("cgbm"));
ls=request.getParameter("dgcd");
try{
	if (!(ls.equals("")))  dgcd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[吊柜长度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dggd");
try{
	if (!(ls.equals("")))  dggd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dggd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[吊柜高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgjs");
try{
	if (!(ls.equals("")))  dgjs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgjs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[吊柜进深]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgdj");
try{
	if (!(ls.equals("")))  dgdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[吊柜单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tdcd");
try{
	if (!(ls.equals("")))  tdcd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地柜长度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tggd");
try{
	if (!(ls.equals("")))  tggd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tggd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地柜高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tgjs");
try{
	if (!(ls.equals("")))  tgjs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tgjs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地柜进深]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tgdj");
try{
	if (!(ls.equals("")))  tgdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tgdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地柜单价]类型转换发生意外:"+e);
	return;
}
tmbm=cf.GB2Uni(request.getParameter("tmbm"));
ls=request.getParameter("tmcd");
try{
	if (!(ls.equals("")))  tmcd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面长度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tmdj");
try{
	if (!(ls.equals("")))  tmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mbmj");
try{
	if (!(ls.equals("")))  mbmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mbmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门板面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mbdj");
try{
	if (!(ls.equals("")))  mbdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mbdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门板单价]类型转换发生意外:"+e);
	return;
}
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
mbfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
ls=request.getParameter("mbfbjg");
try{
	if (!(ls.equals("")))  mbfbjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mbfbjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门板封边价格]类型转换发生意外:"+e);
	return;
}
xtbm=cf.GB2Uni(request.getParameter("xtbm"));
ls=request.getParameter("xtjg");
try{
	if (!(ls.equals("")))  xtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xtjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[箱体价格]类型转换发生意外:"+e);
	return;
}
lsbm=cf.GB2Uni(request.getParameter("lsbm"));
ls=request.getParameter("lsjg");
try{
	if (!(ls.equals("")))  lsjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lsjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拉手价格]类型转换发生意外:"+e);
	return;
}
tjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
ls=request.getParameter("tjbjg");
try{
	if (!(ls.equals("")))  tjbjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjbjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[踢脚板价格]类型转换发生意外:"+e);
	return;
}
ctbm=cf.GB2Uni(request.getParameter("ctbm"));
ls=request.getParameter("ctjg");
try{
	if (!(ls.equals("")))  ctjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ctjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[抽屉价格]类型转换发生意外:"+e);
	return;
}
jlbm=cf.GB2Uni(request.getParameter("jlbm"));
ls=request.getParameter("jljg");
try{
	if (!(ls.equals("")))  jljg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jljg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[铰链价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgfbxs");
try{
	if (!(ls.equals("")))  dgfbxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgfbxs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[吊柜非标系数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tgfbxs");
try{
	if (!(ls.equals("")))  tgfbxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tgfbxs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地柜非标系数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tmfbxs");
try{
	if (!(ls.equals("")))  tmfbxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmfbxs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面非标系数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjzj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际总价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int xh=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  jc_cgfcdmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	

	ls_sql="insert into jc_cgfcdmx ( xh,ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,ddbh);
	ps.setString(3,cgbm);
	ps.setDouble(4,dgcd);
	ps.setLong(5,dggd);
	ps.setLong(6,dgjs);
	ps.setDouble(7,dgdj);
	ps.setDouble(8,dgfbxs);
	ps.setDouble(9,tdcd);
	ps.setLong(10,tggd);
	ps.setLong(11,tgjs);
	ps.setDouble(12,tgdj);
	ps.setDouble(13,tgfbxs);
	ps.setString(14,tmbm);
	ps.setDouble(15,tmcd);
	ps.setDouble(16,tmdj);
	ps.setDouble(17,tmfbxs);
	ps.setDouble(18,mbmj);
	ps.setDouble(19,mbdj);
	ps.setString(20,mbbm);
	ps.setString(21,mbfbbm);
	ps.setDouble(22,mbfbjg);
	ps.setString(23,xtbm);
	ps.setDouble(24,xtjg);
	ps.setString(25,lsbm);
	ps.setDouble(26,lsjg);
	ps.setString(27,tjbbm);
	ps.setDouble(28,tjbjg);
	ps.setString(29,ctbm);
	ps.setDouble(30,ctjg);
	ps.setString(31,jlbm);
	ps.setDouble(32,jljg);
	ps.setDouble(33,sjzj);
	ps.setString(34,bz);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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