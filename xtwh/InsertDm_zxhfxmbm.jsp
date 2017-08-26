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
<form method="post" action="SaveInsertDm_zxhfxmbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">回访项目编码</td> 
  <td width="35%"> 
    <input type="text" name="hfxmbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">回访项目名称</td> 
  <td width="35%"> 
    <input type="text" name="hfxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">类型</td> 
  <td width="35%"> 
    <select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">设计方案是否满意</option>
    <option value="2">设计师沟通能力</option>
    <option value="3">设计师服务</option>
    <option value="4">工程报价</option>
    <option value="5">其它人员服务</option>
    <option value="6">公司总体印象</option>
    <option value="7">希望改进方面</option>
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
	if(	javaTrim(FormName.hfxmbm)=="") {
		alert("请输入[回访项目编码]！");
		FormName.hfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfxmmc)=="") {
		alert("请输入[回访项目名称]！");
		FormName.hfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lx)=="") {
		alert("请选择[类型]！");
		FormName.lx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
