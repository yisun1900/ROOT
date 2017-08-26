<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tzlx=null;
java.sql.Date tzsjd=null;
long tzts=0;
String gqtzyybm=null;
String tzyysm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
tzlx=cf.GB2Uni(request.getParameter("tzlx"));
ls=request.getParameter("tzsjd");
try{
	if (!(ls.equals("")))  tzsjd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzsjd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调整时间点]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tzts");
try{
	if (!(ls.equals("")))  tzts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调整天数]类型转换发生意外:"+e);
	return;
}
gqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
tzyysm=cf.GB2Uni(request.getParameter("tzyysm"));
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
String djjlh=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_gqtzjl set tzlx=?,tzsjd=?,tzts=?,gqtzyybm=?,tzyysm=?,lrr=?,lrsj=?,lrdw=? ";
	ls_sql+=" where  (djjlh='"+djjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzlx);
	ps.setDate(2,tzsjd);
	ps.setLong(3,tzts);
	ps.setString(4,gqtzyybm);
	ps.setString(5,tzyysm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrdw);
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