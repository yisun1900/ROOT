<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clflbm=null;
String clbm=null;
String clmc=null;
String pp=null;
String gg=null;
String jldwbm=null;
double sl=0;
String bz=null;
clflbm=cf.GB2Uni(request.getParameter("clflbm"));
clbm=cf.GB2Uni(request.getParameter("clbm"));
clmc=cf.GB2Uni(request.getParameter("clmc"));
pp=cf.GB2Uni(request.getParameter("pp"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
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
	ls_sql="update crm_cljcmx set clflbm=?,clbm=?,clmc=?,pp=?,gg=?,jldwbm=?,sl=?,bz=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clflbm);
	ps.setString(2,clbm);
	ps.setString(3,clmc);
	ps.setString(4,pp);
	ps.setString(5,gg);
	ps.setString(6,jldwbm);
	ps.setDouble(7,sl);
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