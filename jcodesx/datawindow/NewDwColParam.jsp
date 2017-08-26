<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>请输入字段参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dw_pritable=request.getParameter("dw_pritable");
String dw_fromsql=request.getParameter("dw_fromsql");
String dw_wheresql=request.getParameter("dw_wheresql");
if (dw_pritable==null)
{
	out.println("没有选择主表");
	return;
}
%> 

<body bgcolor="#FFFFFF">
<CENTER>
  <b><font size="2">生成新的DataWindow->数据窗口字段属性 <font color="#FF0033">&lt;主表:<%=dw_pritable%>&gt;</font></font></b> 
</CENTER>
<FORM method='post' action='SaveNewDwColParam.jsp' name="formname">
  <table width="120%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2"  bgcolor="#999999" >
    <input type='hidden' name="dw_pritable" value="<%=dw_pritable%>">
    <input type='hidden' name="dw_fromsql" value="<%=dw_fromsql%>">
    <input type='hidden' name="dw_wheresql" value="<%=dw_wheresql%>">
    <tr bgcolor="#CCCCCC" > 
      <td width="4%" align="center">序号</td>
      <td width="6%" align="center">表名</td>
      <td width="8%" align="center">字段名</td>
      <td width="12%" align="center">字段说明</td>
      <td width="3%" align="center">主键</td>
      <td width="10%" align="center">显示类型</td>
      <td width="25%" align="center">选择数据</td>
      <td width="5%" align="center">缺省值</td>
      <td width="8%" align="center">字段类型</td>
      <td width="5%" align="center">字段长度</td>
      <td width="3%" align="center">可空</td>
    </tr>
    <%
	Connection conn  = null;
	Statement stmt=null;
	ResultSet rs=null;
	String ls_sql=null;
		
	String table_name=null;
	String[] column_names=null;

	try {
		String column_china=null;
		String data_type=null;
		String nullable=null;
		int data_length=0;
		int data_precision=0;
		int data_scale=0;
		String data_default=null;
		String constraint_type=null;
		String iskey=null;

		conn=cf.getConnection();
		stmt = conn.createStatement();
	
		int pos=0;
		int count=0;
		column_names=request.getParameterValues("selectedField");

		for (int j=0;j<column_names.length ;j++ )
		{
			pos=column_names[j].indexOf(".");
			table_name=column_names[j].substring(0,pos);
			column_names[j]=column_names[j].substring(pos+1);
			ls_sql="select comments,data_type,data_length,data_precision,data_scale,nullable,data_default ";
			ls_sql+=" from user_tab_columns,user_col_comments ";
			ls_sql+=" where user_tab_columns.table_name=user_col_comments.table_name";
			ls_sql+=" and user_tab_columns.column_name=user_col_comments.column_name";
			ls_sql+=" and user_tab_columns.table_name='"+table_name+"'";
			ls_sql+=" and user_tab_columns.column_name='"+column_names[j]+"'";
//			out.println(ls_sql);
			rs =stmt.executeQuery(ls_sql);
			if (rs.next())
			{
				column_china=rs.getString("comments");
				data_length=rs.getInt("data_length");
				data_precision=rs.getInt("data_precision");
				data_scale=rs.getInt("data_scale");
				data_type=rs.getString("data_type");
				nullable=rs.getString("nullable");
				data_default=cf.fillNull(rs.getString("data_default"));
				

				if (column_china==null)
				{
					column_china=column_names[j];
				}
				
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
			rs.close();

			//处理主键
			count=0;
			if (table_name.equals(dw_pritable))
			{
				ls_sql="select count(*) ";
				ls_sql+=" from user_constraints,user_cons_columns ";
				ls_sql+=" where user_constraints.table_name=user_cons_columns.table_name ";
				ls_sql+=" and user_constraints.constraint_name=user_cons_columns.constraint_name ";
				ls_sql+=" and user_constraints.owner=user_cons_columns.owner ";
				ls_sql+=" and user_constraints.constraint_type='P' ";
				ls_sql+=" and user_constraints.table_name='"+table_name+"' ";
				ls_sql+=" and user_cons_columns.column_name='"+column_names[j]+"' ";
				rs =stmt.executeQuery(ls_sql);
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();

			}
			if (count>0)
			{
				iskey="Y";
			}
			else{
				iskey="N";
			}
%> 
    <tr bgcolor="#FFFFFF" > 
      <td align="center" > 
        <input type='text' name='column_id'  value='<%=(j+1)%>' maxlength='5' size='2'>
      </td>
      <td align="center" > 
        <input type='text' name='table_name' value='<%=table_name%>'  size='10'>
      </td>
      <td align="center" > 
        <input type='text' name='column_name' value='<%=column_names[j]%>'  size='8'>
      </td>
      <td align="center" > 
        <input type='text' name='column_china' value='<%=column_china%>' maxlength='80' size='12'>
      </td>
      <td align="center" > 
        <input type='text' name='iskey' value='<%=iskey%>' maxlength='1' size='1' >
      </td>
      <td align="center" > 
        <select name='column_type' style="FONT-SIZE:12px;WIDTH:100px">
          <option value='E'>编辑框</option>
          <option value='ME'>多行编辑框</option>
          <option value='S'>下拉列表框</option>
          <option value='SDB'>数据库下拉列表框</option>
          <option value='R'>单选钮</option>
          <option value='RDB'>数据库单选钮</option>
        </select>
      </td>
      <td align="center" > 
        <input type='text' name='type_date' maxlength='400' size='55'>
      </td>
      <td align="center" > 
        <input type='text' name='data_default'  value='<%=data_default%>' maxlength='100' size='5'>
      </td>
      <td align="center" > 
        <input type='text' name='data_type' value='<%=data_type%>' size='10'>
      </td>
      <td align="center" > 
        <input type='text' name='data_length' value='<%=data_length%>' size='5'>
      </td>
      <td align="center" > 
        <input type='text' name='nullable' value='<%=nullable%>' size='2'>
      </td>
    </tr>

<%				
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
    <tr bgcolor="#CCCCCC" > 
      <td colspan="11" > <font color="#CC00CC">
	    数据窗口名称 
        <input type="text" name="dw_name" size="10" maxlength="40" value="<%=dw_pritable.toLowerCase()%>">
        数据窗口说明 </font>
		<input type="text" name="dw_note" maxlength="100" size="20">
		<input type="submit"  value="存盘" onClick="return f_do(formname);"  >
        <input type="reset" value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if(	javaTrim(FormName.dw_name)=="") {
		alert("请输入[数据窗口名称]！");
		FormName.dw_name.focus();
		return false;
	}
	if(	javaTrim(FormName.dw_note)=="") {
		alert("请输入[数据窗口说明]！");
		FormName.dw_note.focus();
		return false;
	}
	FormName.submit();
	return true;
}

//-->
</script>
