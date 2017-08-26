<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxbh=request.getParameter("zjxbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sxhtsfysh="";
	ls_sql="select sxhtsfysh";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
	}
	rs.close();
	ps.close();

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能完结！</font></strong>");
		return;
	}

	ls_sql="update jc_zczjx set wjr='"+yhmc+"',wjsj=SYSDATE,clzt='30'";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>