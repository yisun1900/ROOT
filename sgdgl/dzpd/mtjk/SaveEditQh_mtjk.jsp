<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jkbbh=null;
String bjkgsbh=null;
String xxlybm=null;
java.sql.Date bcsj=null;
String gggs=null;
double yjjg=0;
String bz=null;
String dwbh=null;
jkbbh=cf.GB2Uni(request.getParameter("jkbbh"));
bjkgsbh=cf.GB2Uni(request.getParameter("bjkgsbh"));
xxlybm=cf.GB2Uni(request.getParameter("xxlybm"));
ls=request.getParameter("bcsj");
try{
	if (!(ls.equals("")))  bcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[播出时间]类型转换发生意外:"+e);
	return;
}
gggs=cf.GB2Uni(request.getParameter("gggs"));
ls=request.getParameter("yjjg");
try{
	if (!(ls.equals("")))  yjjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计价格]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherejkbbh=null;
wherejkbbh=cf.GB2Uni(request.getParameter("wherejkbbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_mtjk set jkbbh=?,bjkgsbh=?,xxlybm=?,bcsj=?,gggs=?,yjjg=?,bz=?,dwbh=? ";
	ls_sql+=" where  (jkbbh='"+wherejkbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jkbbh);
	ps.setString(2,bjkgsbh);
	ps.setString(3,xxlybm);
	ps.setDate(4,bcsj);
	ps.setString(5,gggs);
	ps.setDouble(6,yjjg);
	ps.setString(7,bz);
	ps.setString(8,dwbh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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