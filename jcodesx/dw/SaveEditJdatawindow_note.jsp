<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%

String ls=null;
String dw_name=null;
String dw_note=null;
dw_name=cf.GB2Uni(request.getParameter("dw_name"));
dw_note=cf.GB2Uni(request.getParameter("dw_note"));
String wheredw_name=request.getParameter("wheredw_name");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdatawindow_note set dw_name=?,dw_note=?";
	ls_sql+=" where  (dw_name='"+wheredw_name+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dw_name);
	ps.setString(2,dw_note);
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