<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
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
String ctbs=null;
double tjx=0;
double dj=0;
String blxhbm=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
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
ctbs=cf.GB2Uni(request.getParameter("ctbs"));
ls=request.getParameter("tjx");
try{
	if (!(ls.equals("")))  tjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjx不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[踢脚线或平台上口]类型转换发生意外:"+e);
	return;
}
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

long msk=0;
long msg=0;
ls=request.getParameter("msk");
try{
	if (!(ls.equals("")))  msk=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量msk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门扇宽]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("msg");
try{
	if (!(ls.equals("")))  msg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量msg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[门扇高]类型转换发生意外:"+e);
	return;
}

String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.qddm=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();

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

	
	ls_sql="update jc_mmccd set yddbh=?,mmdglxbm=?,mlx=?,mmxh=?,sl=?,ysbm=?,czbm=?,azwzbm=?,kqfxbm=?,dbh=?,qh=?,mdk=?,mdg=?,msk=?,msg=?,ctbs=?,tjx=?,dj=?,blxhbm=?,bz=?,dczlbm=?,sfsmjcc=?,sfydc=?,dsk=?,mtxbm=?,mxxbm=?,blxh=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,mmdglxbm);
	ps.setString(3,mlx);
	ps.setString(4,mmxh);
	ps.setLong(5,sl);
	ps.setString(6,ysbm);
	ps.setString(7,czbm);
	ps.setString(8,azwzbm);
	ps.setString(9,kqfxbm);
	ps.setLong(10,dbh);
	ps.setLong(11,qh);
	ps.setLong(12,mdk);
	ps.setLong(13,mdg);
	ps.setLong(14,msk);
	ps.setLong(15,msg);
	ps.setString(16,ctbs);
	ps.setDouble(17,tjx);
	ps.setDouble(18,dj);
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

	

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
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