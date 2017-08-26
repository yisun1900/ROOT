<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=null;
String sbkhlx=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
sbkhlx=cf.GB2Uni(request.getParameter("sbkhlx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int xh=0;

	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  crm_sbkhlx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xh++;

	ls_sql="insert into crm_sbkhlx ( xh,ssfgs,sbkhlx ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,ssfgs);
	ps.setString(3,sbkhlx);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>