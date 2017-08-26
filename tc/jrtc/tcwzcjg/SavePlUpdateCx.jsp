<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String sfycx=null;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

sfycx=request.getParameter("sfycx");
ls=request.getParameter("cxj");
try{
	if (!(ls.equals("")))  cxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjssj");
try{
	if (!(ls.equals("")))  cxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}

double cxjsj=0;
ls=request.getParameter("cxjsj");
try{
	if (!(ls.equals("")))  cxjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cxjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结算价]类型转换发生意外:"+e);
	return;
}
double cxjsbl=0;
ls=request.getParameter("cxjsbl");
try{
	if (!(ls.equals("")))  cxjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cxjsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结算比例]类型转换发生意外:"+e);
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
		ls_sql="update bj_tcwzck set sfycx=?,cxkssj=?,cxjssj=?,cxj=?,cxjsj=?,cxjsbl=? ";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfycx);
		ps.setDate(2,cxkssj);
		ps.setDate(3,cxjssj);
		ps.setDouble(4,cxj);
		ps.setDouble(5,cxjsj);
		ps.setDouble(6,cxjsbl);
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