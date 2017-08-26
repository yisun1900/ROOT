<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date fxrq=null;
String ssfgs=null;
java.sql.Date ksrq=null;
java.sql.Date zzrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("fxrq");
try{
	if (!(ls.equals("")))  fxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fxrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发薪日期]类型转换发生意外:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("ksrq");
try{
	if (!(ls.equals("")))  ksrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工资开始日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzrq");
try{
	if (!(ls.equals("")))  zzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工资终止日期]类型转换发生意外:"+e);
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
String xh=null;
xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_yggzjl set fxrq=?,ssfgs=?,ksrq=?,zzrq=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (xh='"+xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fxrq);
	ps.setString(2,ssfgs);
	ps.setDate(3,ksrq);
	ps.setDate(4,zzrq);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
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