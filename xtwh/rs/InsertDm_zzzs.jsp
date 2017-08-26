<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_zzzs.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>资质证书编码（2位）</td>
  <td><input type="text" name="zzzsbm" value="" size="20" maxlength="2" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>资质证书名称</td>
  <td><input type="text" name="zzzs" value="" size="50" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">证书分类</td>
  <td><input type="text" name="zsfl" value="" size="50" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">证书级别</td>
  <td><input type="text" name="zsjb" value="" size="50" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="40%">发证单位</td> 
  <td width="60%"><input type="text" name="fzdw" value="" size="50" maxlength="50" ></td>
  </tr>
    <tr align="center"> 
      <td colspan="2"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)"></td>
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
	if(	javaTrim(FormName.zzzsbm)=="") {
		alert("请输入[资质证书编码]！");
		FormName.zzzsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zzzs)=="") {
		alert("请输入[资质证书]！");
		FormName.zzzs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
