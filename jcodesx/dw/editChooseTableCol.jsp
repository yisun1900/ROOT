<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,txin.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>


<html>
<%
String dw_name=request.getParameter("dw_name");
String[] table_name=request.getParameterValues("table_name");
String dw_sql="";
String dw_fromsql="";
String dw_wheresql="";
String dw_ordersql="";
String dw_pritable="";

String tableSQL=cf.arrayToStr(table_name,",'","'").substring(1);


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//��ѯ����
	ls_sql="select dw_sql,dw_fromsql,dw_wheresql,dw_ordersql,dw_pritable ";
	ls_sql+=" from jdatawindow_note ";
	ls_sql+=" where dw_name='"+dw_name+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dw_sql=cf.fillNull(rs.getString("dw_sql"));
		dw_fromsql=rs.getString("dw_fromsql");
		dw_wheresql=rs.getString("dw_wheresql");
		dw_ordersql=cf.fillNull(rs.getString("dw_ordersql"));
		dw_pritable=rs.getString("dw_pritable");
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
<head>
<title>�в���ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" height="89">
  <tr align="center"> 
    <td height="36"> 
      <form method="post" action="editColParam.jsp" name="selectTableForm">
        <table width="100%" border="1">
          <tr align="center"> 
            <td colspan="3"><font color="#3333FF">DataWindow����</font> 
              <input type="text" name="dw_name" size="30" value="<%=dw_name%>" readonly="true">
            </td>
          </tr>
          <tr> 
            <td width="42%" valign="top" align="center"> <%
for (int i=0;i<table_name.length ;i++ )
{
%> <font color="#3333FF">�����ƣ�<%=table_name[i]%> </font> 
              <select name="<%=table_name[i]%>" style="FONT-SIZE:12px;WIDTH:200px" size="6" multiple ondblclick="moveItem(this,selectedField)">
<%
		ls_sql=" select '"+table_name[i]+"'||'.'||column_name,'"+table_name[i]+"'||'.'||column_name||'('||NVL(comments,'��˵��')||')'";
		ls_sql+=" from user_col_comments ";
		ls_sql+=" where table_name='"+table_name[i]+"' ";
		ls_sql+=" and column_name not in(select column_name from jdatawindow where table_name='"+table_name[i]+"' and dw_name='"+dw_name+"')";
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
              <font size="2">��ѡ���ֶ���</font>
              <br> 
                <select name="selectedField" size="17" style="FONT-SIZE:12px;WIDTH:200px" multiple ondblclick="moveField(selectTableForm)">
<%
		ls_sql="select jdatawindow.table_name||'.'||jdatawindow.column_name,jdatawindow.table_name||'.'||jdatawindow.column_name||'('||NVL(comments,'��˵��')||')' ";
		ls_sql+=" from jdatawindow,user_col_comments ";
		ls_sql+=" where jdatawindow.table_name=user_col_comments.table_name ";
		ls_sql+=" and jdatawindow.column_name=user_col_comments.column_name ";
		ls_sql+=" and dw_name='"+dw_name+"' and jdatawindow.table_name in ("+tableSQL+") ";
		ls_sql+=" order by column_id";
		System.out.println(ls_sql);
		cf.selectItem(out,ls_sql,"");
%> 
                </select>
            </td>
          </tr>
          <tr>
            <td colspan="3" align="center" height="2"> SQL�� 
              <input type="text" name="dw_sql" size="83" value="<%=dw_sql%>">
            </td>
          </tr>
          <tr> 
            <td colspan="3" align="center" height="2"><font color="#0000FF">FROM:</font> 
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
              <input type="text" name="dw_ordersql" size="83" value="<%=dw_ordersql%>">
            </td>
          </tr>
          <tr> 
            <td width="42%" align="center" height="2">&nbsp; </td>
            <td width="13%" height="2">&nbsp; </td>
            <td width="45%" height="2">&nbsp; </td>
          </tr>
          <tr> 
            <td colspan="3" height="11" align="center"> 
              <input type="button"  value="��һ��" onClick="f_do(selectTableForm)" >
              <input type="reset"  value="��ѡ" name="reset">
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
			//ȡ����
			var lstart=op1.value.indexOf(".");
			var tableName=op1.value.substring(0,lstart);
			//���ӵ���Ӧ���б���
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
