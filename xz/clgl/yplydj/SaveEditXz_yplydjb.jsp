<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qcph=null;
String ybh=null;
double dj=0;
double lysl=0;
double cllcs=0;
java.sql.Date lyrq=null;
String lyr=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
qcph=cf.GB2Uni(request.getParameter("qcph"));
ybh=cf.GB2Uni(request.getParameter("ybh"));
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
ls=request.getParameter("lysl");
try{
	if (!(ls.equals("")))  lysl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lysl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加油数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cllcs");
try{
	if (!(ls.equals("")))  cllcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cllcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[车辆里程数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lyrq");
try{
	if (!(ls.equals("")))  lyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[加油日期]类型转换发生意外:"+e);
	return;
}
lyr=cf.GB2Uni(request.getParameter("lyr"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
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
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update xz_yplydjb set qcph=?,ybh=?,lysl=?,cllcs=?,lyrq=?,lyr=?,ssfgs=?,lrr=?,lrsj=?,bz=?,dj=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qcph);
	ps.setString(2,ybh);
	ps.setDouble(3,lysl);
	ps.setDouble(4,cllcs);
	ps.setDate(5,lyrq);
	ps.setString(6,lyr);
	ps.setString(7,ssfgs);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,bz);
	ps.setDouble(11,dj);
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
	out.print("Exception: " + e);
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