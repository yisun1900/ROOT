<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fysqbh=null;
String fgs=null;
java.sql.Date sqsj=null;
String xqlx=null;
String ytxs=null;
double fy=0;
String bz=null;
fysqbh=cf.GB2Uni(request.getParameter("fysqbh"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请时间]类型转换发生意外:"+e);
	return;
}
xqlx=cf.GB2Uni(request.getParameter("xqlx"));
ytxs=cf.GB2Uni(request.getParameter("ytxs"));
ls=request.getParameter("fy");
try{
	if (!(ls.equals("")))  fy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[费用]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherefysqbh=null;
wherefysqbh=cf.GB2Uni(request.getParameter("wherefysqbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_fysq set fysqbh=?,fgs=?,sqsj=?,xqlx=?,ytxs=?,fy=?,bz=? ";
	ls_sql+=" where  (fysqbh='"+wherefysqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fysqbh);
	ps.setString(2,fgs);
	ps.setDate(3,sqsj);
	ps.setString(4,xqlx);
	ps.setString(5,ytxs);
	ps.setDouble(6,fy);
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