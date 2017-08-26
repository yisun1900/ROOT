<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmzjxyybm=null;
String mmzjxyymc=null;
mmzjxyybm=cf.GB2Uni(request.getParameter("mmzjxyybm"));
mmzjxyymc=cf.GB2Uni(request.getParameter("mmzjxyymc"));
String wheremmzjxyybm=null;
wheremmzjxyybm=cf.GB2Uni(request.getParameter("wheremmzjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmzjxyybm set mmzjxyybm=?,mmzjxyymc=? ";
	ls_sql+=" where  (mmzjxyybm='"+wheremmzjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmzjxyybm);
	ps.setString(2,mmzjxyymc);
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