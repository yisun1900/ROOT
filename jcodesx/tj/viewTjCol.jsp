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
<title>����ͳ�ƴ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td colspan="2"> 
      <div align="center"><b><font size="4">����ͳ�ƴ���</font></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" > 
      <div align="center"> 
        <form method='post' action='saveEditCol.jsp' name='selectTableForm' target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2"  bgcolor="#999999">
            <input type='hidden' name='dw_name' value="<%=dw_name%>">
            <tr align="center" bgcolor="#CCCCCC" > 
              <td >���</td>
              <td >ͳ��</td>
              <td >��ֵ</td>
              <td >������</td>
              <td>�����</td>
              <td >Where</td>
              <td >��Χ</td>
              <td>�ɶ�ѡ</td>
              <td >�ֶ�������</td>
              <td>����</td>
              <td >�ֶ�Ӣ����</td>
              <td>�ֶ�����</td>
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
		String groupbyxh=null;
		String data_default=null;
		String issum=null;
		String isgroupby=null;
		String isgroupbywhere=null;
		String istjmutil=null;
		String istjmultiple=null;
		String coltype=null;
		String zb=null;
	
	
		ls_sql="select coltype,table_name,column_name";
		ls_sql+=" ,DECODE(data_type,'VARCHAR2','�ַ�','CHAR','�ַ�','DOUBLE','С��','INT','����','DATE','����') data_type";
		ls_sql+=" ,data_length,column_china,nullable,column_type,zb ";
		ls_sql+=",groupbyxh,data_default,issum,isgroupby,isgroupbywhere,istjmutil,istjmultiple ";
		ls_sql+=" from jdatawindow where dw_name='"+dw_name+"' order by groupbyxh,column_id";
//		out.println("<BR>ls_sql="+ls_sql);
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			istjmultiple=cf.fillNull(rs.getString("istjmultiple"));
			zb=cf.fillNull(rs.getString("zb"));
			coltype=cf.fillNull(rs.getString("coltype"));
			table_name=rs.getString("table_name");
			column_name=rs.getString("column_name");
			data_type=rs.getString("data_type");
			data_length=rs.getInt("data_length");
			column_china=rs.getString("column_china");
			nullable=rs.getString("nullable");
			column_type=rs.getString("column_type");
			groupbyxh=cf.fillNull(rs.getString("groupbyxh"));
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


			out.println("  <tr  bgcolor=\"#FFFFFF\"  align='center'>\r\n");
			out.println("    <td>"+groupbyxh+"</td>\r\n");
			if (isgroupby.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (issum.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			out.println("    <td>\r\n");
			cf.selectToken(out, "3+��С��&1+��С��&4+���ϲ���&5+�в���ʾ&2+��ֵ��",coltype,true);
			out.println("    </td>\r\n");
			out.println("    <td>"+zb+"</td>\r\n");
			if (isgroupbywhere.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (istjmutil.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}
			if (istjmultiple.equals("Y"))
			{
				out.println("    <td align='center'>Y</td>\r\n");
			}
			else{
				out.println("    <td></td>\r\n");
			}

			out.println("    <td>"+column_china+"</td>\r\n");
			out.println("    <td>"+table_name+"</td>\r\n");
			out.println("    <td>"+column_name+"</td>\r\n");
			out.println("    <td>"+data_type+"</td>\r\n");
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
              <td colspan='14'> ͼ�η�ʽ��ʾ��� 
                <input type="checkbox" name="tx" value="Y" checked>
                ת������ 
                <input type="checkbox" name="zhdmbox" value="Y" checked>
                <input type="button"  value="����ͳ������ҳ" onClick="makeTjPage(selectTableForm)">
                <input type="button"  value="����ͳ�ƽ��ҳ" onClick="makeTjList(selectTableForm)">
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="viewTjCol.jsp?dw_name=<%=dw_name%>&ref=0">
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


function makeTjPage(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeTjPage.jsp";
	FormName.submit();
}
function makeTjList(FormName)
{
	if(FormName.dw_name.value=="null") {
		alert("��ѡ�����ݴ��� ��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="makeTjList.jsp";
	FormName.submit();
}
//-->
</script>
