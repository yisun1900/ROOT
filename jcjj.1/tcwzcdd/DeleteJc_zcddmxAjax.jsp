<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
String[] xh=request.getParameterValues("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int mark=0;
	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR><font color=\"#FF0000\"><B>错误，不能再删除！合同已完成</B></font>");
		mark=1;
	}

	conn.setAutoCommit(false);

	if (mark==0)
	{
		for (int i=0;i<xh.length ;i++ )
		{
			ls_sql="delete from jc_zcddmx ";
			ls_sql+=" where xh="+xh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

	if (mark==0)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("删除成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


response.sendRedirect("Jc_zcddmxAjaxList.jsp?ddbh="+ddbh);


%>