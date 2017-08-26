<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lbxmbm=null;
String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
double zqdj=0;
double dj=0;
double sjzj=0;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
lbxmbm=cf.GB2Uni(request.getParameter("lbxmbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
lbmc=cf.GB2Uni(request.getParameter("lbmc"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zqdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级折价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
String lx=cf.GB2Uni(request.getParameter("lx"));

String wherelbxmbm=null;
wherelbxmbm=cf.GB2Uni(request.getParameter("wherelbxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tc_yhlbmx set lbxmbm=?,dqbm=?,bjjbbm=?,lbmc=?,xmmc=?,ppmc=?,xh=?,jldw=?,dj=?,sjzj=?,bz=?,lrr=?,lrsj=?,sl=?,lx=?  ";
	ls_sql+="where (lbxmbm='"+wherelbxmbm+"') ";
	ps= conn.prepareStatement(ls_sql);
    ps.setString(1,lbxmbm);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,lbmc);
	ps.setString(5,xmmc);
	ps.setString(6,ppmc);
	ps.setString(7,xh);
	ps.setString(8,jldw);
	ps.setDouble(9,dj);
	ps.setDouble(10,sjzj);
	ps.setString(11,bz);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setDouble(14,sl);
	ps.setString(15,lx);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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