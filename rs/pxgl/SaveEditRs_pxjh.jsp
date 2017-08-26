<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
//long pxrs=0;
//double pxfy=0;
String fgs=null;
String pxjhmc=null;
String sfjhn=null;

//java.sql.Date jhkssj=null;
//java.sql.Date jhjssj=null;
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
fgs=cf.GB2Uni(request.getParameter("fgs"));
pxjhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepxjhbh=null;
wherepxjhbh=cf.GB2Uni(request.getParameter("wherepxjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_pxjh set fgs=?,bz=?,pxjhmc=?,sfjhn=? ";
	ls_sql+=" where  (pxjhbh='"+wherepxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgs);
	ps.setString(2,bz);
	ps.setString(3,pxjhmc);
	ps.setString(4,sfjhn);

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