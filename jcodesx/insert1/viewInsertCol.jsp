<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.awt.*,ybl.sql.connection.*' %>
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
    <td colspan="2" height="2"> 
      <div align="center"> 
        <form method='post' action='saveColumnParam.jsp' name='selectTableForm' target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12"cellpadding="2" cellspacing="2"  bgcolor="#999999" >
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" bgcolor="#CCCCCC" > 
              <td>���</td>
              <td>ѡ��</td>
              <td>����</td>
              <td>�ֶ�������</td>
              <td>�ֶ�Ӣ����</td>
              <td>�ֶ�����</td>
              <td>�ֶγ���</td>
              <td>����</td>
              <td>��</td>
              <td>��ʾ����</td>
              <td>ȱʡֵ</td>
            </tr>
            <%
	Connection conn  = null;
	Statement stmt=null;
	ResultSet rs=null;
		
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
		String iskey=null;
		String isinsert=null;
	
		ls_sql="select DECODE(isinsert,'Y','Y','N','&nbsp;') isinsert,iskey,table_name,column_name,data_type,data_length,column_china,nullable,column_type,column_id,data_default ";
		ls_sql+=" from jdatawindow ";
		ls_sql+=" where dw_name='"+dw_name+"' order by column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			isinsert=rs.getString("isinsert");
			iskey=rs.getString("iskey");
			table_name=rs.getString("table_name");
			column_name=rs.getString("column_name");
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type");
			column_id=rs.getInt("column_id");
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
			out.println("    <td>"+column_id+"</td>\r\n");
			out.println("    <td>"+isinsert+"</td>\r\n");
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
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%> 
            <tr align="center" bgcolor="#CCCCCC" > 
              <td colspan='11'> 
                <input type="button"  value="���ɲ���ҳ��" onClick="makeInsertPage(selectTableForm)" >
                <input type="button"  value="���ɲ������ҳ" onClick="makeInsertCode(selectTableForm)">
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="viewInsertCol.jsp?dw_name=<%=dw_name%>&ref=0">
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

function makeInsertPage(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeInsertPage.jsp";
	FormName.submit();
}
function makeInsertCode(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeInsertCode.jsp";
	FormName.submit();
}
//-->
</script>
