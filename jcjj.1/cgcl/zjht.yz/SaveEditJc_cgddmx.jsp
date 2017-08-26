<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
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
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
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
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double cghtze=0;
double zsje=0;
double htze=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="update jc_cgddmx set cgbm=?,dgcd=?,dggd=?,dgjs=?,dgdj=?,dgfbxs=?,tdcd=?,tggd=?,tgjs=?,tgdj=?,tgfbxs=?,tmbm=?,tmcd=?,tmdj=?,tmfbxs=?,mbmj=?,mbdj=?,mbbm=?,mbfbbm=?,mbfbjg=?,xtbm=?,xtjg=?,lsbm=?,lsjg=?,tjbbm=?,tjbjg=?,ctbm=?,ctjg=?,jlbm=?,jljg=?,sjzj=?,bz=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgbm);
	ps.setDouble(2,dgcd);
	ps.setLong(3,dggd);
	ps.setLong(4,dgjs);
	ps.setDouble(5,dgdj);
	ps.setDouble(6,dgfbxs);
	ps.setDouble(7,tdcd);
	ps.setLong(8,tggd);
	ps.setLong(9,tgjs);
	ps.setDouble(10,tgdj);
	ps.setDouble(11,tgfbxs);
	ps.setString(12,tmbm);
	ps.setDouble(13,tmcd);
	ps.setDouble(14,tmdj);
	ps.setDouble(15,tmfbxs);
	ps.setDouble(16,mbmj);
	ps.setDouble(17,mbdj);
	ps.setString(18,mbbm);
	ps.setString(19,mbfbbm);
	ps.setDouble(20,mbfbjg);
	ps.setString(21,xtbm);
	ps.setDouble(22,xtjg);
	ps.setString(23,lsbm);
	ps.setDouble(24,lsjg);
	ps.setString(25,tjbbm);
	ps.setDouble(26,tjbjg);
	ps.setString(27,ctbm);
	ps.setDouble(28,ctjg);
	ps.setString(29,jlbm);
	ps.setDouble(30,jljg);
	ps.setDouble(31,sjzj);
	ps.setString(32,bz);
	ps.executeUpdate();
	ps.close();


/*	
	ls_sql="select sum(sjzj)";
	ls_sql+=" from  jc_cgddmx";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cghtze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select "+cghtze+"+wjhtze+dqhtze,zsje";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htze=rs.getDouble(1);
		zsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	
	ls_sql="update jc_cgdd set cghtze=?,htze=?,ssje=?";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,cghtze);
	ps.setDouble(2,htze);
	ps.setDouble(3,htze-zsje);
	ps.executeUpdate();
	ps.close();
*/

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
//	alert("存盘成功！橱柜合同总额=<%=cghtze%>，合同总额=<%=htze%>，赠送金额＝<%=zsje%>，实收金额=<%=htze-zsje%>");
	alert("存盘成功！");
	parent.window.close();
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