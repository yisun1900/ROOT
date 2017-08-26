<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpr=null;
java.sql.Date kpsj=null;
String kplx=null;
String bz=null;
kpr=cf.GB2Uni(request.getParameter("kpr"));
ls=request.getParameter("kpsj");
try{
	if (!(ls.equals("")))  kpsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kpsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评时间]类型转换发生意外:"+e);
	return;
}
kplx=cf.GB2Uni(request.getParameter("kplx"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekpxh=null;
wherekpxh=cf.GB2Uni(request.getParameter("wherekpxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_gczljcb set kpr=?,kpsj=?,kplx=?,bz=? ";
	ls_sql+=" where  (kpxh='"+wherekpxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpr);
	ps.setDate(2,kpsj);
	ps.setString(3,kplx);
	ps.setString(4,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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