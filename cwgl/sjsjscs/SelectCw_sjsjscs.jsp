<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sjsjscsList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="cw_sjsjscs_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="15%">参数编码</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjsjscs_csbm" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">参数名称</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjsjscs_csmc" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">参数值</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjsjscs_csz" size="20" maxlength="17" >
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
	if(!(isFloat(FormName.cw_sjsjscs_csz, "参数值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
