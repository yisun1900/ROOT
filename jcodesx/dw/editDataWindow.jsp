<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>请输入字段参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String table_name=(String)session.getAttribute("table_name");
	if (table_name==null)
	{
		out.print("没有选择数据表，请首先选择数据表！");
		return;
	}
	else{
		table_name=table_name.toLowerCase();
	}
%>

<body bgcolor="#FFFFFF">
<FORM method='post' action='saveEditColumnParam.jsp'>
  <table width="100%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
    <tr align="center" bgcolor="#CCCCCC" > 
      <td colspan="9">
		表名称：<input type='text' name='table_name' value="<%=table_name%>" readonly="true">
	  </td>
    </tr>
    <tr align="center" bgcolor="#CCCCCC" > 
      <td width="7%">序号</td>
      <td width="15%">字段中文名</td>
      <td width="12%">字段英文名</td>
      <td width="16%">字段类型</td>
      <td width="12%">字段长度</td>
      <td width="4%">空</td>
      <td width="12%">显示类型</td>
      <td width="12%">选择数据</td>
      <td width="10%">缺省值</td>
    </tr>
    <%
	Connection conn  = null;

	Statement stmt=null;
	ResultSet rs=null;
	String ls_sql=null;
		
	try {

		conn=cf.getConnection();
		stmt = conn.createStatement();
		
		String column_name=null;
		String data_type=null;
		int data_length=0;
		String column_china=null;
		String nullable=null;
		String column_type=null;
		String type_date=null;
		int column_id=0;
		String data_default=null;
	
		
		ls_sql="select column_name,data_type,data_length,column_china,nullable,column_type,type_date,column_id,data_default ";
		ls_sql+=" from columnparam where table_name='"+table_name+"' order by column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			column_name=rs.getString("column_name").trim();
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type").trim();
			type_date=cf.fillNull(rs.getString("type_date"));
			column_id=rs.getInt("column_id");
			data_default=cf.fillNull(rs.getString("data_default"));

			out.println("  <tr align=\"center\" bgcolor=\"#FFFFFF\" >\r\n");
			out.println("    <td><input type='text' name='column_id'  value='"+column_id+"' size='3' maxlength='5'></td>\r\n");
			out.println("    <td><input type='text' name='column_china' value='"+column_china+"' maxlength='80'></td>\r\n");
			out.println("    <td><input type='text' name='column_name' value='"+column_name+"'  size='10'></td>\r\n");
			out.println("    <td><input type='text' name='data_type' value='"+data_type+"' size='10'></td>\r\n");
			out.println("    <td><input type='text' name='data_length' value='"+data_length+"' size='5'></td>\r\n");
			out.println("    <td><input type='text' name='nullable' value='"+nullable+"' size='2'></td>\r\n");
			out.println("    <td><select name='column_type'>\r\n");
			if (column_type.equals("E"))
			{
				out.println("	    <option selected value='E'>编辑框</option>\r\n");
				out.println("	    <option value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option value='S'>下拉列表框</option>\r\n");
				out.println("	    <option value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option value='R'>单选钮</option>\r\n");
				out.println("	    <option value='RDB'>数据库单选钮</option>\r\n");
			}
			else if (column_type.equals("ME"))
			{
				out.println("	    <option value='E'>编辑框</option>\r\n");
				out.println("	    <option selected value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option value='S'>下拉列表框</option>\r\n");
				out.println("	    <option value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option value='R'>单选钮</option>\r\n");
				out.println("	    <option value='RDB'>数据库单选钮</option>\r\n");
			}
			else if (column_type.equals("S"))
			{
				out.println("	    <option value='E'>编辑框</option>\r\n");
				out.println("	    <option value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option selected value='S'>下拉列表框</option>\r\n");
				out.println("	    <option value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option value='R'>单选钮</option>\r\n");
				out.println("	    <option value='RDB'>数据库单选钮</option>\r\n");
			}
			else if (column_type.equals("SDB"))
			{
				out.println("	    <option value='E'>编辑框</option>\r\n");
				out.println("	    <option value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option value='S'>下拉列表框</option>\r\n");
				out.println("	    <option selected value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option value='R'>单选钮</option>\r\n");
				out.println("	    <option value='RDB'>数据库单选钮</option>\r\n");
			}
			else if (column_type.equals("R"))
			{
				out.println("	    <option value='E'>编辑框</option>\r\n");
				out.println("	    <option value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option value='S'>下拉列表框</option>\r\n");
				out.println("	    <option value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option selected value='R'>单选钮</option>\r\n");
				out.println("	    <option value='RDB'>数据库单选钮</option>\r\n");
			}
			else if (column_type.equals("RDB"))
			{
				out.println("	    <option value='E'>编辑框</option>\r\n");
				out.println("	    <option value='ME'>多行编辑框</option>\r\n");
				out.println("	    <option value='S'>下拉列表框</option>\r\n");
				out.println("	    <option value='SDB'>数据库下拉列表框</option>\r\n");
				out.println("	    <option value='R'>单选钮</option>\r\n");
				out.println("	    <option selected value='RDB'>数据库单选钮</option>\r\n");
			}
			out.println("    </select></td>\r\n");
			out.println("    <td><input type='text' name='type_date' maxlength='200' size='40' value=\""+type_date+"\" ></td>\r\n");
			out.println("    <td><input type='text' name='data_default'  value='"+data_default+"' maxlength='100' size='10'></td>\r\n");
			out.println("  </tr>\r\n");
		}
	}
	catch (Exception e) {
		out.print("Exception: " + e);
		return;
	}
	finally 
	{
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
    <tr align="center" bgcolor="#CCCCCC" > 
      <td colspan='9'> 
        <input type='submit' value='提交字段参数'>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

