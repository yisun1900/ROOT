<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bkbh=null;
String bkmc=null;
bkbh=cf.GB2Uni(request.getParameter("bkbh"));
bkmc=cf.GB2Uni(request.getParameter("bkmc"));
String sfnmt=cf.GB2Uni(request.getParameter("sfnmt"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into nblt_bkgl ( bkbh,bkmc,tzs,hfs,sfnmt ) ";
	ls_sql+=" values ( ?,?,0,0,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bkbh);
	ps.setString(2,bkmc);
	ps.setString(3,sfnmt);
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