<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jhccxgr=cf.GB2Uni(request.getParameter("jhccxgr"));
String jhccxgyy=cf.GB2Uni(request.getParameter("jhccxgyy"));
java.sql.Date jhccxgsj=null;
java.sql.Date jhccsj=null;
ls=request.getParameter("jhccxgsj");
try{
	if (!(ls.equals("")))  jhccxgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测测时间]类型转换发生意外:"+e);
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
	if (clzt.compareTo("02")>0)
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	ls_sql="update jc_cgdd set jhccxgsj=?,jhccxgr=?,jhccxgyy=?,jhccsj=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt<='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhccxgsj);
	ps.setString(2,jhccxgr);
	ps.setString(3,jhccxgyy);
	ps.setDate(4,jhccsj);
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