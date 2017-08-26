<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
String hflx=null;
long khsksd=0;
long khsjzd=0;
double hfbl=0;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
hflx=cf.GB2Uni(request.getParameter("hflx"));
ls=request.getParameter("khsksd");
try{
	if (!(ls.equals("")))  khsksd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsksd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户数开始点]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khsjzd");
try{
	if (!(ls.equals("")))  khsjzd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsjzd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户数截至点]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hfbl");
try{
	if (!(ls.equals("")))  hfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访比例]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into hf_hfblsz ( ssfgs,hflx,khsksd,khsjzd,hfbl ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,hflx);
	ps.setLong(3,khsksd);
	ps.setLong(4,khsjzd);
	ps.setDouble(5,hfbl);
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