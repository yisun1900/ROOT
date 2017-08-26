<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fbillno=request.getParameter("fbillno");
String ddqrr=cf.GB2Uni(request.getParameter("ddqrr"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String clgw=cf.GB2Uni(request.getParameter("clgw"));
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));

java.sql.Date ddqrsj=null;
ls=request.getParameter("ddqrsj");
try{
	if (!(ls.equals("")))  ddqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddqrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单确认时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
try {
	Class.forName (driver);
	conn = DriverManager.getConnection(url, "sa", "");

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from SEOrder";
	ls_sql+=" where fbillno='"+fbillno+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("09") && !clzt.equals(""))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	ls_sql="update SEOrder set ddqrr=?,ppbm=?,clgw=?,xmzy=?,ddqrsj=getdate(),clzt='11'";
	ls_sql+=" where fbillno='"+fbillno+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddqrr);
	ps.setString(2,ppbm);
	ps.setString(3,clgw);
	ps.setString(4,xmzy);
//	ps.setDate(5,ddqrsj);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
	}
	catch (Exception e){
		if (conn != null) conn.close();
	}
}
%>