<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String dwbh=null;
String ssfgs=null;
java.sql.Date rzsj=null;
String lx=null;
String jfsy=null;
String jflxbm=null;
double jfje=0;
java.sql.Date jfrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职日期]类型转换发生意外:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
jfsy=cf.GB2Uni(request.getParameter("jfsy"));
jflxbm=cf.GB2Uni(request.getParameter("jflxbm"));
ls=request.getParameter("jfje");
try{
	if (!(ls.equals("")))  jfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖罚金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jfrq");
try{
	if (!(ls.equals("")))  jfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖罚日期]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String jfjlh=null;
jfjlh=cf.GB2Uni(request.getParameter("jfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_jfjl set lx=?,jfsy=?,jflxbm=?,jfje=?,jfrq=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (jfjlh="+jfjlh+") and zt='1' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lx);
	ps.setString(2,jfsy);
	ps.setString(3,jflxbm);
	ps.setDouble(4,jfje);
	ps.setDate(5,jfrq);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>