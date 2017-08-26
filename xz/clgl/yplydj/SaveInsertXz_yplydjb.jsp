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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long xh=0;
	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  xz_yplydjb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	ls_sql="insert into xz_yplydjb ( xh,qcph,ybh,lysl,cllcs,lyrq,lyr,ssfgs,lrr,lrsj,bz,dj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,qcph);
	ps.setString(3,ybh);
	ps.setDouble(4,lysl);
	ps.setDouble(5,cllcs);
	ps.setDate(6,lyrq);
	ps.setString(7,lyr);
	ps.setString(8,ssfgs);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,bz);
	ps.setDouble(12,dj);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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