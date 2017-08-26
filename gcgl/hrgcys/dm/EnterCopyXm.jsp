<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>复制验收项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="CopyXm.jsp" name="selectform">
<div align="center">复制验收项目</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>被复制验收版本号</td>
  <td><select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="47%"><span class="STYLE1">*</span>复制验收版本号</td> 
  <td width="53%"><select name="gcysbbhnew" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
  </select></td>
  </tr>
<tr align="center"> 
  <td colspan="2"><input type="button" onClick="f_do(selectform)"  value="复制"></td>
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
		alert("请选择[被复制验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}

	if(	javaTrim(FormName.gcysbbhnew)=="") {
		alert("请选择[复制验收版本号]！");
		FormName.gcysbbhnew.focus();
		return false;
	}

	if (FormName.gcysbbh.value==FormName.gcysbbhnew.value)
	{
		alert("错误！[复制验收版本号]不能相同！");
		FormName.gcysbbhnew.focus();
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
