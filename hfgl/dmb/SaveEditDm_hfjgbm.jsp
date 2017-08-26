<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hfjgbm=null;
String hfjgmc=null;
hfjgbm=cf.GB2Uni(request.getParameter("hfjgbm"));
hfjgmc=cf.GB2Uni(request.getParameter("hfjgmc"));

String wherehfjgbm=null;
wherehfjgbm=cf.GB2Uni(request.getParameter("wherehfjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_hfjgbm set hfjgbm=?,hfjgmc=? ";
	ls_sql+=" where  (hfjgbm='"+wherehfjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjgbm);
	ps.setString(2,hfjgmc);
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