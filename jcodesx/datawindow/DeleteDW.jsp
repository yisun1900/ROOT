<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	Connection conn  = null;

	Statement stmt=null;
	String ls_sql=null;
		
	String dw_name=request.getParameter("dw_name");

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		stmt = conn.createStatement();

		ls_sql="delete from jdatawindow_note";
		ls_sql+=" where dw_name='"+dw_name+"'";
		stmt.executeUpdate(ls_sql);


		ls_sql="delete from jdatawindow";
		ls_sql+=" where dw_name='"+dw_name+"'";
		stmt.executeUpdate(ls_sql);

		conn.commit();
		out.println("ɾ�����ݴ���:"+dw_name+"�ɹ�!");
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
			if (stmt != null) stmt.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

