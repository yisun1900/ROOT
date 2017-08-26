<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date kssj=null;
java.sql.Date jzsj=null;
String jyjg=null;
String jysm=null;
ls=request.getParameter("kssj");
try{
	if (!(ls.equals("")))  kssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[截至时间]类型转换发生意外:"+e);
	return;
}
jyjg=cf.GB2Uni(request.getParameter("jyjg"));
jysm=cf.GB2Uni(request.getParameter("jysm"));
String whereygbh=null;
String wherekssj=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
wherekssj=cf.GB2Uni(request.getParameter("wherekssj"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_jyjl set kssj=?,jzsj=?,jyjg=?,jysm=? ";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (kssj=TO_DATE('"+wherekssj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kssj);
	ps.setDate(2,jzsj);
	ps.setString(3,jyjg);
	ps.setString(4,jysm);
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