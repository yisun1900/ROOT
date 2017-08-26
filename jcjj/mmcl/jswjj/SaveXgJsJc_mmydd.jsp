<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String wjjsr=cf.GB2Uni(request.getParameter("wjjsr"));
String wjjsqk=cf.GB2Uni(request.getParameter("wjjsqk"));

String ls=null;

java.sql.Date swjsj=null;
ls=request.getParameter("swjsj");
try{
	if (!(ls.equals("")))  swjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量swjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[送五金时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="update jc_mmydd set swjsj=?,wjjsr=?,wjjsqk=?,wjsgsbz='Y'";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt>='04' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,swjsj);
	ps.setString(2,wjjsr);
	ps.setString(3,wjjsqk);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>