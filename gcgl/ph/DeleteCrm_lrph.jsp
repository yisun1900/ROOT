<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>
<%

String[] lrph = request.getParameterValues("lrph");
if (lrph.length>1)
{
	out.println("错误！每次只能删除一个批号");
	return;
}

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	ls_sql="delete from crm_lrphmx where lrph="+lrph[0];
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_lrph where lrph="+lrph[0];
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
}
finally{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

