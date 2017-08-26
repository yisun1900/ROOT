<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,txin.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<%
String dw_name=request.getParameter("dw_name");
String[] table_name=request.getParameterValues("table_name");
String dw_fromsql="";
String dw_wheresql="";
String dw_sql="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String key=null;
int count=0;
try {
	conn=cf.getConnection();

	for (int i=0;i<table_name.length ;i++ )
	{
		dw_fromsql+=","+table_name[i];

		//查询主键
		ls_sql="select user_cons_columns.column_name ";
		ls_sql+=" from user_constraints,user_cons_columns ";
		ls_sql+=" where user_constraints.table_name=user_cons_columns.table_name ";
		ls_sql+=" and user_constraints.constraint_name=user_cons_columns.constraint_name ";
		ls_sql+=" and user_constraints.constraint_type='P' ";
		ls_sql+=" and user_constraints.table_name='"+table_name[i]+"' ";
//		out.println(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			key=rs.getString(1);
//			out.println(key);

			//查询外键
			for (int j=0;j<table_name.length ;j++ )
			{
				if (table_name[i].equals(table_name[j]))
				{
					continue;
				}

				ls_sql="select count(*) ";
				ls_sql+=" from user_tab_columns ";
				ls_sql+=" where table_name='"+table_name[j]+"' and column_name='"+key+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					count=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();
				if (count>0)
				{
					dw_wheresql+=" AND "+table_name[i]+"."+key+"="+table_name[j]+"."+key;
				}
			}
		}
		rs.close();
		ps.close();

	}

	if (!dw_wheresql.equals(""))
	{
		dw_wheresql=dw_wheresql.substring(5);
	}
	dw_fromsql=dw_fromsql.substring(1);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
<head>
<title>列参数维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" height="89">
  <tr align="center"> 
    <td height="36"> 
      <form method="post" action="insertColParam.jsp" name="selectTableForm">
        <table width="100%" border="1">
          <tr align="center"> 
            <td colspan="3"><font color="#3333FF">DataWindow名称</font> 
              <input type="text" name="dw_name" size="30" value="<%=dw_name%>" readonly="true">
            </td>
          </tr>
          <tr> 
            <td width="42%" valign="top" align="center"> <%
for (int i=0;i<table_name.length ;i++ )
{
%> <font color="#3333FF">表名称：<%=table_name[i]%> </font> 
              <select name="<%=table_name[i]%>" style="FONT-SIZE:12px;WIDTH:200px" size="6" multiple ondblclick="moveItem(this,selectedField)">
                <%
		ls_sql=" select '"+table_name[i]+"'||'.'||column_name,'"+table_name[i]+"'||'.'||column_name||'('||NVL(comments,'无说明')||')' from user_col_comments where table_name='"+table_name[i]+"'";
		cf.selectItem(out,ls_sql,"");
%> 
              </select>
              <BR>
              <%
}
%> </td>
            <td width="13%" align="center" > 
              <p> 
                <input type="button"  value="&lt;===" onClick="moveField(selectTableForm)" name="button">
              </p>
              <p> 
                <input type="button"  value="===&gt;" onclick="addField(selectTableForm)">
              </p>
            </td>
            <td width="45%" valign="top" align="center"> 
              <font size="2">被选择字段名</font>
              <br> 
                <select name="selectedField" size="17" style="FONT-SIZE:12px;WIDTH:200px" multiple ondblclick="moveField(selectTableForm)">
                </select>
            </td>
          </tr>
          <tr>
            <td colspan="3" align="center" height="2"> SQL： 
              <input type="text" name="dw_sql" size="83" value="<%=dw_sql%>">
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2"><font color="#3333FF">FROM:</font> 
              <input type="text" name="dw_fromsql" size="83" value="<%=dw_fromsql%>" readonly="true">
            </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td colspan="3" height="2"> WHERE: 
              <textarea name="dw_wheresql" rows="3" style="FONT-SIZE:12px;WIDTH:600px"><%=dw_wheresql%></textarea>
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2">Order By: 
              <input type="text" name="dw_ordersql" size="83" value="">
            </td>
          </tr>
          <tr> 
            <td width="42%" align="center" height="2">&nbsp; </td>
            <td width="13%" height="2">&nbsp; </td>
            <td width="45%" height="2">&nbsp; </td>
          </tr>
          <tr> 
            <td colspan="3" height="11" align="center"> 
              <input type="button"  value="下一步" onClick="f_do(selectTableForm)" >
              <input type="reset"  value="重选" name="reset">
            </td>
          </tr>
        </table>
        </form>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	selectAll(FormName.selectedField);
	FormName.submit();
	return true;
}

function addField(FormName)
{
<%
	for (int j=0;j<table_name.length ;j++ )
	{
%>
		for (var i=0; i<FormName.<%=table_name[j]%>.options.length; i++)
		{
			if (FormName.<%=table_name[j]%>.options[i].selected)
			{
				var op1=document.createElement("OPTION");
				op1.text=FormName.<%=table_name[j]%>.options[i].text;
				op1.value=FormName.<%=table_name[j]%>.options[i].value;
				FormName.selectedField.add(op1);
			}
		}
		for (var i=FormName.<%=table_name[j]%>.options.length-1; i>=0; --i)
		{
			if (FormName.<%=table_name[j]%>.options[i].selected)
			{
				FormName.<%=table_name[j]%>.remove(i);
			}
		}
<%
	}
%>
}

function moveField(FormName)
{
	for (var i=0; i<FormName.selectedField.options.length; i++)
	{
		if (FormName.selectedField.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.selectedField.options[i].text;
			op1.value=FormName.selectedField.options[i].value;
			//取表名
			var lstart=op1.value.indexOf(".");
			var tableName=op1.value.substring(0,lstart);
			//增加到相应的列表中
			eval("FormName."+tableName+".add(op1)");
		}
	}
	for (var i=FormName.selectedField.options.length-1; i>=0; --i)
	{
		if (FormName.selectedField.options[i].selected)
		{
			FormName.selectedField.remove(i);
		}
	}
}
//-->
</script>
