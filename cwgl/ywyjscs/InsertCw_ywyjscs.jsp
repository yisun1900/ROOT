<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_ywyjscs.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="15%">参数编码</td> 
  <td width="35%"> 
    <input type="text" name="csbm" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">参数名称</td> 
  <td width="35%"> 
    <input type="text" name="csmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">参数值</td> 
  <td width="35%"> 
    <input type="text" name="csz" value="" size="20" maxlength="17" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.csbm)=="") {
		alert("请输入[参数编码]！");
		FormName.csbm.focus();
		return false;
	}
	if(	javaTrim(FormName.csmc)=="") {
		alert("请输入[参数名称]！");
		FormName.csmc.focus();
		return false;
	}
	if(	javaTrim(FormName.csz)=="") {
		alert("请输入[参数值]！");
		FormName.csz.focus();
		return false;
	}
	if(!(isFloat(FormName.csz, "参数值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
