<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����־</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%

Connection conn=null;
PreparedStatement ps=null;
String sql=null;

String lxfs=null;
try {
	conn=cf.getConnection();   //�õ�����

	sql="delete from  sq_ckxxrz ";
	ps= conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	out.println("ɾ���ɹ�");
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

</body>
</html>
