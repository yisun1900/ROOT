<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

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
	String[] isselect=request.getParameterValues("isselect");
	String[] isselectwhere=request.getParameterValues("isselectwhere");
	String[] iscxmutil=request.getParameterValues("iscxmutil");
	String[] iscxmultiple=request.getParameterValues("iscxmultiple");
	
	if (isselect==null)
	{
		out.println("请选择修改列");
		return;
	}

	try {
		conn=cf.getConnection();

		ls_sql="update jdatawindow set isselect='N',isselectwhere='N',iscxmutil='N',iscxmultiple='N' ";
		ls_sql+="  where  dw_name='"+dw_name+"'";
		ps = conn.prepareStatement(ls_sql);
		ps.executeUpdate(ls_sql);
		ps.close();
		

		for (int i=0;i<isselect.length ;i++ )
		{
			ls_sql="update jdatawindow set isselect='Y' ";
			ls_sql+="where dw_name='"+dw_name+"' and column_id="+isselect[i];
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}		
		if (isselectwhere!=null)
		{
			for (int i=0;i<isselectwhere.length ;i++ )
			{
				ls_sql="update jdatawindow set isselectwhere='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+isselectwhere[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
		}
		if (iscxmutil!=null)
		{
			for (int i=0;i<iscxmutil.length ;i++ )
			{
				ls_sql="update jdatawindow set iscxmutil='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+iscxmutil[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
		}
		if (iscxmultiple!=null)
		{
			for (int i=0;i<iscxmultiple.length ;i++ )
			{
				ls_sql="update jdatawindow set iscxmultiple='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+iscxmultiple[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
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

