<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String czxh=cf.GB2Uni(request.getParameter("czxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfjm="";
	String czzt="";
	ls_sql=" SELECT sfjm,czzt";
	ls_sql+=" FROM cl_djj ";
    ls_sql+=" where czxh='"+czxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfjm=cf.fillNull(rs.getString(1));
		czzt=cf.fillNull(rs.getString(2));
	}
	rs.close();
	ps.close();

	if (czzt.equals("2"))
	{
		out.println("<BR>存盘失败！已提交");
		return;
	}


	ls_sql="update cl_djj set czzt='2'";
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{

		%>
		<SCRIPT language=javascript >
		<!--
		alert("代金券提交成功！");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>