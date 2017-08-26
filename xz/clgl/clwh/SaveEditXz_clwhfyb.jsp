<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djxh=null;
String qcph=null;
String xm=null;
double fy=0;
java.sql.Date djrq=null;
String jsr=null;
String pzr=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
djxh=cf.GB2Uni(request.getParameter("djxh"));
qcph=cf.GB2Uni(request.getParameter("qcph"));
xm=cf.GB2Uni(request.getParameter("xm"));
ls=request.getParameter("fy");
try{
	if (!(ls.equals("")))  fy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djrq");
try{
	if (!(ls.equals("")))  djrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[费用发生日期]类型转换发生意外:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
pzr=cf.GB2Uni(request.getParameter("pzr"));
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
String fyfsbm=cf.GB2Uni(request.getParameter("fyfsbm"));

String wheredjxh=null;
wheredjxh=cf.GB2Uni(request.getParameter("wheredjxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_clwhfyb set qcph=?,xm=?,fy=?,djrq=?,jsr=?,pzr=?,bz=?,ssfgs=?,lrr=?,lrsj=?,fyfsbm=? ";
	ls_sql+=" where  (djxh='"+wheredjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qcph);
	ps.setString(2,xm);
	ps.setDouble(3,fy);
	ps.setDate(4,djrq);
	ps.setString(5,jsr);
	ps.setString(6,pzr);
	ps.setString(7,bz);
	ps.setString(8,ssfgs);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,fyfsbm);
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