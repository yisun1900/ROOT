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
<form method="post" action="Jdm_mtxbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">门套线编码</td> 
  <td width="35%"> 
    <input type="text" name="mtxbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">门套线名称</td> 
  <td width="35%"> 
    <input type="text" name="mtxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">整樘门加价率</td> 
  <td width="35%"> 
    <input type="text" name="ztmjjl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">哑口加价率</td> 
  <td width="35%"> 
    <input type="text" name="ykjjl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">窗套加价率</td> 
  <td width="35%"> 
    <input type="text" name="ctjjl" size="20" maxlength="9" >
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
	if(!(isFloat(FormName.ztmjjl, "整樘门加价率"))) {
		return false;
	}
	if(!(isFloat(FormName.ykjjl, "哑口加价率"))) {
		return false;
	}
	if(!(isFloat(FormName.ctjjl, "窗套加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
