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
		
	String dw_name=request.getParameter("dw_name");
	String[] isview=request.getParameterValues("isview");
	String whereSql="";
	

	if (isview==null)
	{
		out.println("��ѡ���޸���");
		return;
	}
	int len=0;

	try {
		conn=cf.getConnection();

		ls_sql="update jdatawindow set isview='N' where  dw_name='"+dw_name+"'";
		ps = conn.prepareStatement(ls_sql);
		ps.executeUpdate(ls_sql);
		ps.close();
		
		for (int i=0;i<isview.length ;i++ )
		{
			ls_sql="update jdatawindow set isview='Y' ";
			ls_sql+="where dw_name='"+dw_name+"' and column_id="+isview[i];
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}
	}
	catch (Exception e) {
		out.print("Exception: " + e);
		return;
	}
	finally 
	{
		try{
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%>
���̳ɹ�
</body>
</html>

