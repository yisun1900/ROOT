<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.awt.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	Connection conn  = null;
	PreparedStatement ps=null;
	String ls_sql=null;
		
	String[] iseditwhere;
	String whereSql="";
	
	String dw_name=request.getParameter("dw_name");
	String[] isedit=request.getParameterValues("isedit");
	if (isedit==null)
	{
		out.println("��ѡ���޸���");
		return;
	}

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		ls_sql="update jdatawindow set isedit='N' where  dw_name='"+dw_name+"'";
		ps = conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		for (int i=0;i<isedit.length ;i++ )
		{
			ls_sql="update jdatawindow set isedit='Y' ";
			ls_sql+="where dw_name='"+dw_name+"' ";
			ls_sql+=" and column_id='"+isedit[i]+"'";
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}
		conn.commit();
		out.println("���̳ɹ�!");
		

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
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

