<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxbh=request.getParameterValues("zjxbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxbh.length ;i++ )
	{
		String sxhtsfysh="";
		ls_sql="select sxhtsfysh";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
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
			conn.rollback();
			out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能确认！</font></strong>");
			return;
		}

		ls_sql="update jc_zczjx set wjr='"+yhmc+"',wjsj=SYSDATE,clzt='30'";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"' and  clzt='03'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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