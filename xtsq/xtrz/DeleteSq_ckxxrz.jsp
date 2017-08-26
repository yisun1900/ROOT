<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>清空日志</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%

Connection conn=null;
PreparedStatement ps=null;
String sql=null;

String lxfs=null;
try {
	conn=cf.getConnection();   //得到连接

	sql="delete from  sq_ckxxrz ";
	ps= conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	out.println("删除成功");
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>

</body>
</html>
