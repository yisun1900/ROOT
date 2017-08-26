<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String pdph=request.getParameter("pdph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String pdzt="";
	ls_sql=" select pdzt";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where pdph='"+pdph+"'";
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
		out.println("错误！盘点已结束");
		return;
	}


	//检查是否录入了数据
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_kcpdmx ";
	ls_sql+=" where pdph='"+pdph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		out.print("您还没有录入数据，不能提交！！！");
		return;
	}


	//修改盘点批号状态
	ls_sql="update jxc_kcpdjl set pdzt='2' ";
	ls_sql+=" where pdph='"+pdph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close(); 


	%>
	<SCRIPT language=javascript >
	<!--
		alert("存盘成功！！");
		window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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