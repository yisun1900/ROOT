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
      <div align="center"><b><font size="4">�鿴��ѯ��</font></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="2"> 
      <div align="center"> 
        <form method='post' action='' name='selectTableForm' target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2"  bgcolor="#999999">
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" > 
              <td bgcolor="#CCCCCC">���</td>
              <td bgcolor="#CCCCCC">Select</td>
              <td bgcolor="#CCCCCC">Where</td>
              <td bgcolor="#CCCCCC">��Χ</td>
              <td bgcolor="#CCCCCC">�ɶ�ѡ</td>
              <td bgcolor="#CCCCCC">����</td>
              <td bgcolor="#CCCCCC">�ֶ�������</td>
              <td bgcolor="#CCCCCC">����</td>
              <td bgcolor="#CCCCCC">�ֶ�Ӣ����</td>
              <td bgcolor="#CCCCCC">�ֶ�����</td>
              <td bgcolor="#CCCCCC">�ֶγ���</td>
              <td bgcolor="#CCCCCC">��</td>
              <td bgcolor="#CCCCCC">��ʾ����</td>
              <td bgcolor="#CCCCCC">ȱʡֵ</td>
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
		String isselect=null;
		String isselectwhere=null;
		String iscxmutil=null;
		String iscxmultiple=null;
		String iskey=null;
	
	
		ls_sql="select table_name,column_name,data_type,data_length,column_china,nullable,column_type ";
		ls_sql+=",column_id,data_default,isselect,isselectwhere,iscxmutil,iscxmultiple,iskey ";
		ls_sql+=" from jdatawindow where dw_name='"+dw_name+"' order by column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
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
			data_default=cf.fillNull(rs.getString("data_default"));
			iscxmutil=cf.fillNull(rs.getString("iscxmutil"));
			iscxmultiple=cf.fillNull(rs.getString("iscxmultiple"));
			iskey=cf.fillNull(rs.getString("iskey"));
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
			if (isselect.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (isselectwhere.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (iscxmutil.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (iscxmultiple.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}

			out.println("    <td>"+iskey+"\r\n");
			out.println("    <td>"+column_china+"</td>\r\n");
			out.println("    <td>"+table_name+"</td>\r\n");
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
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%> 
            <tr align="center" bgcolor="#FFFFFF" > 
              <td colspan='14'> 
                <label for="xg">�޸�</label>  
                <input type="checkbox" name="editbox" value="Y" checked id="xg">
                <label for="ck">�鿴</label> 
                <input type="checkbox" name="viewbox" value="Y" checked id="ck">
                <label for="sc">ɾ��</label> 
                <input type="checkbox" name="deletebox" value="Y" checked id="sc">
                <label for="zh">ת������</label> 
                <input type="checkbox" name="zhdmbox" value="Y" checked id="zh">
                <label for="fy">��ҳ</label> 
                <input type="checkbox" name="pagebox" value="Y" checked id="fy">
                <label for="hz">����</label> 
                <input type="checkbox" name="sumbox" value="Y"  id="hz">
                <label for="qz">��Ҫ����ǰ׺</label> 
                <input type="checkbox" name="tablebox" value="Y" id="qz">
                <label for="cn">��������</label>
                <input type="checkbox" name="colnamebox" value="Y" id="cn">
              </td>
            </tr>
            <tr align="center" > 
              <td colspan='14' bgcolor="#CCCCCC"> 
                <input type="button"  value="���ɲ�ѯ����ҳ" onClick="makeSelectPage(selectTableForm)">
                <input type="button"  value="���ɲ�ѯ���ҳ" onClick="makeSelectList(selectTableForm)">
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="viewSelectCol.jsp?dw_name=<%=dw_name%>&ref=0">
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


function makeSelectPage(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeSelectPage.jsp";
	FormName.submit();
}
function makeSelectList(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeSelectList.jsp";
	FormName.submit();
}
//-->
</script>
