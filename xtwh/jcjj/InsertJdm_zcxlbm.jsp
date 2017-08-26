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
<form method="post" action="SaveInsertJdm_zcxlbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">主材小类编码</td> 
  <td width="35%"> 
    <input type="text" name="zcxlbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">主材小类名称</td> 
  <td width="35%"> 
    <input type="text" name="zcxlmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">主材大类</td> 
  <td width="35%"> 
    <select name="zcdlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm order by zcdlbm","");
%>
    </select>
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
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请输入[主材小类编码]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlmc)=="") {
		alert("请输入[主材小类名称]！");
		FormName.zcxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlmc)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
