<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mytbm=null;
String myt=null;
mytbm=cf.GB2Uni(request.getParameter("mytbm"));
myt=cf.GB2Uni(request.getParameter("myt"));
String wheremytbm=null;
wheremytbm=cf.GB2Uni(request.getParameter("wheremytbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mytbm set mytbm=?,myt=? ";
	ls_sql+=" where  (mytbm='"+wheremytbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mytbm);
	ps.setString(2,myt);
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