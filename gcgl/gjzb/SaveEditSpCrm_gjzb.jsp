<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sybz=null;
String syr=null;
java.sql.Date sysj=null;
String sysm=null;
sybz=cf.GB2Uni(request.getParameter("sybz"));
syr=cf.GB2Uni(request.getParameter("syr"));
ls=request.getParameter("sysj");
try{
	if (!(ls.equals("")))  sysj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sysj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审阅时间]类型转换发生意外:"+e);
	return;
}
sysm=cf.GB2Uni(request.getParameter("sysm"));

String wheredjbh=null;
wheredjbh=cf.GB2Uni(request.getParameter("wheredjbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_gjzb set sybz=?,syr=?,sysj=?,sysm=? ";
	ls_sql+=" where  (djbh='"+wheredjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sybz);
	ps.setString(2,syr);
	ps.setDate(3,sysj);
	ps.setString(4,sysm);
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