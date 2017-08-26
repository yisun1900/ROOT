<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String fclrr=cf.GB2Uni(request.getParameter("fclrr"));
String fcsm=cf.GB2Uni(request.getParameter("fcsm"));

java.sql.Date fcsj=null;
ls=request.getParameter("fcsj");
try{
	if (!(ls.equals("")))  fcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[复尺时间]类型转换发生意外:"+e);
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
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("26"))
	{
		out.println("<BR>错误，存盘失败！处理状态不正确");
		return;
	}

	ls_sql="update jc_zcdd set fclrr=?,fcsj=?,fcsm=?,clzt='26'";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fclrr);
	ps.setDate(2,fcsj);
	ps.setString(3,fcsm);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>