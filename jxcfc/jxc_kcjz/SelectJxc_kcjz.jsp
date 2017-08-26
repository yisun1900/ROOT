<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_kcjzList.jsp" name="selectform">
<div align="center">库存结转维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结转批号</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_jzph" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">仓库名称</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ckbh" size="20" maxlength="4" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">正常品总数量</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_zcpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">正常品总金额</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_zcpzjg" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">残次品总数量</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ccpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">残次品总金额</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ccpzje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">报废品总数量</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_bfpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">报废品总金额</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_bfpzje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结转日期</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_jzrq" size="20" maxlength="10" >
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
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
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
	if(!(isNumber(FormName.jxc_kcjz_zcpzsl, "正常品总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_zcpzjg, "正常品总金额"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcjz_ccpzsl, "残次品总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_ccpzje, "残次品总金额"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcjz_bfpzsl, "报废品总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_bfpzje, "报废品总金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_kcjz_jzrq, "结转日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
