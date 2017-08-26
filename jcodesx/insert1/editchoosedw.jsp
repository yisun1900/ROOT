<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>选择数据窗口</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="dwform">
  <table width="100%" border="0">
    <tr align="center"> 
      <td> 选择数据窗口 
        <select name="dw_name"  >
		<option value=""></option>
<%
		cf.selectItem(out,"select dw_name,dw_name||':'||dw_note from jdatawindow_note order by dw_name","");
%> 
        </select>
        <input type="button"  value="确定" onclick="getdw(dwform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getdw(dwform)
{
	parent.main.location="editInsertCol.jsp?dw_name="+dwform.dw_name.value+"&ref=1";
}
//-->
</SCRIPT>
