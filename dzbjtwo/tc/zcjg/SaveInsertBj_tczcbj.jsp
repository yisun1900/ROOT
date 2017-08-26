<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String sku=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String ppmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double dj=0;
double jsj=0;
double jjje=0;
double sh=0;
String sfcscp=null;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
sku=cf.GB2Uni(request.getParameter("sku"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
xdjldw=cf.GB2Uni(request.getParameter("xdjldw"));
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xdb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下单比]类型转换发生意外:"+e);
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
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jjje");
try{
	if (!(ls.equals("")))  jjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加价金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗]类型转换发生意外:"+e);
	return;
}
sfcscp=cf.GB2Uni(request.getParameter("sfcscp"));
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xuhao不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[排序序号]类型转换发生意外:"+e);
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
String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//生成材料编码
	String cpbm=null;
	int count=0;
	ls_sql="select NVL(
	max(SUBSTR(cpbm,3,11)),0)";
	ls_sql+=" from  bj_tczcbj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	count++;

	cpbm="TC"+cf.addZero(count,11);

	ls_sql="insert into bj_tczcbj ( bjbbh,dqbm,bjjbbm,cpbm,sku,tccpdlbm,tccplbbm,cpmc,ppmc,xh   ,gg,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,xuhao  ,lrr,lrsj,bz,gysmc,sfxclxs,tcsjflbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,cpbm);
	ps.setString(5,sku);
	ps.setString(6,tccpdlbm);
	ps.setString(7,tccplbbm);
	ps.setString(8,cpmc);
	ps.setString(9,ppmc);
	ps.setString(10,xh);

	ps.setString(11,gg);
	ps.setString(12,jldw);
	ps.setString(13,xdjldw);
	ps.setDouble(14,xdb);
	ps.setDouble(15,dj);
	ps.setDouble(16,jsj);
	ps.setDouble(17,jjje);
	ps.setDouble(18,sh);
	ps.setString(19,sfcscp);
	ps.setDouble(20,xuhao);

	ps.setString(21,lrr);
	ps.setDate(22,lrsj);
	ps.setString(23,bz);
	ps.setString(24,gysmc);
	ps.setString(25,sfxclxs);
	ps.setString(26,tcsjflbm);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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