<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String zjxbh=request.getParameter("zjxbh");
String qrr=cf.GB2Uni(request.getParameter("qrr"));

java.sql.Date qrsj=null;
ls=request.getParameter("qrsj");
try{
	if (!(ls.equals("")))  qrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项确认时间 ]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("01"))
	{
		out.println("<BR>错误，存盘失败！增减项单状态不正确");
		return;
	}

	ls_sql="update jc_zczjx set qrr='"+qrr+"',qrsj=SYSDATE,clzt='02'";
	ls_sql+=" where zjxbh='"+zjxbh+"' and  clzt='01'";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("确认成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>