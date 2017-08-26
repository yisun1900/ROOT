<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");
if (hfjlh.length!=1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_sjhffkbm where clzt='Y' and hfjlh="+hfjlh[0];
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
		out.println("错误！有关部门已对回访做了处理，不能再删除");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from  crm_sjhfjl where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from  crm_sjhffkbm where hfjlh='"+hfjlh[0]+"'";
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
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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
%>