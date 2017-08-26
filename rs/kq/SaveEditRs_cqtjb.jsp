<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String nian=null;
String yue=null;
long ygbh=0;
String bianhao=null;
String yhmc=null;
String dwbh=null;
long qqts=0;
long cqts=0;
String bz=null;
nian=cf.GB2Uni(request.getParameter("nian"));
yue=cf.GB2Uni(request.getParameter("yue"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("qqts");
try{
	if (!(ls.equals("")))  qqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qqts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[全勤天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cqts");
try{
	if (!(ls.equals("")))  cqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cqts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出勤天数]类型转换发生意外:"+e);
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
	ls_sql="update rs_cqtjb set nian=?,yue=?,qqts=?,cqts=?,bz=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,nian);
	ps.setString(2,yue);
	ps.setLong(3,qqts);
	ps.setLong(4,cqts);
	ps.setString(5,bz);
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