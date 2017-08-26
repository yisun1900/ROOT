<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String xcmmc=null;
String xcmlxbm=null;
String azwz=null;
int gd=0;
int kd=0;
int gd1=0;
int kd1=0;
double mj1=0;
int gd2=0;
int kd2=0;
double mj2=0;
String bklxxh=null;
String bkys=null;
String zsxt=null;
String bjbz=null;

String xcmbm1=null;
String xcmbm2=null;
String mbcl1=null;
String mbcl2=null;
String jjfs1=null;
String jjfs2=null;
String xbpz1=null;
String xbpz2=null;
double pmdj1=0;
double pmdj2=0;
double ymdj1=0;
double ymdj2=0;
double qtsf=0;
double zj=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
xcmmc=cf.GB2Uni(request.getParameter("xcmmc"));
xcmlxbm=cf.GB2Uni(request.getParameter("xcmlxbm"));
azwz=cf.GB2Uni(request.getParameter("azwz"));
ls=request.getParameter("gd");
try{
	if (!(ls.equals("")))  gd=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kd");
try{
	if (!(ls.equals("")))  kd=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gd1");
try{
	if (!(ls.equals("")))  gd1=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gd1不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板1高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kd1");
try{
	if (!(ls.equals("")))  kd1=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kd1不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板1宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mj1");
try{
	if (!(ls.equals("")))  mj1=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mj1不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积1]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("gd2");
try{
	if (!(ls.equals("")))  gd2=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gd2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板2高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kd2");
try{
	if (!(ls.equals("")))  kd2=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kd2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板2宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mj2");
try{
	if (!(ls.equals("")))  mj2=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mj2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积2]类型转换发生意外:"+e);
	return;
}

bklxxh=cf.GB2Uni(request.getParameter("bklxxh"));
bkys=cf.GB2Uni(request.getParameter("bkys"));
zsxt=cf.GB2Uni(request.getParameter("zsxt"));
bjbz=cf.GB2Uni(request.getParameter("bjbz"));
xcmbm1=cf.GB2Uni(request.getParameter("xcmbm1"));
xcmbm2=cf.GB2Uni(request.getParameter("xcmbm2"));
jjfs1=cf.GB2Uni(request.getParameter("jjfs1"));
jjfs2=cf.GB2Uni(request.getParameter("jjfs2"));
mbcl1=cf.GB2Uni(request.getParameter("mbcl1"));
mbcl2=cf.GB2Uni(request.getParameter("mbcl2"));
xbpz1=cf.GB2Uni(request.getParameter("xbpz1"));
xbpz2=cf.GB2Uni(request.getParameter("xbpz2"));
ls=request.getParameter("pmdj1");
try{
	if (!(ls.equals("")))  pmdj1=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmdj1不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板1平米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pmdj2");
try{
	if (!(ls.equals("")))  pmdj2=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmdj2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板2平米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ymdj1");
try{
	if (!(ls.equals("")))  ymdj1=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ymdj1不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板1延米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ymdj2");
try{
	if (!(ls.equals("")))  ymdj2=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ymdj2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面板2延米单价]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单保留小数位数』，请联系管理员");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单明细保留小数』，请联系管理员");
		return;
	}
	//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	String xcmxh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xcmxh,10,2)),0)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xcmxh=ddbh+cf.addZero(count+1,2);

	conn.setAutoCommit(false);

	ls_sql="insert into jc_jjxcmmx ( xcmxh,ddbh,xcmlxbm,xcmmc,azwz,gd,kd,bklxxh,bkys,zsxt,bjbz ";
	ls_sql+=" ,xcmbm1,mbcl1,xbpz1,gd1,kd1,mj1,pmdj1,ymdj1,jjfs1  ,xcmbm2,mbcl2,xbpz2,gd2,kd2,mj2,pmdj2,ymdj2,jjfs2 ";
	ls_sql+=" ,qtsf,zj,zqzj,sl,zjhsl,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?  ,?,ROUND(?,"+jcddmxblxs+"),?,0,1,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcmxh);
	ps.setString(2,ddbh);
	ps.setString(3,xcmlxbm);
	ps.setString(4,xcmmc);
	ps.setString(5,azwz);
	ps.setInt(6,gd);
	ps.setInt(7,kd);
	ps.setString(8,bklxxh);
	ps.setString(9,bkys);
	ps.setString(10,zsxt);
	ps.setString(11,bjbz);

	ps.setString(12,xcmbm1);
	ps.setString(13,mbcl1);
	ps.setString(14,xbpz1);
	ps.setInt(15,gd1);
	ps.setInt(16,kd1);
	ps.setDouble(17,mj1);
	ps.setDouble(18,pmdj1);
	ps.setDouble(19,ymdj1);
	ps.setString(20,jjfs1);

	ps.setString(21,xcmbm2);
	ps.setString(22,mbcl2);
	ps.setString(23,xbpz2);
	ps.setInt(24,gd2);
	ps.setInt(25,kd2);
	ps.setDouble(26,mj2);
	ps.setDouble(27,pmdj2);
	ps.setDouble(28,ymdj2);
	ps.setString(29,jjfs2);

	ps.setDouble(30,qtsf);
	ps.setDouble(31,zj*jjzkl/10);
	ps.setDouble(32,zj);
	ps.setString(33,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_xcmzjxmx (zjxxh,xcmxh,ddbh,lx,ysl,xsl)";
	ls_sql+=" values('"+zjxxh+"','"+xcmxh+"','"+ddbh+"','2',0,1)  ";
	ps= conn.prepareStatement(ls_sql);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>