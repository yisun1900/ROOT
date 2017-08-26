<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_sckhyxbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户意向编码</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxbm" value="" size="20" maxlength="1" >
  </td>
  <td align="right" width="15%">客户意向名称</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">对应状态</td> 
  <td width="35%"> 
    <input type="radio" name="zt"  value="1">跟踪
    <input type="radio" name="zt"  value="2">失败
    <input type="radio" name="zt"  value="5">准备移交
    <input type="radio" name="zt"  value="6">准备失败
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sckhyxbm)=="") {
		alert("请输入[客户意向编码]！");
		FormName.sckhyxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sckhyxmc)=="") {
		alert("请输入[客户意向名称]！");
		FormName.sckhyxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.zt)) {
		alert("请选择[对应状态]！");
		FormName.zt[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
