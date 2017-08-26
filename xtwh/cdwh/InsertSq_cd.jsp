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

<form method="post" action="SaveInsertSq_cd.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdbh" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">菜单序号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxh" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单显示名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxsmc" value="" size="20" maxlength="100" >
  </td>
  <td width="15%"> 
    <div align="right">菜单关联URL</div>
  </td>
  <td width="35%"> 
    <input type="file" name="glurl" value="" size="40" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">父菜单编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fcdbh" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">是否末级菜单</div>
  </td>
  <td width="35%"> 
    <input type="radio" name="sfmjcd"  value="Y">是
    <input type="radio" name="sfmjcd"  value="N">否
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单说明</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdsm" value="" size="20" maxlength="250" >
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
	if(	javaTrim(FormName.cdbh)=="") {
		alert("请输入[菜单编号]！");
		FormName.cdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cdxh)=="") {
		alert("请输入[菜单序号]！");
		FormName.cdxh.focus();
		return false;
	}
	if(!(isNumber(FormName.cdxh, "菜单序号"))) {
		return false;
	}
	if(	javaTrim(FormName.cdxsmc)=="") {
		alert("请输入[菜单显示名称]！");
		FormName.cdxsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fcdbh)=="") {
		alert("请输入[父菜单编号]！");
		FormName.fcdbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfmjcd)) {
		alert("请选择[是否末级菜单]！");
		FormName.sfmjcd[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
