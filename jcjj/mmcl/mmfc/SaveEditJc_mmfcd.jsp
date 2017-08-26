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
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String dczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
String sfsmjcc=cf.GB2Uni(request.getParameter("sfsmjcc"));
String sfydc=cf.GB2Uni(request.getParameter("sfydc"));
String dsk=cf.GB2Uni(request.getParameter("dsk"));
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	
	ls_sql="update jc_mmfcd set qh=?,mdk=?,mdg=?,tjx=?,dbh=?";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,qh);
	ps.setLong(2,mdk);
	ps.setLong(3,mdg);
	ps.setDouble(4,tjx);
	ps.setLong(5,dbh);
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
		parent.window.close();
		//-->
		</SCRIPT>
		<%
	}

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