<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xzzwbm=null;
String xzzwmc=null;
String gzbm=null;
String gwzz=null;
String zwflbm=null;
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
xzzwmc=cf.GB2Uni(request.getParameter("xzzwmc"));
gzbm=cf.GB2Uni(request.getParameter("gzbm"));
gwzz=cf.GB2Uni(request.getParameter("gwzz"));
zwflbm=cf.GB2Uni(request.getParameter("zwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_xzzwbm ( xzzwbm,xzzwmc,gzbm,gwzz,zwflbm ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xzzwbm);
	ps.setString(2,xzzwmc);
	ps.setString(3,gzbm);
	ps.setString(4,gwzz);
	ps.setString(5,zwflbm);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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