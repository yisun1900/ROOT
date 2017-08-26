<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jhfcxgr=cf.GB2Uni(request.getParameter("jhfcxgr"));
String jhfcxgyy=cf.GB2Uni(request.getParameter("jhfcxgyy"));
java.sql.Date jhfcxgsj=null;
java.sql.Date jhfcsj=null;
ls=request.getParameter("jhfcxgsj");
try{
	if (!(ls.equals("")))  jhfcxgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhfcxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划复测录入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhfcsj");
try{
	if (!(ls.equals("")))  jhfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhfcxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划复测测时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("09"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	ls_sql="update jc_cgdd set jhfcxgsj=?,jhfcxgr=?,jhfcxgyy=?,jhfcsj=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='09'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhfcxgsj);
	ps.setString(2,jhfcxgr);
	ps.setString(3,jhfcxgyy);
	ps.setDate(4,jhfcsj);
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