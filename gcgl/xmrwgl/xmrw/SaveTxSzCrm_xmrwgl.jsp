<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfxtx=cf.GB2Uni(request.getParameter("sfxtx"));
String txnr=cf.GB2Uni(request.getParameter("txnr"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));


java.sql.Date txrq=null;
ls=request.getParameter("txrq");
try{
	if (!(ls.equals("")))  txrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[txrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提醒日期]类型转换发生意外:"+e);
	return;
}

int txxs=0;
ls=request.getParameter("txxs");
try{
	if (!(ls.equals("")))  txxs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[txxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提醒小时]类型转换发生意外:"+e);
	return;
}

String wherekhbh=null;
String whererwbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
whererwbm=cf.GB2Uni(request.getParameter("whererwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_xmrwgl set sfxtx=?,txrq=?,txxs=?,txnr=?,bjjbbm=?  ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxtx);
	ps.setDate(2,txrq);
	ps.setInt(3,txxs);
	ps.setString(4,txnr);
	ps.setString(5,bjjbbm);
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