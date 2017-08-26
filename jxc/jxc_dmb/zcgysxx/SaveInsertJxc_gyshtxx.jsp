<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String htbh=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
java.sql.Date kssj=null;
java.sql.Date jssj=null;
String bz=null;
htbh=cf.GB2Uni(request.getParameter("htbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
gysdz=cf.GB2Uni(request.getParameter("gysdz"));
gysfzr=cf.GB2Uni(request.getParameter("gysfzr"));
gysdh=cf.GB2Uni(request.getParameter("gysdh"));
gyscz=cf.GB2Uni(request.getParameter("gyscz"));
ls=request.getParameter("kssj");
try{
	if (!(ls.equals("")))  kssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同结束时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jxc_gyshtxx ( htbh,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,kssj,jssj,bz,lrbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htbh);
	ps.setString(2,dqbm);
	ps.setString(3,gysmc);
	ps.setString(4,gysdz);
	ps.setString(5,gysfzr);
	ps.setString(6,gysdh);
	ps.setString(7,gyscz);
	ps.setDate(8,kssj);
	ps.setDate(9,jssj);
	ps.setString(10,bz);
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