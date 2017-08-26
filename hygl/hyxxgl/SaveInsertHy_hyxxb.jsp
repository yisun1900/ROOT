<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hybh=null;
String hymm=null;
String hyxm=null;
String xb=null;
String yzbm=null;
String hydz=null;
String sfzhm=null;
String dh=null;
String sj=null;
String dzxx=null;
java.sql.Date csrq=null;
String zydm=null;
String ysrdm=null;
String hyzk=null;
java.sql.Date jhjnr=null;
String arxm=null;
java.sql.Date arsr=null;
String jgyxbm=null;
String fwyxbm=null;
String fgyxbm=null;
String gyyxbm=null;
String zdfgbm=null;
String psahbm=null;
String bzzz=null;
String sztlpp=null;
String shop=null;
String hzppp=null;
String fzpp=null;
String dwbh=null;
java.sql.Date rhrq=null;
java.sql.Date yxrq=null;
String hykh=null;
String hyjb=null;
String fwlx=null;
long gmcs=0;
double xfzje=0;
long jf=0;
long wdhjf=0;
String xxlrr=null;
String bz=null;
hybh=cf.GB2Uni(request.getParameter("hybh"));
hymm=cf.GB2Uni(request.getParameter("hymm"));
hyxm=cf.GB2Uni(request.getParameter("hyxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
yzbm=cf.GB2Uni(request.getParameter("yzbm"));
hydz=cf.GB2Uni(request.getParameter("hydz"));
sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
dh=cf.GB2Uni(request.getParameter("dh"));
sj=cf.GB2Uni(request.getParameter("sj"));
dzxx=cf.GB2Uni(request.getParameter("dzxx"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出生日期]类型转换发生意外:"+e);
	return;
}
zydm=cf.GB2Uni(request.getParameter("zydm"));
ysrdm=cf.GB2Uni(request.getParameter("ysrdm"));
hyzk=cf.GB2Uni(request.getParameter("hyzk"));
ls=request.getParameter("jhjnr");
try{
	if (!(ls.equals("")))  jhjnr=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjnr不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结婚纪念日]类型转换发生意外:"+e);
	return;
}
arxm=cf.GB2Uni(request.getParameter("arxm"));
ls=request.getParameter("arsr");
try{
	if (!(ls.equals("")))  arsr=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量arsr不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[爱人生日]类型转换发生意外:"+e);
	return;
}
jgyxbm=cf.GB2Uni(request.getParameter("jgyxbm"));
fwyxbm=cf.GB2Uni(request.getParameter("fwyxbm"));
fgyxbm=cf.GB2Uni(request.getParameter("fgyxbm"));
gyyxbm=cf.GB2Uni(request.getParameter("gyyxbm"));
zdfgbm=cf.GB2Uni(request.getParameter("zdfgbm"));
psahbm=cf.GB2Uni(request.getParameter("psahbm"));
bzzz=cf.GB2Uni(request.getParameter("bzzz"));
sztlpp=cf.GB2Uni(request.getParameter("sztlpp"));
shop=cf.GB2Uni(request.getParameter("shop"));
hzppp=cf.GB2Uni(request.getParameter("hzppp"));
fzpp=cf.GB2Uni(request.getParameter("fzpp"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("rhrq");
try{
	if (!(ls.equals("")))  rhrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rhrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入会日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxrq");
try{
	if (!(ls.equals("")))  yxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效日期]类型转换发生意外:"+e);
	return;
}
hykh=cf.GB2Uni(request.getParameter("hykh"));
hyjb=cf.GB2Uni(request.getParameter("hyjb"));
fwlx=cf.GB2Uni(request.getParameter("fwlx"));
ls=request.getParameter("gmcs");
try{
	if (!(ls.equals("")))  gmcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gmcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购买次数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xfzje");
try{
	if (!(ls.equals("")))  xfzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xfzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[消费总金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jf");
try{
	if (!(ls.equals("")))  jf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[积分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdhjf");
try{
	if (!(ls.equals("")))  wdhjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdhjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未兑换积分]类型转换发生意外:"+e);
	return;
}
xxlrr=cf.GB2Uni(request.getParameter("xxlrr"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

String kdlb=null;
String sfyfk=null;
String skdw=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql = "select kdlb,sfyfk,dwbh from hy_khxxb where hykh='"+hykh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		kdlb=rs.getString("kdlb");
		sfyfk=rs.getString("sfyfk");
		skdw=rs.getString("dwbh");
	}
	else{
		out.println("错误！不存在的水质分析卡号");
		return;
	}
	rs.close();
	ps.close();

	if (sfyfk.equals("N"))
	{
		out.println("错误！此卡尚未分发");
		return;
	}
	if (!skdw.equals(dwbh))
	{
		out.println("错误！收卡单位不正确");
		return;
	}
	if (!kdlb.equals(hyjb))
	{
		out.println("错误！会员级别不正确");
		return;
	}

	ls_sql = "select count(*) from hy_hyxxb where hykh='"+hykh+"' and sfzf='N'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！水质分析卡已被使用");
		return;
	}



	conn.setAutoCommit(false);

	ls_sql="update hy_khxxb set sfysy='Y',hybh=?,syrq=TRUNC(SYSDATE) where hykh='"+hykh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hybh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into hy_hyxxb ( hybh,sfzf,hymm,hyxm,xb,yzbm,hydz,sfzhm,dh,sj,dzxx,csrq,zydm,ysrdm,hyzk,jhjnr,arxm,arsr,jgyxbm,fwyxbm,fgyxbm,gyyxbm,zdfgbm,psahbm,bzzz,sztlpp,shop,hzppp,fzpp,dwbh,rhrq,yxrq,hykh,hyjb,fwlx,gmcs,xfzje,jf,wdhjf,xxlrr,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hybh);
	ps.setString(2,"N");
	ps.setString(3,hymm);
	ps.setString(4,hyxm);
	ps.setString(5,xb);
	ps.setString(6,yzbm);
	ps.setString(7,hydz);
	ps.setString(8,sfzhm);
	ps.setString(9,dh);
	ps.setString(10,sj);
	ps.setString(11,dzxx);
	ps.setDate(12,csrq);
	ps.setString(13,zydm);
	ps.setString(14,ysrdm);
	ps.setString(15,hyzk);
	ps.setDate(16,jhjnr);
	ps.setString(17,arxm);
	ps.setDate(18,arsr);
	ps.setString(19,jgyxbm);
	ps.setString(20,fwyxbm);
	ps.setString(21,fgyxbm);
	ps.setString(22,gyyxbm);
	ps.setString(23,zdfgbm);
	ps.setString(24,psahbm);
	ps.setString(25,bzzz);
	ps.setString(26,sztlpp);
	ps.setString(27,shop);
	ps.setString(28,hzppp);
	ps.setString(29,fzpp);
	ps.setString(30,dwbh);
	ps.setDate(31,rhrq);
	ps.setDate(32,yxrq);
	ps.setString(33,hykh);
	ps.setString(34,hyjb);
	ps.setString(35,fwlx);
	ps.setLong(36,gmcs);
	ps.setDouble(37,xfzje);
	ps.setLong(38,jf);
	ps.setLong(39,wdhjf);
	ps.setString(40,xxlrr);
	ps.setString(41,bz);
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
	out.print("存盘失败,发生意外: " + e);
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