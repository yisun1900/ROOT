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
<form method="post" action="SaveInsertDm_zsqxflbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="19%">在司期限分类编码</td> 
      <td width="30%"> 
        <input type="text" name="zsqxflbm" value="" size="20" maxlength="2" >
  </td>
      <td align="right" width="21%">在司期限分类名称</td> 
      <td width="30%"> 
        <input type="text" name="zsqxflmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="19%">起始值（月）</td>    <td width="30%"> 
        <input type="text" name="qsz" value="" size="12" maxlength="8" >
        （ >=） </td>
      <td align="right" width="21%">终止值（月）</td>    <td width="30%"> 
        <input type="text" name="zzz" value="" size="12" maxlength="8" >
        （ &lt;） </td>
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
	if(	javaTrim(FormName.zsqxflbm)=="") {
		alert("请输入[在司期限分类编码]！");
		FormName.zsqxflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zsqxflmc)=="") {
		alert("请输入[在司期限分类名称]！");
		FormName.zsqxflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("请输入[起始值（月）]！");
		FormName.qsz.focus();
		return false;
	}
	if(!(isNumber(FormName.qsz, "起始值（月）"))) {
		return false;
	}
	if(	javaTrim(FormName.zzz)=="") {
		alert("请输入[终止值（月）]！");
		FormName.zzz.focus();
		return false;
	}
	if(!(isNumber(FormName.zzz, "终止值（月）"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
