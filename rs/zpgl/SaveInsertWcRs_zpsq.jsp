<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sjzprs=0;
double sjzpfy=0;
java.sql.Date sjkssj=null;
java.sql.Date sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
java.sql.Date zpjglsj=null;
ls=request.getParameter("sjzprs");
try{
	if (!(ls.equals("")))  sjzprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjzprs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际招聘人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzpfy");
try{
	if (!(ls.equals("")))  sjzpfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjzpfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际招聘费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjkssj");
try{
	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际招聘开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjjssj");
try{
	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际招聘结束时间]类型转换发生意外:"+e);
	return;
}
sjzpsj=cf.GB2Uni(request.getParameter("sjzpsj"));
zpjglrr=cf.GB2Uni(request.getParameter("zpjglrr"));
ls=request.getParameter("zpjglsj");
try{
	if (!(ls.equals("")))  zpjglsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zpjglsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[招聘结果录入时间]类型转换发生意外:"+e);
	return;
}
String wherezpsqbh=null;
wherezpsqbh=cf.GB2Uni(request.getParameter("wherezpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_zpsq set sjzprs=?,sjzpfy=?,sjkssj=?,sjjssj=?,sjzpsj=?,zpjglrr=?,zpjglsj=?,sqzt='05' ";
	ls_sql+=" where  (zpsqbh='"+wherezpsqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sjzprs);
	ps.setDouble(2,sjzpfy);
	ps.setDate(3,sjkssj);
	ps.setDate(4,sjjssj);
	ps.setString(5,sjzpsj);
	ps.setString(6,zpjglrr);
	ps.setDate(7,zpjglsj);
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