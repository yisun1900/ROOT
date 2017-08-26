<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long tczcdlbm=0;
String tczcdlmc=null;
ls=request.getParameter("tczcdlbm");
try{
	if (!(ls.equals("")))  tczcdlbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tczcdlbm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐主材大类编码]类型转换发生意外:"+e);
	return;
}
tczcdlmc=cf.GB2Uni(request.getParameter("tczcdlmc"));
String wheretczcdlbm=null;
wheretczcdlbm=cf.GB2Uni(request.getParameter("wheretczcdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_tczcdlbm set tczcdlbm=?,tczcdlmc=? ";
	ls_sql+=" where  (tczcdlbm="+wheretczcdlbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tczcdlbm);
	ps.setString(2,tczcdlmc);
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
	out.print("<BR>出错:" + e);
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