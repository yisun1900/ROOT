<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String azwzbm=null;
String azwzmc=null;
azwzbm=cf.GB2Uni(request.getParameter("azwzbm"));
azwzmc=cf.GB2Uni(request.getParameter("azwzmc"));
String whereazwzbm=null;
whereazwzbm=cf.GB2Uni(request.getParameter("whereazwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_azwzbm set azwzbm=?,azwzmc=? ";
	ls_sql+=" where  (azwzbm='"+whereazwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,azwzbm);
	ps.setString(2,azwzmc);
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