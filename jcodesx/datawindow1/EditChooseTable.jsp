<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<html>
<head>
<title>�޸�DataWindow</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="./js/css.css">
</head>
<body bgcolor="#FFFFFF">
<%
String dw_name=request.getParameter("dw_name");
if (dw_name==null)
{
//	out.print("û��ѡ��DataWindow���ƣ�������ѡ��[DataWindow����]��");
	return;
}
%> 

<table width="100%" border="0"  class="p5">
  <tr align="center"> 
    <td  > 
      <form method="post" action="EditChooseTableCol.jsp" name="selectTableForm">
          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="3" bgcolor="#CCCCFF" height="36"><b><font size="4">�޸�DataWindow->��ѡ�����ݱ�</font></b></td>
          </tr>
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="3" height="39"><font color="#3333FF">DataWindow����</font> 
              <input type="text" name="dw_name" size="30" value="<%=dw_name%>" readonly="true">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="center" width="43%">ѡ���<BR> 
              <select name="selectedTable" style="FONT-SIZE:12px;WIDTH:220px" size="18" multiple  ondblclick="moveItem(selectedTable,table_name)" >
<%
		cf.selectItem(out,"select table_name,table_name||'('||NVL(comments,'��˵��')||')' from user_tab_comments where table_name not in(select table_name from jdatawindow where dw_name='"+dw_name+"')","");
%> 
              </select>
            </td>
            <td width="13%" align="center"> 
              <p>
                <input type="button"  value="&lt;===" onClick="moveItem(table_name,selectedTable)">
              </p>
              <p> 
                <input type="button"  value="===&gt;" onClick="moveItem(selectedTable,table_name)">
              </p>
            </td>
            <td width="44%" align="center"> ��ѡ������<BR>
			  <select name="table_name" style="FONT-SIZE:12px;WIDTH:220px" size="18" multiple  ondblclick="moveItem(table_name,selectedTable)">
<%
		cf.selectItem(out,"select distinct jdatawindow.table_name,jdatawindow.table_name||'('||NVL(comments,'��˵��')||')' from jdatawindow,user_tab_comments where jdatawindow.table_name=user_tab_comments.table_name and dw_name='"+dw_name+"'","");
%> 
              </select>
            </td>
          </tr>
          <tr align="center"> 
            <td colspan="3" > 
              <input type="button" value="ѡ����" onClick="f_xzl(selectTableForm)">
              <input type="reset" value="��ѡ">
            </td>
          </tr>
        </table>
      </form>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>

<form name="ref" method="post" action="EditChooseTable.jsp?dw_name=<%=dw_name%>&ref=0">
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	String ref=request.getParameter("ref");
	if (ref!=null && ref.equals("1"))
	{
		out.println("ref.submit();");
	}
%>


function f_xzl(FormName)//����FormName:Form������
{
	selectAll(FormName.table_name);


	if(	!selectChecked(FormName.table_name)) 
	{
		alert("��ѡ��[������]��");
		FormName.table_name.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
