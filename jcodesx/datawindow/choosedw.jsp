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
		cf.selectItem(out,"select dw_name,dw_name||':'||dw_note from jdatawindow_note order by xh desc","");
%> 
        </select>
        <input type="button"  value="修改" onclick="editdw(dwform)">
        <input type="button"  value="NEW" onclick="newdw(dwform)">
        <input type="button"  value="COPY" onclick="copydw(dwform)">
        <input type="button"  value="删除" onclick="deletedw(dwform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function editdw(dwform)
{
	if(	dwform.dw_name.value=="") {
		alert("请选择数据窗口！");
		dwform.dw_name.focus();
		return false;
	}
	parent.main.location="EditChooseTable.jsp?dw_name="+dwform.dw_name.value+"&ref=1";
}
function newdw(dwform)
{
	parent.main.location="NewChooseTable.jsp?dw_name="+dwform.dw_name.value;
}
function copydw(dwform)
{
	if(	dwform.dw_name.value=="") {
		alert("请选择数据窗口！");
		dwform.dw_name.focus();
		return false;
	}
	parent.main.location="CopyViewDW.jsp?dw_name="+dwform.dw_name.value+"&ref=1";
}
function deletedw(dwform)
{
	if(	dwform.dw_name.value=="") {
		alert("请选择数据窗口！");
		dwform.dw_name.focus();
		return false;
	}
	if ( confirm("确实要删除吗?") )	
	{
		window.open("DeleteDW.jsp?dw_name="+dwform.dw_name.value);
	}
}
//-->
</SCRIPT>
