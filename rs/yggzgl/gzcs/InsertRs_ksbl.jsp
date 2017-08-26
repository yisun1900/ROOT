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
<form method="post" action="SaveInsertRs_ksbl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工资范围</td> 
  <td width="35%"> 
    <input type="text" name="gzfw" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">工资下限</td> 
  <td width="35%"> 
    <input type="text" name="gzxx" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工资上限</td> 
  <td width="35%"> 
    <input type="text" name="gzsx" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">个税比率</td> 
  <td width="35%"> 
    <input type="text" name="gsbl" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">固定税金</td> 
  <td width="35%"> 
    <input type="text" name="gdsj" value="" size="20" maxlength="17" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.gzfw)=="") {
		alert("请输入[工资范围]！");
		FormName.gzfw.focus();
		return false;
	}
	if(	javaTrim(FormName.gzxx)=="") {
		alert("请输入[工资下限]！");
		FormName.gzxx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzxx, "工资下限"))) {
		return false;
	}
	if(	javaTrim(FormName.gzsx)=="") {
		alert("请输入[工资上限]！");
		FormName.gzsx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzsx, "工资上限"))) {
		return false;
	}
	if(	javaTrim(FormName.gsbl)=="") {
		alert("请输入[个税比率]！");
		FormName.gsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsbl, "个税比率"))) {
		return false;
	}
	if(	javaTrim(FormName.gdsj)=="") {
		alert("请输入[固定税金]！");
		FormName.gdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdsj, "固定税金"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
