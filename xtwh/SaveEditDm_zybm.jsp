<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zybm=null;
String zymc=null;
zybm=cf.GB2Uni(request.getParameter("zybm"));
zymc=cf.GB2Uni(request.getParameter("zymc"));
String wherezybm=null;
wherezybm=cf.GB2Uni(request.getParameter("wherezybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zybm set zybm=?,zymc=? ";
	ls_sql+=" where  (zybm='"+wherezybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zybm);
	ps.setString(2,zymc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>