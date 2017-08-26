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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_cdList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdbh" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">菜单序号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxh" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单显示名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxsmc" size="20" maxlength="100" >
  </td>
  <td width="15%"> 
    <div align="right">父菜单编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fcdbh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">是否末级菜单</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "sfmjcd","Y+是&N+否","");
%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cdxh, "菜单序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
