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
<form method="post" action="SaveInsertCrm_spjrybm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="22%">受评价人员编码(2位)</td>
      <td width="28%"> 
        <input type="text" name="spjrybm" value="" size="20" maxlength="2" >
  </td>
      <td align="right" width="19%">受评价人员</td> 
      <td width="31%"> 
        <input type="text" name="spjry" value="" size="20" maxlength="20" >
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("请输入[受评价人员编码]！");
		FormName.spjrybm.focus();
		return false;
	}
	if (FormName.spjrybm.value.length!=2)
	{
		alert("[受评价人员编码]应为2位！");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.spjry)=="") {
		alert("请输入[受评价人员]！");
		FormName.spjry.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
