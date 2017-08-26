<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double zjje=0;
	double jzjje=0;
	ls_sql="select zjje,jzjje ";
	ls_sql+=" FROM crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjje=rs.getDouble("zjje");
		jzjje=rs.getDouble("jzjje");
	}
	rs.close();
	ps.close();

	ls_sql="delete from crm_zjxbgd ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double allje=0;
	ls_sql="select sum(je) ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (allje!=jzjje)
	{
		out.println("提醒！！！【折后工程增减额："+jzjje+"】不等于【变更明细总额："+allje+"】");
	}

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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