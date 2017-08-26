<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String pdph=request.getParameter("pdph");
String[] pdxh =request.getParameterValues("pdxh");
//////////////////////////////////////////////////////  

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接
	
	String pdzt="";
	ls_sql=" select pdzt";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where pdph='"+pdph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pdzt=rs.getString("pdzt");
	}
	rs.close();
	ps.close();

	if (pdzt.equals("2"))//1：正在盘点；2：盘点结束
	{
		out.println("错误！盘点已结束，不能再删除");
		return;
	}

	conn.setAutoCommit(false);

	for (i=0;i<pdxh.length ;i++ )
	{
		ls_sql="delete from jxc_kcpdmx ";
		ls_sql+=" where pdph="+pdph+" and pdxh="+pdxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close(); 
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("删除成功！！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
