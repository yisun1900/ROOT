<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ztbm=null;
String shjl=null;
String xyztbm=null;
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
xyztbm=cf.GB2Uni(request.getParameter("xyztbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_shztlc ( ztbm,shjl,xyztbm ) ";
	ls_sql+=" values ( ?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ztbm);
	ps.setString(2,shjl);
	ps.setString(3,xyztbm);
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