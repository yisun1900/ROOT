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
	ResultSet rs=null;
	String ls_sql=null;
		
	String dw_name=request.getParameter("dw_name");
	String dw_note=cf.GB2Uni(request.getParameter("dw_note"));
	String dw_pritable=request.getParameter("dw_pritable");
	String dw_fromsql=request.getParameter("dw_fromsql");
	String dw_wheresql=request.getParameter("dw_wheresql");
	String dw_ordersql=request.getParameter("dw_ordersql");
	String dw_sql=request.getParameter("dw_sql");
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
		out.println("<BR>！！！！提醒，数据窗口没有主键，不能进行插入、删除、修改操作！<BR>");
	}

	int count=0;

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);


		ls_sql="update jdatawindow_note set dw_fromsql=?,dw_note=?,dw_ordersql=?,dw_pritable=?,dw_sql=?,dw_wheresql=? ";
		ls_sql+=" where dw_name='"+dw_name+"' ";
//		out.println("<BR>ls_sql="+ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dw_fromsql);
		ps.setString(2,dw_note);
		ps.setString(3,dw_ordersql);
		ps.setString(4,dw_pritable);
		ps.setString(5,dw_sql);
		ps.setString(6,dw_wheresql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jdatawindow set mark='N'";
		ls_sql+=" where dw_name='"+dw_name+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int i=0;i<len;i++)
		{
			ls_sql="select count(*) from jdatawindow ";
			ls_sql+=" where  (dw_name='"+dw_name+"') and  (table_name='"+table_name[i]+"') and  (column_name='"+column_name[i]+"')  ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)
			{
				ls_sql="update jdatawindow set mark='Y',column_china=?,column_id=?,data_type=?,data_length=?,nullable=?,data_default=?,column_type=?,type_date=?,iskey=? ";
				ls_sql+=" where  (dw_name='"+dw_name+"') and  (table_name='"+table_name[i]+"') and  (column_name='"+column_name[i]+"')  ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,cf.GB2Uni(column_china[i]));
				ps.setString(2,column_id[i]);
				ps.setString(3,data_type[i]);
				ps.setString(4,data_length[i]);
				ps.setString(5,nullable[i]);
				ps.setString(6,cf.GB2Uni(data_default[i]));
				ps.setString(7,column_type[i]);
				ps.setString(8,cf.GB2Uni(type_date[i]));
				ps.setString(9,iskey[i]);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into jdatawindow";
				ls_sql+="(mark,dw_name,table_name,column_name,data_type,data_length,column_china,column_type,type_date";
				ls_sql+=" ,nullable,column_id,data_default,iskey,isinsert,isedit,isview";
				ls_sql+=" ,isselect,isselectwhere,issum,isgroupby,isgroupbywhere) values";
				ls_sql+=" ('Y','"+dw_name+"','"+table_name[i]+"','"+column_name[i]+"','"+data_type[i]+"',"+data_length[i];
				ls_sql+=" ,'"+cf.GB2Uni(column_china[i])+"','"+column_type[i]+"'";
				ls_sql+=" ,'"+cf.GB2Uni(cf.sqlString(type_date[i]))+"','"+nullable[i]+"'";
				ls_sql+=","+column_id[i]+",'"+cf.GB2Uni(data_default[i])+"','"+iskey[i]+"','N','N','N','N','N','N','N','N')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

		}

		ls_sql="delete jdatawindow ";
		ls_sql+=" where dw_name='"+dw_name+"' and mark='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

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

