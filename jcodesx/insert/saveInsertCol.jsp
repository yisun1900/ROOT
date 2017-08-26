<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	Connection conn  = null;
	PreparedStatement ps=null;
	String ls_sql=null;
		
	String dw_name=request.getParameter("dw_name");
	String[] column_id=request.getParameterValues("isinsert");
	
	if (column_id==null)
	{
		out.println("请选择插入列");
		return;
	}
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		ls_sql="update jdatawindow set isinsert='N' where  dw_name='"+dw_name+"'";
		ps = conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int i=0;i<column_id.length ;i++ )
		{
			ls_sql="update jdatawindow set isinsert='Y' ";
			ls_sql+="where  dw_name='"+dw_name+"'";
			ls_sql+=" and column_id='"+column_id[i]+"'";
	//		out.println("<BR>ls_sql="+ls_sql);
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		conn.commit();
		out.println("存盘成功!");
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
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

