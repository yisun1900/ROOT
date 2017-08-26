<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tmczbm=null;
String tmczmc=null;
tmczbm=cf.GB2Uni(request.getParameter("tmczbm"));
tmczmc=cf.GB2Uni(request.getParameter("tmczmc"));
String wheretmczbm=null;
wheretmczbm=cf.GB2Uni(request.getParameter("wheretmczbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_tmczbm set tmczbm=?,tmczmc=? ";
	ls_sql+=" where  (tmczbm='"+wheretmczbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tmczbm);
	ps.setString(2,tmczmc);
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