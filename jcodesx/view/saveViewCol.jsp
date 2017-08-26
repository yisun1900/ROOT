<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.awt.*,ybl.sql.connection.*' %>
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
	String[] isview=request.getParameterValues("isview");
	String whereSql="";
	

	if (isview==null)
	{
		out.println("请选择修改列");
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
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%>
存盘成功
</body>
</html>

