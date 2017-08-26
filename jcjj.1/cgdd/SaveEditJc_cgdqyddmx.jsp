<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String dqbm=null;
long sl=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String whereddbh=null;
String wheredqbm=null;
whereddbh=cf.GB2Uni(request.getParameter("whereddbh"));
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double dqyddze=0;
double yddze=0;
try {
	conn=cf.getConnection();

	ls_sql="update jc_cgdqyddmx set ddbh=?,dqbm=?,sl=?,bz=? ";
	ls_sql+=" where  (ddbh='"+whereddbh+"') and  (dqbm='"+wheredqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,dqbm);
	ps.setLong(3,sl);
	ps.setString(4,bz);
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
	out.print("Exception: " + e);
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