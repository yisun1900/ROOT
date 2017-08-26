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
<form method="post" action="SaveInsertGdm_xmxlbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目小类编码</td> 
  <td width="35%"> 
    <input type="text" name="xmxlbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">项目小类名称</td> 
  <td width="35%"> 
    <input type="text" name="xmxlmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目大类编码</td> 
  <td width="35%"> 
    <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmdlbm,xmdlmc from gdm_xmdlbm order by xmdlbm","");
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
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请输入[项目小类编码]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlmc)=="") {
		alert("请输入[项目小类名称]！");
		FormName.xmxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类编码]！");
		FormName.xmdlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
