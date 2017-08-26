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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_deflbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">单额分类编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflbm" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">单额分类名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">单额大于</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dedy" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">单额小于</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dexy" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">单额平均值</div>
  </td>
  <td width="35%"> 
    <input type="text" name="depjz" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
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
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.deflbm)=="") {
		alert("请输入[单额分类编码]！");
		FormName.deflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.deflmc)=="") {
		alert("请输入[单额分类名称]！");
		FormName.deflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dedy)=="") {
		alert("请输入[单额大于]！");
		FormName.dedy.focus();
		return false;
	}
	if(!(isNumber(FormName.dedy, "单额大于"))) {
		return false;
	}
	if(	javaTrim(FormName.dexy)=="") {
		alert("请输入[单额小于]！");
		FormName.dexy.focus();
		return false;
	}
	if(!(isNumber(FormName.dexy, "单额小于"))) {
		return false;
	}
	if(	javaTrim(FormName.depjz)=="") {
		alert("请输入[单额平均值]！");
		FormName.depjz.focus();
		return false;
	}
	if(!(isNumber(FormName.depjz, "单额平均值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
