<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*,txin.sql.connection.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�������ֶβ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dw_name=request.getParameter("dw_name");
String dw_fromsql=request.getParameter("dw_fromsql");
String dw_wheresql=request.getParameter("dw_wheresql");
%> 

<body bgcolor="#FFFFFF">
<CENTER>
  <b>���ݴ����ֶ�����</b>
</CENTER>
<FORM method='post' action='saveColumnParam.jsp'>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2"  bgcolor="#999999" >
    <input type='hidden' name='dw_name' value='<%=dw_name%>'>
    <input type='hidden' name='dw_fromsql' value='<%=dw_fromsql%>'>
    <input type='hidden' name='dw_wheresql' value='<%=dw_wheresql%>'>
    <tr align="center" bgcolor="#CCCCCC" > 
      <td width="4%">���</td>
      <td width="6%">����</td>
      <td width="8%">�ֶ���</td>
      <td width="15%">�ֶ�˵��</td>
      <td width="10%">��ʾ����</td>
      <td width="25%">ѡ������</td>
      <td width="3%">����</td>
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
	String[] column_names=null;

	try {
		String column_china=null;
		String data_type=null;
		String nullable=null;
		int data_length=0;
		int data_precision=0;
		int data_scale=0;
		String data_default=null;

		conn=cf.getConnection();
		stmt = conn.createStatement();
	
		int pos=0;
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
%> 
    <tr align="center" bgcolor="#FFFFFF" > 
      <td > 
        <input type='text' name='column_id'  value='<%=(j+1)%>' maxlength='5' size='2'>
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
        <select name='column_type' style="FONT-SIZE:12px;WIDTH:100px">
          <option value='E'>�༭��</option>
          <option value='ME'>���б༭��</option>
          <option value='S'>�����б��</option>
          <option value='SDB'>���ݿ������б��</option>
          <option value='R'>��ѡť</option>
          <option value='RDB'>���ݿⵥѡť</option>
        </select>
      </td>
      <td > 
        <input type='text' name='type_date' maxlength='200' size='35'>
      </td>
      <td > 
        <select name='iskey' style="FONT-SIZE:12px;WIDTH:40px">
          <option value='N'>��</option>
          <option value='Y'>��</option>
        </select>
      </td>
      <td > 
        <input type='text' name='data_default'  value='<%=data_default%>' maxlength='100' size='5'>
      </td>
      <td > 
        <input type='text' name='data_type' value='<%=data_type%>' size='10'>
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
    <tr align="center" bgcolor="#CCCCCC" > 
      <td colspan="10" >
		<input type='submit' value='�ύ�ֶβ���'>
        <input type="reset" value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

