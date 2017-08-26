<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yzcdbm=null;
String yzcdmc=null;
yzcdbm=cf.GB2Uni(request.getParameter("yzcdbm"));
yzcdmc=cf.GB2Uni(request.getParameter("yzcdmc"));
String whereyzcdbm=null;
whereyzcdbm=cf.GB2Uni(request.getParameter("whereyzcdbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_yzcdbm set yzcdbm=?,yzcdmc=? ";
	ls_sql+=" where  (yzcdbm='"+whereyzcdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yzcdbm);
	ps.setString(2,yzcdmc);
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