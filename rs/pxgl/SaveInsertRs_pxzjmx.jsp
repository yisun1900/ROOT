<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pxmxbh=null;
String pxjhbh=null;
String skxs=null;
String kclx=null;
String pxkc=null;
String kcnr=null;
String pxcd=null;
long pxrs=0;
double pxfy=0;
long gcrs=0;
long zcrs=0;
long jcrs=0;
long sjpxrs=0;
double sjpxfy=0;

String pxjs=null;
String pxjg=null;
java.sql.Date pxkssj=null;
java.sql.Date pxjssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
pxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
skxs=cf.GB2Uni(request.getParameter("skxs"));
kclx=cf.GB2Uni(request.getParameter("kclx"));
pxkc=cf.GB2Uni(request.getParameter("pxkc"));
kcnr=cf.GB2Uni(request.getParameter("kcnr"));
pxcd=cf.GB2Uni(request.getParameter("pxcd"));
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
pxjs=cf.GB2Uni(request.getParameter("pxjs"));
pxjg=cf.GB2Uni(request.getParameter("pxjg"));
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

	ls_sql=" SELECT sjpxrs,sjpxfy ";
	ls_sql+=" FROM rs_pxjhjg ";
	ls_sql+=" where  (pxjhbh="+pxjhbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjpxrs=rs.getLong(1);
		sjpxfy=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into rs_pxzjmx ( pxmxbh,pxjhbh,skxs,kclx,pxkc,kcnr,pxcd,pxrs,pxfy,gcrs,zcrs,jcrs,pxjs,pxjg,pxkssj,pxjssj,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pxmxbh);
	ps.setString(2,pxjhbh);
	ps.setString(3,skxs);
	ps.setString(4,kclx);
	ps.setString(5,pxkc);
	ps.setString(6,kcnr);
	ps.setString(7,pxcd);
	ps.setLong(8,pxrs);
	ps.setDouble(9,pxfy);
	ps.setLong(10,gcrs);
	ps.setLong(11,zcrs);
	ps.setLong(12,jcrs);
	ps.setString(13,pxjs);
	ps.setString(14,pxjg);
	ps.setDate(15,pxkssj);
	ps.setDate(16,pxjssj);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_pxjhjg set sjpxrs=?,sjpxfy=? ";
	ls_sql+=" where  (pxjhbh="+pxjhbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pxrs+sjpxrs);
	ps.setDouble(2,pxfy+sjpxfy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_pxjhmx set mxwc=? ";
	ls_sql+=" where  (pxmxbh="+pxmxbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pxjg);
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
	out.print("存盘失败,发生意外: " + e+ls_sql);
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