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
<form method="post" action="SaveInsertCw_fklxbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款类型编码</td> 
  <td width="35%"> 
    <input type="text" name="fklxbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">付款类型名称</td> 
  <td width="35%"> 
    <input type="text" name="fklxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款大类</td> 
  <td width="35%"> 
    <select name="fkdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">家装款</option>
    <option value="2">集成款</option>
    <option value="3">集成订金</option>
    <option value="4">咨询收款</option>
    <option value="5">预付款</option>
    <option value="9">其它收款</option>
    </select>
  </td>
  <td align="right" width="15%">凭证分类</td> 
  <td width="35%"> 
    <input type="radio" name="pzfl"  value="1">工程款
    <input type="radio" name="pzfl"  value="2">集成款
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
	if(	javaTrim(FormName.fklxbm)=="") {
		alert("请输入[付款类型编码]！");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fklxmc)=="") {
		alert("请输入[付款类型名称]！");
		FormName.fklxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fkdl)=="") {
		alert("请选择[付款大类]！");
		FormName.fkdl.focus();
		return false;
	}
	if(	!radioChecked(FormName.pzfl)) {
		alert("请选择[凭证分类]！");
		FormName.pzfl[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
