<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,txin.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>

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
		
	String dw_name=request.getParameter("dw_name");

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		stmt = conn.createStatement();

		ls_sql="update jdatawindow_note ";
		ls_sql+=" set dw_fromsql='"+dw_fromsql+"',dw_wheresql='"+dw_wheresql+"'";
		ls_sql+=" where dw_name='"+dw_name+"' ";
		stmt.executeUpdate(ls_sql);


		ls_sql="insert into jdatawindow";
		ls_sql+="(dw_name,table_name,column_name,data_type,data_length,column_china,column_type,type_date";
		ls_sql+=" ,nullable,column_id,data_default,iskey,isinsert,isedit,isview";
		ls_sql+=" ,isselect,isselectwhere,issum,isgroupby,isgroupbywhere) values";
		ls_sql+=" ('"+dw_name+"','"+table_name[i]+"','"+column_name[i]+"','"+data_type[i]+"',"+data_length[i];
		ls_sql+=" ,'"+cf.GB2Uni(column_china[i])+"','"+column_type[i]+"'";
		ls_sql+=" ,'"+cf.GB2Uni(cf.sqlString(type_date[i]))+"','"+nullable[i]+"'";
		ls_sql+=","+column_id[i]+",'"+cf.GB2Uni(data_default[i])+"','"+iskey[i]+"','N','N','N','N','N','N','N','N')";
//		out.println("<BR>ls_sql="+ls_sql);
		stmt.executeUpdate(ls_sql);

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

