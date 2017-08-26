<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String sfyx=cf.GB2Uni(request.getParameter("sfyx"));
java.sql.Date yxkssj=null;
ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date yxjzsj=null;
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效结束时间]类型转换发生意外:"+e);
	return;
}

String[] cpbm = request.getParameterValues("cpbm");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<cpbm.length ;i++ )
	{
		ls_sql="update bj_tcwzck set sfyx=?,yxkssj=?,yxjzsj=? ";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfyx);
		ps.setDate(2,yxkssj);
		ps.setDate(3,yxjzsj);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

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
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>