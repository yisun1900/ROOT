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
<form method="post" action="SaveInsertDm_zwflbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">职务分类编码</td> 
  <td width="35%"> 
    <input type="text" name="zwflbm" value="" size="20" maxlength="1" >
  </td>
  <td align="right" width="15%">职务分类名称</td> 
  <td width="35%"> 
    <input type="text" name="zwflmc" value="" size="20" maxlength="5" >
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
	if(	javaTrim(FormName.zwflbm)=="") {
		alert("请输入[职务分类编码]！");
		FormName.zwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zwflmc)=="") {
		alert("请输入[职务分类名称]！");
		FormName.zwflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
