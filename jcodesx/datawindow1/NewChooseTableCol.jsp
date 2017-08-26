<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<%
String[] table_name=request.getParameterValues("table_name");
String dw_fromsql="";
String dw_wheresql="";
String dw_sql="";
String ls="";
String ls1="";


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

	for (int i=table_name.length-1;i>=0 ;i-- )
	{
		dw_fromsql+=","+table_name[i];

		//查询主键
		ls_sql="select user_cons_columns.column_name ";
		ls_sql+=" from user_constraints,user_cons_columns ";
		ls_sql+=" where user_constraints.table_name=user_cons_columns.table_name ";
		ls_sql+=" and user_constraints.constraint_name=user_cons_columns.constraint_name ";
		ls_sql+=" and user_constraints.owner=user_cons_columns.owner ";
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
					ls=table_name[j]+"."+key+"="+table_name[i]+"."+key;
					ls1=table_name[i]+"."+key+"="+table_name[j]+"."+key;
					if ((dw_wheresql.indexOf(ls)==-1)&&(dw_wheresql.indexOf(ls1)==-1))
					{
						dw_wheresql+=" AND "+ls;
					}
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
      <form method="post" action="NewDwColParam.jsp" name="selectTableForm">
        <table width="100%" border="1">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="3" bgcolor="#CCCCFF" height="25"><b><font size="2">生成新的DataWindow->请选择字段</font></b></td>
          </tr>
          <tr> 
            <td width="46%" valign="top" align="center"> <%
for (int i=0;i<table_name.length ;i++ )
{
%> <b><font color="#3333FF" size="2">表名称：<%=table_name[i]%> </font></b> 
              <input type="radio" name="dw_pritable" value="<%=table_name[i]%>">
              <font color="#FF0033" size="2">主表</font><BR> 
              <select name="<%=table_name[i]%>" style="FONT-SIZE:12px;WIDTH:200px" size="6" multiple ondblclick="moveItem(this,selectedField)">
                <%
		ls_sql="select '"+table_name[i]+"'||'.'||user_tab_columns.column_name,'"+table_name[i]+"'||'.'||user_tab_columns.column_name||'('||NVL(comments,'无说明')||')' ";
		ls_sql+=" from user_tab_columns,user_col_comments ";
		ls_sql+=" where user_tab_columns.table_name=user_col_comments.table_name";
		ls_sql+=" and user_tab_columns.column_name=user_col_comments.column_name";
		ls_sql+=" and user_tab_columns.table_name='"+table_name[i]+"'";
		ls_sql+=" order by column_id";
		cf.selectItem(out,ls_sql,"");
%> 
              </select>
              <BR>
              <%
}
%> </td>
            <td width="13%" align="center" > 
              <p> 
                <input type="button"  value="&lt;===" onClick="moveField(selectTableForm)" >
              </p>
              <p> 
                <input type="button"  value="===&gt;" onclick="addField(selectTableForm)">
              </p>
              <p>&nbsp;</p>
              <p> 
                <input type="button"  value="继续" onClick="f_do(selectTableForm)"  >
              </p>
              <p> 
                <input type="reset"  value="重选" name="reset">
              </p>
            </td>
            <td width="41%" valign="top" align="center"> <font size="2">被选择字段名</font> 
              <br>
              <select name="selectedField" size="17" style="FONT-SIZE:12px;WIDTH:200px" multiple ondblclick="moveField(selectTableForm)">
              </select>
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2"><font color="#3333FF">FROM:</font> 
              <input type="text" name="dw_fromsql" size="83" value="<%=dw_fromsql%>" readonly="true">
            </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td colspan="3" height="2">WHERE: 
              <textarea name="dw_wheresql" rows="3" style="FONT-SIZE:12px;WIDTH:595px"><%=dw_wheresql%></textarea>
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2">Order By: 
              <input type="text" name="dw_ordersql" size="83" value="">
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2"> SQL： 
              <input type="text" name="dw_sql" size="83" value="<%=dw_sql%>">
            </td>
          </tr>
          <tr> 
            <td width="46%" align="center" height="2">&nbsp; </td>
            <td width="13%" height="2">&nbsp; </td>
            <td width="41%" height="2">&nbsp; </td>
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
	if (<%=table_name.length%>>1)
	{
		if(!radioChecked(FormName.dw_pritable)) {
			alert("请选择[主表]！");
			FormName.dw_pritable[0].focus();
			return false;
		}
	}
	else{
		if(!FormName.dw_pritable.checked) {
			alert("请选择[主表]！");
			FormName.dw_pritable.focus();
			return false;
		}
	}

	selectAll(FormName.selectedField);
	if(	javaTrim(FormName.selectedField)=="") {
		alert("请选择字段名！");
		FormName.selectedField.focus();
		return false;
	}
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
