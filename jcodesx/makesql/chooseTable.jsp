<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>ѡ�����ݴ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="dwform">
  <table width="100%" border="0">
    <tr align="center"> 
      <td> ѡ�����ݱ� 
        <select name="tablename"  >
		<option value=""></option>
<%
		cf.selectItem(out,"select table_name,table_name||'('||NVL(comments,'��˵��')||')' from user_tab_comments ","");
%> 
        </select>
        <input type="button"  value="InsertSQL" onClick="f_insert(dwform)">
        <input type="button"  value="EditSQL" onClick="f_edit(dwform)">
        <input type="button"  value="SelectSQL" onClick="f_select(dwform)">
      <input type="button" onClick="f_check(dwform)"  value="���SQL">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_edit(dwform)
{
	if(	dwform.tablename.value=="") {
		alert("��ѡ�����ݱ�");
		dwform.tablename.focus();
		return false;
	}
	parent.main.location="makeEditSQL.jsp?tablename="+dwform.tablename.value;
}
function f_insert(dwform)
{
	if(	dwform.tablename.value=="") {
		alert("��ѡ�����ݱ�");
		dwform.tablename.focus();
		return false;
	}
	parent.main.location="makeInsertSQL.jsp?tablename="+dwform.tablename.value;
}
function f_select(dwform)
{
	if(	dwform.tablename.value=="") {
		alert("��ѡ�����ݱ�");
		dwform.tablename.focus();
		return false;
	}
	parent.main.location="makeSelectSQL.jsp?tablename="+dwform.tablename.value;
}
function f_check(dwform)
{
	parent.main.location="checkField.jsp";
}
//-->
</SCRIPT>
