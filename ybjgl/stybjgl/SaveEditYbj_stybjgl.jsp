<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ybjbh=null;
double mj=0;
String fgms=null;
double zxzj=0;
String lx=null;
String clzt=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
ybjbh=cf.GB2Uni(request.getParameter("ybjbh"));
ls=request.getParameter("mj");
try{
	if (!(ls.equals("")))  mj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积]类型转换发生意外:"+e);
	return;
}
fgms=cf.GB2Uni(request.getParameter("fgms"));
ls=request.getParameter("zxzj");
try{
	if (!(ls.equals("")))  zxzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxzj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[装修造价]类型转换发生意外:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
clzt=cf.GB2Uni(request.getParameter("clzt"));
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String whereybjbh=null;
whereybjbh=cf.GB2Uni(request.getParameter("whereybjbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update ybj_stybjgl set ybjbh=?,mj=?,fgms=?,zxzj=?,lx=?,clzt=?,lrr=?,lrsj=?,lrbm=?,ssfgs=?,bz=? ";
	ls_sql+=" where  (ybjbh='"+whereybjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ybjbh);
	ps.setDouble(2,mj);
	ps.setString(3,fgms);
	ps.setDouble(4,zxzj);
	ps.setString(5,lx);
	ps.setString(6,clzt);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,ssfgs);
	ps.setString(11,bz);
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