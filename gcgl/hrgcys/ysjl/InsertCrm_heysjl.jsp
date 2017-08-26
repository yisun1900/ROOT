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
<form method="post" action="SaveInsertCrm_heysjl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">验收记录号</td> 
  <td width="35%"> 
    <input type="text" name="ysjlh" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">验收次数记录号</td> 
  <td width="35%"> 
    <input type="text" name="yscsjlh" value="" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="khbh" value="" size="20" maxlength="25" >
  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="sjs" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <input type="text" name="sgd" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">质检</td> 
  <td width="35%"> 
    <input type="text" name="zjxm" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">验收版本号</td> 
  <td width="35%"> 
    <input type="text" name="gcysbbh" value="" size="20" maxlength="25" >
  </td>
  <td align="right" width="15%">验收项目编码</td> 
  <td width="35%"> 
    <input type="text" name="gcysxmbm" value="" size="20" maxlength="25" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">验收项目名称</td> 
  <td width="35%"> 
    <input type="text" name="gcysxmmc" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">验收子项数量</td> 
  <td width="35%"> 
    <input type="text" name="yszxsl" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目验收时间</td> 
  <td width="35%"> 
    <input type="text" name="yssj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">项目验收人</td> 
  <td width="35%"> 
    <input type="text" name="ysr" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目验收结果</td> 
  <td width="35%"> 
    <input type="text" name="sjysjg" value="" size="20" maxlength="1" >
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
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.yscsjlh)=="") {
		alert("请输入[验收次数记录号]！");
		FormName.yscsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请输入[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请输入[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("请输入[验收项目名称]！");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj, "项目验收时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
