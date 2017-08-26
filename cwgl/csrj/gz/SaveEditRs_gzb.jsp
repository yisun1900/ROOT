<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
String ssfgs=null;
java.sql.Date fxrq=null;
java.sql.Date ksrq=null;
java.sql.Date zzrq=null;
double qqts=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("fxrq");
try{
	if (!(ls.equals("")))  fxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fxrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发薪日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ksrq");
try{
	if (!(ls.equals("")))  ksrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ksrq]不存在");
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
	out.println("<BR>变量[zzrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工资终止日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qqts");
try{
	if (!(ls.equals("")))  qqts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qqts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[全勤天数]类型转换发生意外:"+e);
	return;
}
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekhzq=null;
String wheressfgs=null;
wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_gzb set khzq=?,ssfgs=?,fxrq=?,ksrq=?,zzrq=?,qqts=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,ssfgs);
	ps.setDate(3,fxrq);
	ps.setDate(4,ksrq);
	ps.setDate(5,zzrq);
	ps.setDouble(6,qqts);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
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