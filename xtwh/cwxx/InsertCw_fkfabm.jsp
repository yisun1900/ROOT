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
<form method="post" action="SaveInsertCw_fkfabm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">付款方案编码（2位）</td> 
  <td width="29%"> 
    <input type="text" name="fkfabm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="16%">付款方案名称</td> 
  <td width="34%"> 
    <input type="text" name="fkfamc" value="" size="30" maxlength="50" >
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
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请输入[付款方案编码]！");
		FormName.fkfabm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkfamc)=="") {
		alert("请输入[付款方案名称]！");
		FormName.fkfamc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
