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
<form method="post" action="SaveInsertBdm_bjjbbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>报价级别编码</td> 
  <td width="32%"> 
    <input type="text" name="bjjbbm" value="" size="20" maxlength="1" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>报价级别名称</td> 
  <td width="32%"> 
    <input type="text" name="bjjbmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>类型</td>
  <td><input type="radio" name="lx"  value="1">
    个性化
    <input type="radio" name="lx"  value="2">
    套餐
    <input type="radio" name="lx"  value="3">
    整装
	</td>
  <td align="right"><font color="#FF0000">*</font>级别排序</td>
  <td><input type="text" name="yxj" value="" size="20" maxlength="8" ></td>
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
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别编码]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbmc)=="") {
		alert("请输入[报价级别名称]！");
		FormName.bjjbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.yxj)=="") {
		alert("请输入[级别排序]！");
		FormName.yxj.focus();
		return false;
	}
	if(!(isNumber(FormName.yxj, "级别排序"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
