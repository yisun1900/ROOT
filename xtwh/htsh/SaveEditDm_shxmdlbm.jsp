<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shxmdlbm=null;
String shxmdlmc=null;
shxmdlbm=cf.GB2Uni(request.getParameter("shxmdlbm"));
shxmdlmc=cf.GB2Uni(request.getParameter("shxmdlmc"));
String whereshxmdlbm=null;
whereshxmdlbm=cf.GB2Uni(request.getParameter("whereshxmdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_shxmdlbm set shxmdlbm=?,shxmdlmc=? ";
	ls_sql+=" where  (shxmdlbm='"+whereshxmdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shxmdlbm);
	ps.setString(2,shxmdlmc);
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