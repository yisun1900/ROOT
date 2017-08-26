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
	ResultSet rs=null;
	String ls_sql=null;
		
	String tablename=request.getParameter("tablename");
	String column_name="";
	String outSQL="";

	try {
		conn=cf.getConnection();

		ls_sql="select column_name";
		ls_sql+=" from user_tab_columns ";
		ls_sql+=" where table_name='"+tablename+"'";
		ls_sql+=" order by column_id";
		ps = conn.prepareStatement(ls_sql);
		rs=ps.executeQuery(ls_sql);
		while (rs.next())
		{
			column_name=rs.getString("column_name").toLowerCase();
			outSQL+=","+column_name+"=?";
		}
		rs.close();
		ps.close();
		if (!outSQL.equals(""))
		{
			outSQL=" update "+tablename.toLowerCase()+" set "+outSQL.substring(1);
			out.println("生成成功！SQL="+outSQL);
		}
		

	}
	catch (Exception e) {
		out.print("生成失败，Exception: " + e);
		return;
	}
	finally 
	{
		try{
			if (rs!= null) rs.close(); 
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


		
