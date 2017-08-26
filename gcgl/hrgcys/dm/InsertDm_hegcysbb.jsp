<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_hegcysbb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收版本号</td> 
  <td width="32%"> 
    <input type="text" name="gcysbbh" value="" size="20" maxlength="5" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否在用版本</td> 
  <td width="32%"><select name="sfzybb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">未启用</option>
    <option value="2">当前版</option>
    <option value="3">可用版</option>
    <option value="4">已停用</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>验收版本名称</td>
  <td colspan="3"><input type="text" name="gcysbbmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>  </td>
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请输入[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysbbmc)=="") {
		alert("请输入[验收版本名称]！");
		FormName.gcysbbmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sfzybb)=="") {
		alert("请选择[是否在用版本]！");
		FormName.sfzybb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
