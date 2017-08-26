<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zpzw=null;
long zprs=0;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
zpzw=cf.GB2Uni(request.getParameter("zpzw"));
ls=request.getParameter("zprs");
try{
	if (!(ls.equals("")))  zprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zprs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[招聘人数]类型转换发生意外:"+e);
	return;
}
String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
String zpmxbh=cf.GB2Uni(request.getParameter("zpmxbh"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_zpjhmx ( zpmxbh,zpjhbh,zpzw,zprs,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zpmxbh);
	ps.setString(2,zpjhbh);
	ps.setString(3,zpzw);
	ps.setLong(4,zprs);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,bz);
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