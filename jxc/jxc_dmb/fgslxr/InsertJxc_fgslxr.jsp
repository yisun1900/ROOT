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
<form method="post" action="SaveInsertJxc_fgslxr.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">单位编号</td> 
  <td width="35%"> 
    <input type="text" name="dwbh" value="" size="20" maxlength="5" >
  </td>
  <td align="right" width="15%">单位名称</td> 
  <td width="35%"> 
    <input type="text" name="dwmc" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">电话</td> 
  <td width="35%"> 
    <input type="text" name="dh" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">传真</td> 
  <td width="35%"> 
    <input type="text" name="cz" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">经办人</td> 
  <td width="35%"> 
    <input type="text" name="jbr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">经办人手机</td> 
  <td width="35%"> 
    <input type="text" name="jbrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">收货人</td> 
  <td width="35%"> 
    <input type="text" name="shr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">收货人手机</td> 
  <td width="35%"> 
    <input type="text" name="shrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">负责人</td> 
  <td width="35%"> 
    <input type="text" name="fzr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">负责人手机</td> 
  <td width="35%"> 
    <input type="text" name="fzrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地址</td> 
  <td width="35%"> 
    <input type="text" name="dz" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">开户银行</td> 
  <td width="35%"> 
    <input type="text" name="khyh" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">账号</td> 
  <td width="35%"> 
    <input type="text" name="zh" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">开户人姓名</td> 
  <td width="35%"> 
    <input type="text" name="khrxm" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">说明1</td> 
  <td width="35%"> 
    <input type="text" name="sm1" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">说明2</td> 
  <td width="35%"> 
    <input type="text" name="sm2" value="" size="20" maxlength="200" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
