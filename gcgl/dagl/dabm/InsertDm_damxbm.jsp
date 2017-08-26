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
<form method="post" action="SaveInsertDm_damxbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">档案明细编码(2位)</td> 
  <td width="33%"> 
    <input type="text" name="damxbm" value="" size="20" maxlength="2" >  </td>
  <td align="right" width="15%">归档标志</td> 
  <td width="35%"><input type="radio" name="gdbz"  value="Y">
    必须归档
    <input type="radio" name="gdbz"  value="N">
    可不归档  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">档案明细名称</td> 
  <td colspan="3"><input type="text" name="damxmc" value="" size="72" maxlength="50" >    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.damxbm)=="") {
		alert("请输入[档案明细编码]！");
		FormName.damxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.damxmc)=="") {
		alert("请输入[档案明细名称]！");
		FormName.damxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.gdbz)) {
		alert("请选择[归档标志]！");
		FormName.gdbz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
