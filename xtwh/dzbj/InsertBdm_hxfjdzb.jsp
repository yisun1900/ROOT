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
<form method="post" action="SaveInsertBdm_hxfjdzb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>户型</td> 
  <td width="32%"> 
    <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>序号</td> 
  <td width="32%"><input type="text" name="xuhao" size="20" maxlength="17"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>房间名称</td>
  <td><input type="text" name="jgwzmc" value="" size="20" maxlength="50" ></td>
  <td align="right">房间面积</td>
  <td><input type="text" name="fjmj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>房间类型</td> 
  <td colspan="3"><input type="radio" name="fjlx"  value="1">
    厨房
      <input type="radio" name="fjlx"  value="2">
      卫生间
      <input type="radio" name="fjlx"  value="3">
      卧室
      <input type="radio" name="fjlx"  value="4">
      客厅
      <input type="radio" name="fjlx"  value="5">
      餐厅
      <input type="radio" name="fjlx"  value="6">
      阳台 </td>
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzmc)=="") {
		alert("请输入[房间名称]！");
		FormName.jgwzmc.focus();
		return false;
	}
	if(!(isFloat(FormName.fjmj, "房间面积"))) {
		return false;
	}
	if(	!radioChecked(FormName.fjlx)) {
		alert("请选择[房间类型]！");
		FormName.fjlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
