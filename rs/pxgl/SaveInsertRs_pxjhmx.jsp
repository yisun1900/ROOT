<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String skxs=null;
String kclx=null;
String pxkc=null;
String kcnr=null;
String pxlx=null;
String pxcd=null;
long pxrs=0;
double pxfy=0;
long ypxrs=0;
double ypxfy=0;

String pxjs=null;
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date pxkssj=null;
java.sql.Date pxjssj=null;
long gcrs=0;
long zcrs=0;
long jcrs=0;

String bz=null;
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String pxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
skxs=cf.GB2Uni(request.getParameter("skxs"));
kclx=cf.GB2Uni(request.getParameter("kclx"));
pxkc=cf.GB2Uni(request.getParameter("pxkc"));
kcnr=cf.GB2Uni(request.getParameter("kcnr"));
pxcd=cf.GB2Uni(request.getParameter("pxcd"));
pxlx=cf.GB2Uni(request.getParameter("pxlx"));

ls=request.getParameter("pxrs");
try{
	if (!(ls.equals("")))  pxrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gcrs");
try{
	if (!(ls.equals("")))  gcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高层人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zcrs");
try{
	if (!(ls.equals("")))  zcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[中层人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jcrs");
try{
	if (!(ls.equals("")))  jcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基层人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pxfy");
try{
	if (!(ls.equals("")))  pxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训费用]类型转换发生意外:"+e);
	return;
}
pxjs=cf.GB2Uni(request.getParameter("pxjs"));
ls=request.getParameter("pxkssj");
try{
	if (!(ls.equals("")))  pxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pxjssj");
try{
	if (!(ls.equals("")))  pxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训结束时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	ls_sql=" SELECT pxrs,pxfy ";
	ls_sql+=" FROM rs_pxjh ";
	ls_sql+=" where  (pxjhbh="+pxjhbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ypxrs=rs.getLong(1);
		ypxfy=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	conn.setAutoCommit(false);

	ls_sql="insert into rs_pxjhmx ( skxs,kclx,pxkc,kcnr,pxcd,pxrs,pxfy,pxjs,lrr,lrsj,bz,pxjhbh,pxmxbh,pxlx,gcrs,zcrs,jcrs,pxkssj,pxjssj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,skxs);
	ps.setString(2,kclx);
	ps.setString(3,pxkc);
	ps.setString(4,kcnr);
	ps.setString(5,pxcd);
	ps.setLong(6,pxrs);
	ps.setDouble(7,pxfy);
	ps.setString(8,pxjs);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,bz);
	ps.setString(12,pxjhbh);
	ps.setString(13,pxmxbh);
	ps.setString(14,pxlx);
	ps.setLong(15,gcrs);
	ps.setLong(16,zcrs);
	ps.setLong(17,jcrs);
	ps.setDate(18,pxkssj);
	ps.setDate(19,pxjssj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_pxjh set pxrs=?,pxfy=? ";
	ls_sql+=" where  (pxjhbh="+pxjhbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pxrs+ypxrs);
	ps.setDouble(2,pxfy+ypxfy);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功!");
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>