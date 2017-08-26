<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*,txin.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>

<html>
<head>
<title>请输入字段参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
	Connection conn  = null;
	ConnectionManager s_connmgr=null;
	
	Statement stmt=null;
	ResultSet rs=null;
	String ls_sql=null;
		
	String tabnum=request.getParameter("tabnum");
	String table_name=null;
	String[] column_names=null;
	String colStr="";
	for (int i=0;i<Integer.parseInt(tabnum) ;i++ )
	{
		table_name=request.getParameter("table_name"+i);
		column_names=request.getParameterValues("column_name"+i);
		for (int j=0;j<column_names.length ;j++ )
		{
			colStr+=column_names[j]+"+"+table_name+"."+column_names[j]+"&";
		}
	}
	String inColumnName="";
	int len=0;
	

//字段显示中文名称变量说明	
	String note=null;//取得输入的注释
	Hashtable columnnotes=new Hashtable();//保留字段的中英文对照表
	note=cf.GB2Uni(request.getParameter("note")).trim();
	StringTokenizer token=new StringTokenizer(note,"\r\n");
//取得字段中文名
	if (column_names!=null)
	{
		int index=0;
		String ls=null;
		while ((token.hasMoreTokens())&&(index<column_names.length))
		{
			ls=token.nextToken();
			columnnotes.put(column_names[index].toLowerCase(),ls);
			index++;
		}

		for (int j=index;j<column_names.length;j++)
		{
			columnnotes.put(column_names[j].toLowerCase(),column_names[j].toLowerCase());
		}
	}
	
	if (column_names!=null)
	{
		inColumnName+=" and column_name in (";
		len=column_names.length;
		for (int i=0;i<len ; i++)
		{
			inColumnName+="'"+column_names[i]+"',";
		}
		inColumnName=inColumnName.substring(0,inColumnName.length()-1);
		inColumnName+=")";
	}

	if (!(inColumnName.equals("")))
	{
		try {
			conn=cf.getConnection();

			stmt = conn.createStatement();
			
			ls_sql="select column_name,data_type,data_length,data_precision,data_scale,nullable,column_id,data_default ";
			ls_sql+=" from user_tab_columns where table_name='"+table_name+"'"+inColumnName;
//			out.println("<BR>ls_sql="+ls_sql);
			rs =stmt.executeQuery(ls_sql);
			String column_name=null;
			String data_type=null;
			String nullable=null;
			int data_length=0;
			int data_precision=0;
			int data_scale=0;
			int column_id=0;
			String data_default=null;
			
			while (rs.next())
			{
				column_name=rs.getString("column_name").toLowerCase();
				data_length=rs.getInt("data_length");
				data_precision=rs.getInt("data_precision");
				data_scale=rs.getInt("data_scale");
				data_type=rs.getString("data_type");
				nullable=rs.getString("nullable");
				column_id=rs.getInt("column_id");
				data_default=cf.fillNull(rs.getString("data_default"));
				
				if (data_type.equals("NUMBER"))//字段类型为数字
				{
					if (data_scale==0){//无小数位
						data_type="INT";
						data_length=data_precision;//字段长度
						if (data_length>18)
						{
							data_length=18;//字段长度
						}
					}
					else{//有小数位
						data_type="DOUBLE";
						data_length=data_precision+1;//字段长度
					}
				}
				else if (data_type.equals("DATE"))//字段类型为日期
				{
					data_length=10;//字段长度
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
				if (rs != null) rs.close(); 
				if (stmt != null) stmt.close(); 
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				out.println("关闭连接发生以外,Exception:"+e.getMessage());
			}
		}
	}
%> 
<form method="post" action="ChooseTableCol.jsp" name="selectTableForm">
<table width="100%" border="1">
  <tr align="center"> 
    <td>输入字段注释</td>
  </tr>
  <tr align="center"> 
    <td> 
      <select name="sjczbm" style="FONT-SIZE:12px;WIDTH:182px" size="10" multiple >
<%
	cf.selectToken(out,colStr,"");
%> 
      </select>
    </td>
  </tr>
  <tr align="center" valign="middle"> 
    <td> <font size="2">输入中文字段名</font> 
      <textarea name="note" cols="40" rows="10"></textarea>
    </td>
  </tr>
  <tr align="center"> 
    <td> 
      <input type="submit" name="Submit" value="Submit">
      <input type="reset" name="Submit2" value="Reset">
    </td>
  </tr>
</table>
</form>
</body>
</html>

