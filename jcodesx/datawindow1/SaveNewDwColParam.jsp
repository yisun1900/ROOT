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
	ResultSet rs=null;
	String ls_sql=null;
		
	String dw_name=request.getParameter("dw_name");
	String dw_note=cf.GB2Uni(request.getParameter("dw_note"));
	String dw_pritable=request.getParameter("dw_pritable");
	String dw_fromsql=request.getParameter("dw_fromsql");
	String dw_wheresql=request.getParameter("dw_wheresql");
	String[] table_name;
	String[] column_name;
	String[] data_type;
	String[] data_length;
	String[] column_china;
	String[] column_type;
	String[] type_date;
	String[] nullable;
	String[] column_id;
	String[] data_default;
	String[] iskey;
	
	table_name=request.getParameterValues("table_name");
	column_name=request.getParameterValues("column_name");
	data_type=request.getParameterValues("data_type");
	data_length=request.getParameterValues("data_length");
	column_china=request.getParameterValues("column_china");
	column_type=request.getParameterValues("column_type");
	type_date=request.getParameterValues("type_date");
	nullable=request.getParameterValues("nullable");
	column_id=request.getParameterValues("column_id");
	data_default=request.getParameterValues("data_default");
	iskey=request.getParameterValues("iskey");

	if (dw_wheresql.equals(""))
	{
		dw_wheresql=" (1=1) ";
	}


	
	int len=column_name.length;
	//判断是否有主键
	int mark=0;
	for (int i=0;i<len;i++)
	{
		if (iskey[i].equals("Y"))
		{
			mark=1;
		}
	}
	if (mark==0)
	{
		out.println("错误，没有主键！");
		return;
	}

	try {
		conn=cf.getConnection();


		conn.setAutoCommit(false);

		stmt = conn.createStatement();

		int xh=0;
		ls_sql="select NVL(max(xh),0) ";
		ls_sql+=" from jdatawindow_note";
		rs =stmt.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		rs.close();
		xh++;


		ls_sql="insert into jdatawindow_note(dw_name,dw_note,dw_fromsql,dw_wheresql,dw_pritable,xh) ";
		ls_sql+=" values('"+dw_name+"','"+dw_note+"','"+dw_fromsql+"','"+dw_wheresql+"','"+dw_pritable+"',"+xh+")";
		stmt.executeUpdate(ls_sql);


		for (int i=0;i<len;i++)
		{
			ls_sql="insert into jdatawindow";
			ls_sql+="(dw_name,table_name,column_name,data_type,data_length,column_china,column_type,type_date";
			ls_sql+=" ,nullable,column_id,data_default,iskey,isinsert,isedit,isview";
			ls_sql+=" ,isselect,isselectwhere,issum,isgroupby,isgroupbywhere) values";
			ls_sql+=" ('"+dw_name+"','"+table_name[i]+"','"+column_name[i]+"','"+data_type[i]+"',"+data_length[i];
			ls_sql+=" ,'"+cf.GB2Uni(column_china[i])+"','"+column_type[i]+"'";
			ls_sql+=" ,'"+cf.sqlString(cf.GB2Uni(type_date[i]))+"','"+nullable[i]+"'";
			ls_sql+=","+column_id[i]+",'"+cf.GB2Uni(data_default[i])+"','"+iskey[i]+"','N','N','N','N','N','N','N','N')";
//			out.println("<BR>ls_sql="+ls_sql);
			stmt.executeUpdate(ls_sql);
		}

		conn.commit();
		out.println("存盘成功!");
	}
	catch (Exception e) {
		conn.rollback();
		out.print("Exception: " + e);
		out.print("<br>ls_sql: " + ls_sql);
		return;
	}
	finally 
	{
		conn.setAutoCommit(true);
		try{
			if (rs != null) rs.close(); 
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

