<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
String fgsbh=null;
java.sql.Date khqssj=null;
java.sql.Date khjzsj=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("khqssj");
try{
	if (!(ls.equals("")))  khqssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khqssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核起始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjzsj");
try{
	if (!(ls.equals("")))  khjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核截至时间]类型转换发生意外:"+e);
	return;
}
double qqts=0;
ls=request.getParameter("qqts");
try{
	if (!(ls.equals("")))  qqts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qqts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[全勤天数]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_jrkhzq ( khzq,fgsbh,khqssj,khjzsj,qqts,sfkh ) ";
	ls_sql+=" values ( ?,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,fgsbh);
	ps.setDate(3,khqssj);
	ps.setDate(4,khjzsj);
	ps.setDouble(5,qqts);
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