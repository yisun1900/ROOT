<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�������ֶβ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String dw_name=request.getParameter("dw_name");
String dw_note=cf.GB2Uni(request.getParameter("dw_note"));
String dw_fromsql=request.getParameter("dw_fromsql");
String dw_wheresql=request.getParameter("dw_wheresql");
String dw_ordersql=request.getParameter("dw_ordersql");
String[] column_names=request.getParameterValues("selectedField");
String dw_pritable=request.getParameter("dw_pritable");
if (dw_pritable==null)
{
	out.println("û��ѡ������");
	return;
}

//�滻�س������ַ�
dw_wheresql=dw_wheresql.replace((char)13,(char)32);
dw_wheresql=dw_wheresql.replace((char)10,(char)32);
dw_fromsql=dw_fromsql.replace((char)13,(char)32);
dw_fromsql=dw_fromsql.replace((char)10,(char)32);
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <b><font size="2">�޸�DataWindow->���ݴ����ֶ����� <font color="#FF0033">&lt;����:<%=dw_pritable%>&gt;</font></font></b> 
</CENTER>
<FORM method='post' action='SaveEditDwColParam.jsp' name="formname">
  <table width="130%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
	<input type='hidden' name="dw_pritable" value="<%=dw_pritable%>">
	<input type='hidden' name="dw_fromsql" value="<%=dw_fromsql%>">
	<input type='hidden' name="dw_wheresql" value="<%=dw_wheresql%>">
	<input type='hidden' name="dw_ordersql" value="<%=dw_ordersql%>">
    <tr align="center" bgcolor="#CCCCCC" > 
      <td width="4%">���</td>
      <td width="6%">����</td>
      <td width="8%">�ֶ���</td>
      <td width="10%">�ֶ�˵��</td>
      <td width="3%">����</td>
      <td width="10%">��ʾ����</td>
      <td width="35%">ѡ������</td>
      <td width="5%">ȱʡֵ</td>
      <td width="8%">�ֶ�����</td>
      <td width="5%">�ֶγ���</td>
      <td width="3%">�ɿ�</td>
    </tr>
    <%
	Connection conn  = null;

	Statement stmt=null;
	ResultSet rs=null;
	String ls_sql=null;
		
	String table_name=null;
	String column_name=null;
	String data_type=null;
	int data_length=0;
	String column_china=null;
	String nullable=null;
	String column_type=null;
	String type_date=null;
	int column_id=0;
	String data_default=null;
	String iskey=null;

	int data_precision=0;
	int data_scale=0;
	
	int pos=0;
	int count=0;

	try {

		conn=cf.getConnection();
		stmt = conn.createStatement();
		
		for (int j=0;j<column_names.length ;j++ )
		{
			pos=column_names[j].indexOf(".");
			table_name=column_names[j].substring(0,pos);
			column_names[j]=column_names[j].substring(pos+1);

			ls_sql="select table_name,column_name,data_type,data_length,column_china,nullable,column_type,type_date,data_default ";
			ls_sql+=" from jdatawindow ";
			ls_sql+=" where dw_name='"+dw_name+"' and table_name='"+table_name+"' and column_name='"+column_names[j]+"'";
//			out.println("<BR>ls_sql="+ls_sql);
			rs =stmt.executeQuery(ls_sql);
			if (rs.next())
			{
				table_name=rs.getString("table_name");
				column_name=rs.getString("column_name");
				data_type=rs.getString("data_type");
				data_length=rs.getInt("data_length");
				column_china=rs.getString("column_china");
				nullable=rs.getString("nullable");
				column_type=rs.getString("column_type");
				type_date=cf.fillNull(rs.getString("type_date"));
				data_default=cf.fillNull(rs.getString("data_default"));
//				out.println(type_date);
			}
			else{
				rs.close();

				ls_sql="select comments,data_type,data_length,data_precision,data_scale,nullable,data_default ";
				ls_sql+=" from user_tab_columns,user_col_comments ";
				ls_sql+=" where user_tab_columns.table_name=user_col_comments.table_name";
				ls_sql+=" and user_tab_columns.column_name=user_col_comments.column_name";
				ls_sql+=" and user_tab_columns.table_name='"+table_name+"'";
				ls_sql+=" and user_tab_columns.column_name='"+column_names[j]+"'";
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
					column_type="";
					type_date="";

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
    <tr align="center" bgcolor="#FFFFFF" > 
      <td > 
        <input type='text' name='column_id'  value="<%=(j+1)%>" maxlength='5' size='2'>
      </td>
      <td > 
        <input type='text' name='table_name' value='<%=table_name%>'  size='10'>
      </td>
      <td > 
        <input type='text' name='column_name' value='<%=column_names[j]%>'  size='8'>
      </td>
      <td > 
        <input type='text' name='column_china' value='<%=column_china%>' maxlength='80' size='12'>
      </td>
      <td > 
        <input type='text' name='iskey' value='<%=iskey%>' maxlength='1' size='1' >
      </td>
      <td > 
        <select name='column_type' style="FONT-SIZE:12px;WIDTH:100px">
<%
	cf.selectToken(out, "E+�༭��&ME+���б༭��&S+�����б���&SDB+���ݿ������б���&R+��ѡť&RDB+���ݿⵥѡť",column_type);
%> 
        </select>
      </td>
      <td > 
        <input type='text' name='type_date' maxlength='400' size='55' value="<%=type_date%>">
      </td>
      <td > 
        <input type='text' name='data_default'  value="<%=data_default%>" maxlength='100' size='5'>
      </td>
      <td > 
        <input type='text' name='data_type' value="<%=data_type%>" size='10'>
      </td>
      <td > 
        <input type='text' name='data_length' value='<%=data_length%>' size='5'>
      </td>
      <td > 
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
    <tr  bgcolor="#CCCCCC" > 
      <td colspan='11'> 
	    ���ݴ������� 
        <input type="text" name="dw_name" size="10" maxlength="40" value="<%=dw_name%>" readonly>
        ���ݴ���˵�� </font>
 		<input type="text" name="dw_note" maxlength="100" size="20" value="<%=dw_note%>">
		<input type="submit"  value="����"  onClick="return f_do(formname);"  >
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