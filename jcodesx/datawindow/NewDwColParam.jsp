<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*,ybl.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�������ֶβ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dw_pritable=request.getParameter("dw_pritable");
String dw_fromsql=request.getParameter("dw_fromsql");
String dw_wheresql=request.getParameter("dw_wheresql");
if (dw_pritable==null)
{
	out.println("û��ѡ������");
	return;
}
%> 

<body bgcolor="#FFFFFF">
<CENTER>
  <b><font size="2">�����µ�DataWindow->���ݴ����ֶ����� <font color="#FF0033">&lt;����:<%=dw_pritable%>&gt;</font></font></b> 
</CENTER>
<FORM method='post' action='SaveNewDwColParam.jsp' name="formname">
  <table width="120%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2"  bgcolor="#999999" >
    <input type='hidden' name="dw_pritable" value="<%=dw_pritable%>">
    <input type='hidden' name="dw_fromsql" value="<%=dw_fromsql%>">
    <input type='hidden' name="dw_wheresql" value="<%=dw_wheresql%>">
    <tr bgcolor="#CCCCCC" > 
      <td width="4%" align="center">���</td>
      <td width="6%" align="center">����</td>
      <td width="8%" align="center">�ֶ���</td>
      <td width="12%" align="center">�ֶ�˵��</td>
      <td width="3%" align="center">����</td>
      <td width="10%" align="center">��ʾ����</td>
      <td width="25%" align="center">ѡ������</td>
      <td width="5%" align="center">ȱʡֵ</td>
      <td width="8%" align="center">�ֶ�����</td>
      <td width="5%" align="center">�ֶγ���</td>
      <td width="3%" align="center">�ɿ�</td>
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
				
				if (data_type.equals("NUMBER"))//�ֶ�����Ϊ����
				{
					if (data_scale==0){//��С��λ
						data_type="INT";
						data_length=data_precision;//�ֶγ���
						if (data_length>18)
						{
							data_length=18;//�ֶγ���
						}
					}
					else{//��С��λ
						data_type="DOUBLE";
						data_length=data_precision+1;//�ֶγ���
					}
				}
				else if (data_type.equals("DATE"))//�ֶ�����Ϊ����
				{
					data_length=10;//�ֶγ���
				}

			}
			rs.close();

			//��������
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
          <option value='E'>�༭��</option>
          <option value='ME'>���б༭��</option>
          <option value='S'>�����б��</option>
          <option value='SDB'>���ݿ������б��</option>
          <option value='R'>��ѡť</option>
          <option value='RDB'>���ݿⵥѡť</option>
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
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}

%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="11" > <font color="#CC00CC">
	    ���ݴ������� 
        <input type="text" name="dw_name" size="10" maxlength="40" value="<%=dw_pritable.toLowerCase()%>">
        ���ݴ���˵�� </font>
		<input type="text" name="dw_note" maxlength="100" size="20">
		<input type="submit"  value="����" onClick="return f_do(formname);"  >
        <input type="reset" value="����">
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
		alert("������[���ݴ�������]��");
		FormName.dw_name.focus();
		return false;
	}
	if(	javaTrim(FormName.dw_note)=="") {
		alert("������[���ݴ���˵��]��");
		FormName.dw_note.focus();
		return false;
	}
	FormName.submit();
	return true;
}

//-->
</script>
