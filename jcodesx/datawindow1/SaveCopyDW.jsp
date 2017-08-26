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

	Statement stmt=null;
	String ls_sql=null;
		
	String dw_name1=request.getParameter("dw_name1");
	String dw_name=request.getParameter("dw_name");
	String dw_note=cf.GB2Uni(request.getParameter("dw_note"));

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		stmt = conn.createStatement();

		ls_sql="insert into jdatawindow_note(dw_name,dw_note,dw_fromsql,dw_wheresql,dw_pritable) ";
		ls_sql+=" select '"+dw_name+"','"+dw_note+"',dw_fromsql,dw_wheresql,dw_pritable";
		ls_sql+=" from jdatawindow_note ";
		ls_sql+=" where dw_name='"+dw_name1+"'";
		stmt.executeUpdate(ls_sql);


		ls_sql="insert into jdatawindow";
		ls_sql+=" select '"+dw_name+"',table_name,column_name,column_china,column_id,data_type";
		ls_sql+=" ,data_length,nullable,data_default,column_type,type_date,iskey,isinsert,isedit";
		ls_sql+=" ,isview,isselect,isselectwhere,iscxmutil,iscxmultiple,groupbyxh,isgroupby,issum";
		ls_sql+=" ,coltype,zb,isgroupbywhere,istjmutil,istjmultiple,mark";
		ls_sql+=" from jdatawindow";
		ls_sql+=" where dw_name='"+dw_name1+"'";
		stmt.executeUpdate(ls_sql);

		conn.commit();
		out.println("拷贝成功!");
	}
	catch (Exception e) {
		conn.rollback();
		out.print("拷贝失败: " + e);
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
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

