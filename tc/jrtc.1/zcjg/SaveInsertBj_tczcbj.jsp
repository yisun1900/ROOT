<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
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
double tccldj=0;
double jsj=0;
double sh=0;
String sfcscp=null;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
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
ls=request.getParameter("tccldj");
try{
	if (!(ls.equals("")))  tccldj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tccldj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐超量单价]类型转换发生意外:"+e);
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

String sfyx=cf.GB2Uni(request.getParameter("sfyx"));
java.sql.Date yxkssj=null;
ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date yxjzsj=null;
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效结束时间]类型转换发生意外:"+e);
	return;
}

String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String sfkgdj=cf.GB2Uni(request.getParameter("sfkgdj"));

if (xdb==0)
{
	out.println("错误！下单比不能为0");
	return;
}

if (jsj==0)
{
	out.println("提醒！结算价为0");
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (tccplbbm.equals("64"))//墙漆改壁纸
	{
		String bjbbh=null;
		ls_sql="select bjbbh";
		ls_sql+=" from  bj_dzbjbb";
		ls_sql+=" where dqbm='"+dqbm+"' and sfzybb='2'";//2：当前版
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjbbh=rs.getString("bjbbh");
		}
		rs.close();
		ps.close();

		double tlgbzjj=0;//涂料改为壁纸加价
		ls_sql="select tlgbzjj";
		ls_sql+=" from  bj_tcjgb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tlgbzjj=rs.getDouble("tlgbzjj");
		}
		rs.close();
		ps.close();

		if (dj!=tlgbzjj)
		{
			out.println("错误！涂料改壁纸价格不正确，【版本:"+bjbbh+"】【套餐价格表】设置为："+tlgbzjj);
			return;
		}

		if (tccldj!=tlgbzjj)
		{
			out.println("错误！涂料改壁纸价格不正确，【版本:"+bjbbh+"】【套餐价格表】设置为："+tlgbzjj);
			return;
		}
	}

	
	//生成材料编码
	String cpbm=null;
	int count=0;
	ls_sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
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

	ls_sql="insert into bj_tczcbj ( dqbm,bjjbbm,cpbm,sku,tccpdlbm,tccplbbm,cpmc,ppmc,xh,gg  ,jldw,xdjldw,xdb,dj,jsj,sh,sfcscp,xuhao,lrr,lrsj   ,bz,gysmc,sfxclxs,tcsjflbm,sfyx,yxkssj,yxjzsj,tccldj,sfkgdj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,cpbm);
	ps.setString(4,sku);
	ps.setString(5,tccpdlbm);
	ps.setString(6,tccplbbm);
	ps.setString(7,cpmc);
	ps.setString(8,ppmc);
	ps.setString(9,xh);
	ps.setString(10,gg);

	ps.setString(11,jldw);
	ps.setString(12,xdjldw);
	ps.setDouble(13,xdb);
	ps.setDouble(14,dj);
	ps.setDouble(15,jsj);
	ps.setDouble(16,sh);
	ps.setString(17,sfcscp);
	ps.setDouble(18,xuhao);
	ps.setString(19,lrr);
	ps.setDate(20,lrsj);

	ps.setString(21,bz);
	ps.setString(22,gysmc);
	ps.setString(23,sfxclxs);
	ps.setString(24,tcsjflbm);
	ps.setString(25,sfyx);
	ps.setDate(26,yxkssj);
	ps.setDate(27,yxjzsj);
	ps.setDouble(28,tccldj);
	ps.setString(29,sfkgdj);
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