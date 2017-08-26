<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcmxh=null;
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
xcmxh=cf.GB2Uni(request.getParameter("xcmxh"));
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
	out.println("<BR>[高度]类型转换发生意外:"+e);
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
	out.println("<BR>[宽度]类型转换发生意外:"+e);
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
	out.println("<BR>[材料1高度]类型转换发生意外:"+e);
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
	out.println("<BR>[材料1宽度]类型转换发生意外:"+e);
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
	out.println("<BR>[材料2高度]类型转换发生意外:"+e);
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
	out.println("<BR>[材料2宽度]类型转换发生意外:"+e);
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

String wherexcmxh=null;
wherexcmxh=cf.GB2Uni(request.getParameter("wherexcmxh"));
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
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
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
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
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

	conn.setAutoCommit(false);

	ls_sql="update jc_jjxcmmx set xcmlxbm=?,xcmmc=?,azwz=?,gd=?,kd=?,bklxxh=?,bkys=?,zsxt=?,bjbz=?";
	ls_sql+=" ,xcmbm1=?,mbcl1=?,xbpz1=?,gd1=?,kd1=?,mj1=?,pmdj1=?,ymdj1=?,jjfs1=?  ,xcmbm2=?,mbcl2=?,xbpz2=?,gd2=?,kd2=?,mj2=?,pmdj2=?,ymdj2=?,jjfs2=?";
	ls_sql+=" ,qtsf=?,zj=ROUND(?,"+jcddmxblxs+"),zqzj=?,bz=? ";
	ls_sql+=" where xcmxh='"+wherexcmxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcmlxbm);
	ps.setString(2,xcmmc);
	ps.setString(3,azwz);
	ps.setInt(4,gd);
	ps.setInt(5,kd);
	ps.setString(6,bklxxh);
	ps.setString(7,bkys);
	ps.setString(8,zsxt);
	ps.setString(9,bjbz);

	ps.setString(10,xcmbm1);
	ps.setString(11,mbcl1);
	ps.setString(12,xbpz1);
	ps.setInt(13,gd1);
	ps.setInt(14,kd1);
	ps.setDouble(15,mj1);
	ps.setDouble(16,pmdj1);
	ps.setDouble(17,ymdj1);
	ps.setString(18,jjfs1);

	ps.setString(19,xcmbm2);
	ps.setString(20,mbcl2);
	ps.setString(21,xbpz2);
	ps.setInt(22,gd2);
	ps.setInt(23,kd2);
	ps.setDouble(24,mj2);
	ps.setDouble(25,pmdj2);
	ps.setDouble(26,ymdj2);
	ps.setString(27,jjfs2);

	ps.setDouble(28,qtsf);
	ps.setDouble(29,zj*jjzkl/10);
	ps.setDouble(30,zj);
	ps.setString(31,bz);
	
	ps.executeUpdate();
	ps.close();

	//计算金额总计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	double jjje=0;
	double cpjjje=0;
	double xcmje=0;
	double htze=0;

	double zqjjje=0;
	double zqcpjjje=0;
	double zqxcmje=0;
	double wdzje=0;

	//家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjje=rs.getDouble(1);
		zqjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//成品家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjje=rs.getDouble(1);
		zqcpjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//型材门合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmje=rs.getDouble(1);
		zqxcmje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//合同总额
	htze=jjje+xcmje+cpjjje;
	wdzje=zqjjje+zqxcmje+zqcpjjje;

	ls_sql="update jc_jjdd set jjje=ROUND(?,"+jcddmxblxs+"),xcmje=ROUND(?,"+jcddmxblxs+"),cpjjje=ROUND(?,"+jcddmxblxs+"),htze=ROUND(?,"+jcddblxs+")   ,zqjjje=?,zqxcmje=?,zqcpjjje=?,wdzje=? ";
	ls_sql+="          ,jjzjje=ROUND(?,"+jcddmxblxs+"),xcmzjje=ROUND(?,"+jcddmxblxs+"),cpjjzjje=ROUND(?,"+jcddmxblxs+"),zjhze=ROUND(?,"+jcddblxs+")   ,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?,zqzjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjje);
	ps.setDouble(2,xcmje);
	ps.setDouble(3,cpjjje);
	ps.setDouble(4,htze);

	ps.setDouble(5,zqjjje);
	ps.setDouble(6,zqxcmje);
	ps.setDouble(7,zqcpjjje);
	ps.setDouble(8,wdzje);

	ps.setDouble(9,jjje);
	ps.setDouble(10,xcmje);
	ps.setDouble(11,cpjjje);
	ps.setDouble(12,htze);

	ps.setDouble(13,zqjjje);
	ps.setDouble(14,zqxcmje);
	ps.setDouble(15,zqcpjjje);
	ps.setDouble(16,wdzje);

	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htze);
	ps.executeUpdate();
	ps.close();

	//计算金额总计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
	out.print("Exception: " + e);
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