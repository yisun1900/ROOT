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
		
	String selectStr=request.getParameter("selectStr");
	String fromStr=request.getParameter("fromStr");
	out.println("<BR>需检查SQL语句：");
	out.println("<BR>SELECT "+selectStr);
	out.println("<BR>FROM "+fromStr);
	out.println("<P>开始检查，如果有错，将输出错误信息........<BR>");

	String[] columnName=null;
	String[] tableName=null;
	String outSQL="";

	try {
		columnName=selectStr.split(",");
		tableName=fromStr.split(",");

		conn=cf.getConnection();

		int xh=0;

		for (int i=0;i<columnName.length ;i++ )
		{
			String column=columnName[i].toUpperCase();
			String table=null;

			int pos=column.indexOf(".");
			if (pos!=-1)
			{
				table=column.substring(0,pos).trim();
				column=column.substring(pos+1).trim();
			}

			int count=0;
			if (table!=null)//有表前缀
			{
				ls_sql="select count(*)";
				ls_sql+=" from user_tab_columns ";
				ls_sql+=" where table_name='"+table+"' and  column_name='"+column+"'";
				ps = conn.prepareStatement(ls_sql);
				rs=ps.executeQuery(ls_sql);
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();
				if (count==0)
				{
					xh++;
					out.println("<BR>"+xh+"：在表【"+table.toLowerCase()+"】中不存在列【"+column.toLowerCase()+"】");
				}
			}
			else{
				for (int j=0;j<tableName.length ;j++ )
				{
					table=tableName[j].toUpperCase();

					ls_sql="select count(*)";
					ls_sql+=" from user_tab_columns ";
					ls_sql+=" where table_name='"+table+"' and  column_name='"+column+"'";
					ps = conn.prepareStatement(ls_sql);
					rs=ps.executeQuery(ls_sql);
					if (rs.next())
					{
						count+=rs.getInt(1);
					}
					rs.close();
					ps.close();
				}
				if (count==0)
				{
					xh++;
					out.println("<BR>"+xh+"：不存在列【"+column.toLowerCase()+"】");
				}
				else if (count>1)
				{
					xh++;
					out.println("<BR>"+xh+"：列【"+column.toLowerCase()+"】在["+count+"]个表中都存在，请加表前缀");
				}
			}
		}

		
		out.println("<P>检查完成！");

	}
	catch (Exception e) {
		out.print("<P>出现语法错误: " + e);
		out.print("<BR>SQL=" +ls_sql);
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


		
