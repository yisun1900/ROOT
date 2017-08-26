<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dxpjzbbm=null;
String dxpjzb=null;
String hfdxbm=null;
long xh=0;
dxpjzbbm=cf.GB2Uni(request.getParameter("dxpjzbbm"));
dxpjzb=cf.GB2Uni(request.getParameter("dxpjzb"));
hfdxbm=cf.GB2Uni(request.getParameter("hfdxbm"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
String wheredxpjzbbm=null;
wheredxpjzbbm=cf.GB2Uni(request.getParameter("wheredxpjzbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update hdm_dxpjzb set dxpjzbbm=?,dxpjzb=?,hfdxbm=?,xh=? ";
	ls_sql+=" where  (dxpjzbbm='"+wheredxpjzbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dxpjzbbm);
	ps.setString(2,dxpjzb);
	ps.setString(3,hfdxbm);
	ps.setLong(4,xh);
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