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
<title>�����б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td colspan="2"> 
      <div align="center"><b><font size="4">ѡ��ͳ����</font></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="2"> 
      <div align="center"> 
        <form method='post' action='saveTjCol.jsp' name='selectTableForm'>
          <table width="100%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" bgcolor="#CCCCCC" > 
              <td>�����</td>
              <td>ͳ��</td>
              <td>����</td>
              <td>������</td>
              <td>�����</td>
              <td>Where</td>
              <td>��Χ</td>
              <td>�ɶ�ѡ</td>
              <td>�ֶ�������</td>
              <td>����</td>
              <td>�ֶ�Ӣ����</td>
              <td>�ֶ�����</td>
              <td>��ʾ����</td>
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
		String issum=null;
		String isgroupby=null;
		String isgroupbywhere=null;
		String istjmutil=null;
		String coltype=null;
		String groupbyxh=null;
		String istjmultiple=null;
		String zb=null;
	
	
		ls_sql="select table_name,column_name,DECODE(data_type,'VARCHAR2','�ַ�','CHAR','�ַ�','DOUBLE','С��','INT','����','DATE','����') data_type,data_length,column_china,nullable,column_type ";
		ls_sql+=",column_id,data_default,issum,isgroupby,isgroupbywhere,istjmutil,coltype,groupbyxh,zb,istjmultiple ";
		ls_sql+=" from jdatawindow where dw_name='"+dw_name+"' order by groupbyxh,column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;
			istjmultiple=cf.fillNull(rs.getString("istjmultiple"));
			zb=cf.fillNull(rs.getString("zb"));
			coltype=cf.fillNull(rs.getString("coltype"));
			groupbyxh=cf.fillNull(rs.getString("groupbyxh"));
			table_name=rs.getString("table_name");
			column_name=rs.getString("column_name");
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type");
			column_id=rs.getInt("column_id");
			issum=cf.fillNull(rs.getString("issum"));
			isgroupby=cf.fillNull(rs.getString("isgroupby"));
			isgroupbywhere=cf.fillNull(rs.getString("isgroupbywhere"));
			istjmutil=cf.fillNull(rs.getString("istjmutil"));
			data_default=cf.fillNull(rs.getString("data_default"));
			if (column_type.equals("E"))
			{
				column_type="�༭��";
			}
			else if (column_type.equals("ME"))
			{
				column_type="���б༭��";
			}
			else if (column_type.equals("S"))
			{
				column_type="�����б��";
			}
			else if (column_type.equals("SDB"))
			{
				column_type="���ݿ������б��";
			}
			else if (column_type.equals("R"))
			{
				column_type="��ѡť";
			}
			else if (column_type.equals("RDB"))
			{
				column_type="���ݿⵥѡť";
			}
			out.println("  <tr  bgcolor=\"#FFFFFF\" >\r\n");
			out.println("    <td><input type='text' name='groupbyxh' size='2' value='"+groupbyxh+"' >");
			out.println("    <input type='hidden' name='column_id' value='"+column_id+"' ></td>\r\n");
			if (isgroupby.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='isgroupby' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='isgroupby' value='"+column_id+"' ></td>\r\n");
			}
			if (issum.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='issum' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='issum' value='"+column_id+"' ></td>\r\n");
			}
			out.println("    <td>\r\n");
			out.println("    <select name=\"coltype\" style=\"FONT-SIZE:12px;WIDTH:60px\">\r\n");
			cf.selectToken(out, "+&3+��С��&1+��С��&4+���ϲ���&5+�в���ʾ&2+��ֵ��",coltype);
			out.println("    </select>\r\n");
			out.println("    </td>\r\n");
			out.println("    <td>\r\n");
			out.println("    <select name=\"zb\" style=\"FONT-SIZE:12px;WIDTH:30px\">\r\n");
			cf.selectToken(out, "+&1+1&2+2&3+3&4+4&5+5&6+6",zb);
			out.println("    </select>\r\n");
			out.println("    </td>\r\n");
			if (isgroupbywhere.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='isgroupbywhere' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='isgroupbywhere' value='"+column_id+"' ></td>\r\n");
			}
			if (istjmutil.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='istjmutil' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='istjmutil' value='"+column_id+"' ></td>\r\n");
			}
			if (istjmultiple.equals("Y"))
			{
				out.println("    <td><input type='checkbox' checked name='istjmultiple' value='"+column_id+"' ></td>\r\n");
			}
			else{
				out.println("    <td><input type='checkbox' name='istjmultiple' value='"+column_id+"' ></td>\r\n");
			}

			out.println("    <td>"+column_china+"</td>\r\n");
			out.println("    <td>"+table_name+"</td>\r\n");
			out.println("    <td>"+column_name+"</td>\r\n");
			out.println("    <td>"+data_type+"</td>\r\n");
			out.println("    <td>"+column_type+"\r\n");
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
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%> 
            <tr align="center" bgcolor="#CCCCCC" > 
              <td colspan='15'> 
                <input type="button"  value="Whereȫѡ"  onClick="checkAllWhere(selectTableForm)">
                <input type="button"  value="����"  onClick="f_do(selectTableForm)">
                <input type="reset"  value="��ѡ" >
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="editTjCol.jsp?dw_name=<%=dw_name%>&ref=0">
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

var wheremark=1;
function checkAllWhere(formName)//
{
	var i = 0;
	if (<%=row%>==1){
		if (wheremark==0)
		{
			formName.isgroupbywhere.checked =false
		}
		else{
			formName.isgroupbywhere.checked =true
		}
	}
	else{ 
		for (i=0;i <<%=row%>;i++ ){
			if (wheremark==0)
			{
				formName.isgroupbywhere[i].checked =false
			}
			else{
				formName.isgroupbywhere[i].checked =true
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
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.submit();
}
//-->
</script>
