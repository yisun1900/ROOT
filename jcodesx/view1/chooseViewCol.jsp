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
      <div align="center"><b><font size="4">选择查看列</font></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="2"> 
      <div align="center"> 
        <form method='post' action='saveViewCol.jsp' name='selectTableForm'>
          <table width="100%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" bgcolor="#CCCCCC" > 
              <td>序号</td>
              <td>Select</td>
              <td>主键</td>
              <td>表名</td>
              <td>字段中文名</td>
              <td>字段英文名</td>
              <td>字段类型</td>
              <td>字段长度</td>
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
		String isview=null;
		String iskey=null;
	
	
		ls_sql="select table_name,column_name,data_type,data_length,column_china,nullable,column_type ";
		ls_sql+=",column_id,data_default,isview,iskey ";
		ls_sql+=" from jdatawindow where dw_name='"+dw_name+"' order by column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;
			table_name=rs.getString("table_name").toLowerCase();
			column_name=rs.getString("column_name").toLowerCase();
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type");
			column_id=rs.getInt("column_id");
			isview=cf.fillNull(rs.getString("isview"));
			iskey=cf.fillNull(rs.getString("iskey"));
			data_default=cf.fillNull(rs.getString("data_default"));
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
			if (isview.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='isview' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='isview' value='"+column_id+"' ></td>\r\n");
			}
			out.println("    <td>"+iskey+"</td>\r\n");
			out.println("    <td>"+table_name+"</td>\r\n");
			out.println("    <td>"+column_china+"</td>\r\n");
			out.println("    <td>"+column_name+"</td>\r\n");
			out.println("    <td>"+data_type+"</td>\r\n");
			out.println("    <td>"+data_length+"</td>\r\n");
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
              <td colspan='11'> 
                <input type="button"  value="全选"  onClick="checkAll(selectTableForm)">
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

<form name="ref" method="post" action="chooseViewCol.jsp?dw_name=<%=dw_name%>&ref=0">
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

var mark=1;
function checkAll(formName)//
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.isview.checked =false
		}
		else{
			formName.isview.checked =true
		}
	}
	else{ 
		for (i=0;i <<%=row%>;i++ ){
			if (mark==0)
			{
				formName.isview[i].checked =false
			}
			else{
				formName.isview[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
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
