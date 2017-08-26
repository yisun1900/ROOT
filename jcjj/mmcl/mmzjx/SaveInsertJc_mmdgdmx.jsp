<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String zjxxh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
long sl=0;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
long dbh=0;
long qh=0;
long mdk=0;
long mdg=0;
double tjx=0;
String ctbs=null;
double dj=0;
String blxhbm=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
mlx=cf.GB2Uni(request.getParameter("mlx"));
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));
azwzbm=cf.GB2Uni(request.getParameter("azwzbm"));
kqfxbm=cf.GB2Uni(request.getParameter("kqfxbm"));
ls=request.getParameter("dbh");
try{
	if (!(ls.equals("")))  dbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地板厚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qh");
try{
	if (!(ls.equals("")))  qh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[墙厚]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mdk");
try{
	if (!(ls.equals("")))  mdk=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mdk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门洞宽]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mdg");
try{
	if (!(ls.equals("")))  mdg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mdg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门洞高]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tjx");
try{
	if (!(ls.equals("")))  tjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjx不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[踢脚线]类型转换发生意外:"+e);
	return;
}
ctbs=cf.GB2Uni(request.getParameter("ctbs"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String dczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
String sfsmjcc=cf.GB2Uni(request.getParameter("sfsmjcc"));
String sfydc=cf.GB2Uni(request.getParameter("sfydc"));
String dsk=cf.GB2Uni(request.getParameter("dsk"));
String mtxbm=cf.GB2Uni(request.getParameter("mtxbm"));
String mxxbm=cf.GB2Uni(request.getParameter("mxxbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int xh=0;
double mmzjxje=0;
double zjxze=0;

try {
	conn=cf.getConnection();

	String clzt=null;
	String dqbm=null;
	double mmzkl=10;
	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql="select jc_mmzjx.clzt,jc_mmzjx.mmzkl,sq_dwxx.dqbm,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmzjx,sq_dwxx";
	ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		dqbm=rs.getString("dqbm");
		mmzkl=rs.getDouble("mmzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

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

	String blxh=null;
	String bllxbm=null;
	String blytbm=null;
	ls_sql="select blxh,bllxbm,blytbm";
	ls_sql+=" from  jc_blbj";
	ls_sql+=" where blxhbm='"+blxhbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blxh=rs.getString("blxh");
		bllxbm=rs.getString("bllxbm");
		blytbm=rs.getString("blytbm");
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  jc_mmdgdmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into jc_mmdgdmx ( xh,yddbh,mmdglxbm,mlx,mmxh,sl,zjhsl,ysbm,czbm,azwzbm   ,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,bzdj,dj,blxhbm   ,lx,bz,dczlbm,sfsmjcc,sfydc,dsk,sfzdjj,mtxbm,mxxbm,blxh ) ";
	ls_sql+=" values ( ?,?,?,?,?,0,?,?,?,?   ,?,?,?,?,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?   ,'2',?,?,?,?,?,'1',?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,yddbh);
	ps.setString(3,mmdglxbm);
	ps.setString(4,mlx);
	ps.setString(5,mmxh);
	ps.setLong(6,sl);
	ps.setString(7,ysbm);
	ps.setString(8,czbm);
	ps.setString(9,azwzbm);

	ps.setString(10,kqfxbm);
	ps.setLong(11,dbh);
	ps.setLong(12,qh);
	ps.setLong(13,mdk);
	ps.setLong(14,mdg);
	ps.setString(15,ctbs);
	ps.setDouble(16,tjx);
	ps.setDouble(17,dj);
	ps.setDouble(18,dj*mmzkl/10);
	ps.setString(19,blxhbm);

	ps.setString(20,bz);
	ps.setString(21,dczlbm);
	ps.setString(22,sfsmjcc);
	ps.setString(23,sfydc);
	ps.setString(24,dsk);
	ps.setString(25,mtxbm);
	ps.setString(26,mxxbm);
	ps.setString(27,blxh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_mmzjxmx ( xh,yddbh,zjxxh,lx,ysl,xsl) ";
	ls_sql+=" values ( ?,?,?,'2',0,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,yddbh);
	ps.setString(3,zjxxh);
	ps.setLong(4,sl);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.close();
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