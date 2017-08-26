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
<form method="post" action="SaveInsertBj_tcsjflbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">套餐升级分类编码（4位）</td> 
  <td width="30%"> 
    <input type="text" name="tcsjflbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="20%">套餐升级分类名称</td> 
  <td width="30%"> 
    <input type="text" name="tcsjflmc" value="" size="20" maxlength="50" >
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
	if(	javaTrim(FormName.tcsjflbm)=="") {
		alert("请输入[套餐升级分类编码]！");
		FormName.tcsjflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcsjflmc)=="") {
		alert("请输入[套餐升级分类名称]！");
		FormName.tcsjflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
