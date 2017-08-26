<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String flbm=null;
String flmc=null;
flbm=cf.GB2Uni(request.getParameter("flbm"));
flmc=cf.GB2Uni(request.getParameter("flmc"));
String whereflbm=null;
whereflbm=cf.GB2Uni(request.getParameter("whereflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update oa_flbm set flbm=?,flmc=? ";
	ls_sql+=" where  (flbm='"+whereflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,flbm);
	ps.setString(2,flmc);
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