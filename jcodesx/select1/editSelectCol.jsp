<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<%
	String ls_sql=null;
	String dw_name=request.getParameter("dw_name");
%> 
<head>
<title>订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td colspan="2"> 
      <div align="center"><b><font size="4">选择查询列</font></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="2"> 
      <div align="center"> 
        <form method='post' action='saveSelectCol.jsp' name='selectTableForm'>
          <table width="100%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" bgcolor="#CCCCCC" > 
              <td>序号</td>
              <td>Select</td>
              <td>Where</td>
              <td>范围</td>
              <td>可多选</td>
              <td>表名</td>
              <td>字段中文名</td>
              <td>字段英文名</td>
              <td>字段类型</td>
              <td>字段长度</td>
              <td>主键</td>
              <td>空</td>
              <td>显示类型</td>
              <td>缺省值</td>
            </tr>
            <%
	Connection conn  = null;
	Statement stmt=null;
	ResultSet rs=null;
	int row=0;
		
	try {
		conn=cf.getConnection();
		stmt = conn.createStatement();
		
		String table_name=null;
		String column_name=null;
		String data_type=null;
		int data_length=0;
		String column_china=null;
		String nullable=null;
		String column_type=null;
		int column_id=0;
		String data_default=null;
		String isselect=null;
		String isselectwhere=null;
		String iscxmutil=null;
		String iscxmultiple=null;
		String iskey=null;
	
	
		ls_sql="select table_name,column_name,data_type,data_length,column_china,nullable,column_type ";
		ls_sql+=",column_id,data_default,isselect,isselectwhere,iscxmutil,iskey,iscxmultiple";
		ls_sql+=" from jdatawindow where dw_name='"+dw_name+"' order by column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;
			table_name=rs.getString("table_name");
			column_name=rs.getString("column_name");
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type");
			column_id=rs.getInt("column_id");
			isselect=cf.fillNull(rs.getString("isselect"));
			isselectwhere=cf.fillNull(rs.getString("isselectwhere"));
			iscxmutil=cf.fillNull(rs.getString("iscxmutil"));
			iscxmultiple=cf.fillNull(rs.getString("iscxmultiple"));
			data_default=cf.fillNull(rs.getString("data_default"));
			iskey=cf.fillNull(rs.getString("iskey"));
			if (column_type.equals("E"))
			{
				column_type="编辑框";
			}
			else if (column_type.equals("ME"))
			{
				column_type="多行编辑框";
			}
			else if (column_type.equals("S"))
			{
				column_type="下拉列表框";
			}
			else if (column_type.equals("SDB"))
			{
				column_type="数据库下拉列表框";
			}
			else if (column_type.equals("R"))
			{
				column_type="单选钮";
			}
			else if (column_type.equals("RDB"))
			{
				column_type="数据库单选钮";
			}
			out.println("  <tr  bgcolor=\"#FFFFFF\" >\r\n");
			out.println("    <td>"+column_id+"</td>\r\n");
			if (isselect.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='isselect' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='isselect' value='"+column_id+"' ></td>\r\n");
			}
			if (isselectwhere.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='isselectwhere' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='isselectwhere' value='"+column_id+"' ></td>\r\n");
			}
			if (iscxmutil.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='iscxmutil' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='iscxmutil' value='"+column_id+"' ></td>\r\n");
			}
			if (iscxmultiple.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='iscxmultiple' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='iscxmultiple' value='"+column_id+"' ></td>\r\n");
			}

			out.println("    <td>"+table_name+"</td>\r\n");
			out.println("    <td>"+column_china+"</td>\r\n");
			out.println("    <td>"+column_name+"</td>\r\n");
			out.println("    <td>"+data_type+"</td>\r\n");
			out.println("    <td>"+data_length+"</td>\r\n");
			out.println("    <td>"+iskey+"\r\n");
			out.println("    <td>"+nullable+"\r\n");
			out.println("    <td>"+column_type+"\r\n");
			out.println("    <td>"+data_default+"</td>\r\n");
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
              <td colspan='14'> 
                <input type="button"  value="Select全选"  onClick="checkAllSelect(selectTableForm)">
                <input type="button"  value="Where全选"  onClick="checkAllWhere(selectTableForm)">
                <input type="button"  value="存盘"  onClick="f_do(selectTableForm)">
                <input type="reset"  value="重选" >
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="editSelectCol.jsp?dw_name=<%=dw_name%>&ref=0">
</form>

</body>
</html>


<script  LANGUAGE="javascript">
<!--

<%
	String ref=request.getParameter("ref");
	if (ref!=null && ref.equals("1"))
	{
		out.println("ref.submit();");
	}
%>



var selectmark=1;
var wheremark=1;
function checkAllSelect(formName)//
{
	var i = 0;
	if (<%=row%>==1){
		if (selectmark==0)
		{
			formName.isselect.checked =false
		}
		else{
			formName.isselect.checked =true
		}
	}
	else{ 
		for (i=0;i <<%=row%>;i++ ){
			if (selectmark==0)
			{
				formName.isselect[i].checked =false
			}
			else{
				formName.isselect[i].checked =true
			}
		}
	}
	if (selectmark==0)
	{
		selectmark=1;
	}
	else{
		selectmark=0;
	}
}
function checkAllWhere(formName)//
{
	var i = 0;
	if (<%=row%>==1){
		if (wheremark==0)
		{
			formName.isselectwhere.checked =false
		}
		else{
			formName.isselectwhere.checked =true
		}
	}
	else{ 
		for (i=0;i <<%=row%>;i++ ){
			if (wheremark==0)
			{
				formName.isselectwhere[i].checked =false
			}
			else{
				formName.isselectwhere[i].checked =true
			}
		}
	}
	if (wheremark==0)
	{
		wheremark=1;
	}
	else{
		wheremark=0;
	}
}

function f_do(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("请选择数据窗口 ！");
		FormName.dw_name.focus();
		return false;
	}
	FormName.submit();
}

//-->
</script>
