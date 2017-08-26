<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_qmjzCxList.jsp" name="selectform">
<div align="center">业绩期末结转</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">业绩结转时间</td> 
  <td width="35%"> 
    <input type="text" name="jzrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">结转人</td> 
  <td width="35%"> 
    <input type="text" name="jzr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">上期结转日期</td> 
  <td width="35%"> 
    <input type="text" name="sqjzrq" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.jzrq, "业绩结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqjzrq, "上期结转日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
