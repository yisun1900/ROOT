<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String rwbm=request.getParameter("rwbm");

String ls=null;
java.sql.Date sjkssj=null;
ls=request.getParameter("sjkssj");
try{
	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date sjjssj=null;
ls=request.getParameter("sjjssj");
try{
	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjjssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际结束时间]类型转换发生意外:"+e);
	return;
}
double sjgzr=0;
ls=request.getParameter("sjgzr");
try{
	if (!(ls.equals("")))  sjgzr=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjgzr]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际工作日]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khsgjhb set rwsfwc='Y',sjkssj=?,sjjssj=?,sjgzr=?,sfyq='N'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjkssj);
	ps.setDate(2,sjjssj);
	ps.setDouble(3,sjgzr);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khsgjhb set sfyq='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ls_sql+=" and zxjhjssj<sjjssj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>