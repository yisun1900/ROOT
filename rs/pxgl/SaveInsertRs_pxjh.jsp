<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long pxrs=0;
double pxfy=0;
String fgs=null;
String ztbm=null;	
//String pxlx=null;
String sfjhn=null;

//java.sql.Date jhkssj=null;
//java.sql.Date jhjssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
//ls=request.getParameter("pxrs");
//try{
//	if (!(ls.equals("")))  pxrs=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量pxrs不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[招聘人数]类型转换发生意外:"+e);
//	return;
//}
//ls=request.getParameter("pxfy");
//try{
//	if (!(ls.equals("")))  pxfy=Double.parseDouble(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量pxfy不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[招聘费用]类型转换发生意外:"+e);
//	return;
//}
String pxjhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));//录入人分公司
fgs=cf.GB2Uni(request.getParameter("fgs"));//选择的招聘单位
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
//pxlx=cf.GB2Uni(request.getParameter("pxlx"));
sfjhn=cf.GB2Uni(request.getParameter("sfjhn"));

//ls=request.getParameter("jhkssj");
//try{
//	if (!(ls.equals("")))  jhkssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量jhkssj不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[计划开始时间]类型转换发生意外:"+e);
//	return;
//}
//ls=request.getParameter("jhjssj");
//try{
//	if (!(ls.equals("")))  jhjssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量jhjssj不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[计划结束时间]类型转换发生意外:"+e);
//	return;
//}
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
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_pxjh ( pxjhmc,fgs,ztbm,lrr,lrsj,bz,pxjhbh,jhzt,shjl,ssfgs,sfjhn,pxrs,pxfy ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'0','x',?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pxjhmc);
	ps.setString(2,fgs);
	ps.setString(3,ztbm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setString(7,pxjhbh);
	ps.setString(8,ssfgs);
	ps.setString(9,sfjhn);
	ps.setLong(10,pxrs);
	ps.setDouble(11,pxfy);

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