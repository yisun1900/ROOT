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
<form method="post" action="Crm_gdsgrzCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">登记编号</td> 
  <td width="35%"> 
    <input type="text" name="djbh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
  从<input type="text" name="lrsj" size="20" maxlength="10" >
  <BR>到<input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审阅标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sybz","N+未阅&Y+已审阅","");
%>
  </td>
  <td align="right" width="15%">审阅人</td> 
  <td width="35%"> 
    <input type="text" name="syr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审阅时间</td> 
  <td width="35%"> 
  从<input type="text" name="sysj" size="20" maxlength="10" >
  <BR>到<input type="text" name="sysj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sysj, "审阅时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sysj2, "审阅时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
