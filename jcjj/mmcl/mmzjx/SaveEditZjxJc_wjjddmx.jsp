<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double zjhsl=0;
ls=request.getParameter("zjhsl");
try{
	if (!(ls.equals("")))  zjhsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjhsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}


String lrxh=request.getParameter("lrxh");
String zjxxh=request.getParameter("zjxxh");
String yddbh=request.getParameter("yddbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double wjzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_wjjddmx set zjhsl=?";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjhsl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_wjzjxmx set xsl=?";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjhsl);
	ps.executeUpdate();
	ps.close();


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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