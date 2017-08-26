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
<form method="post" action="SaveInsertCw_ywytcbl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">分段名称</td> 
  <td width="35%"> 
    <input type="text" name="fdmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点（>）</td> 
  <td width="35%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">终点（<=）</td> 
  <td width="35%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提成百分比</td> 
  <td width="35%"> 
    <input type="text" name="tcbfb" value="" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">签单类型</td> 
  <td width="35%"> 
    <select name="qdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">家装</option>
    <option value="3">工装</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.fdmc)=="") {
		alert("请输入[分段名称]！");
		FormName.fdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点（>）]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点（>）"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点（<=）]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点（<=）"))) {
		return false;
	}
	if(	javaTrim(FormName.tcbfb)=="") {
		alert("请输入[提成百分比]！");
		FormName.tcbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tcbfb, "提成百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.qdlx)=="") {
		alert("请选择[签单类型]！");
		FormName.qdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
