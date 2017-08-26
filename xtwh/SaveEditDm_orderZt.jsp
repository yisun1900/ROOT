<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String whereztbm=null;
String ztmc=null;

ztmc=cf.GB2Uni(request.getParameter("ztmc"));

whereztbm=cf.GB2Uni(request.getParameter("ztbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  dm_orderzt";
	ls_sql+=" where ztmc='"+ztmc+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	if (count>0)
	{
		out.println("错误！此[订单状态名称]已存在");
		return;
	}

	


	conn=cf.getConnection();
	ls_sql="update dm_orderzt set ztbm=?,ztmc=? ";
	ls_sql+=" where  (ztbm='"+whereztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,whereztbm);
	ps.setString(2,ztmc);
	
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