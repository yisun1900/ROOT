<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgr=null;
java.sql.Date bgqssj=null;
java.sql.Date bgjzsj=null;
String qksm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
bgr=cf.GB2Uni(request.getParameter("bgr"));
ls=request.getParameter("bgqssj");
try{
	if (!(ls.equals("")))  bgqssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bgqssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[报告起始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bgjzsj");
try{
	if (!(ls.equals("")))  bgjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bgjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[报告截至时间]类型转换发生意外:"+e);
	return;
}
qksm=cf.GB2Uni(request.getParameter("qksm"));
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
String wheredjbh=null;
wheredjbh=cf.GB2Uni(request.getParameter("wheredjbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_gjzb set bgr=?,bgqssj=?,bgjzsj=?,qksm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (djbh='"+wheredjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgr);
	ps.setDate(2,bgqssj);
	ps.setDate(3,bgjzsj);
	ps.setString(4,qksm);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
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