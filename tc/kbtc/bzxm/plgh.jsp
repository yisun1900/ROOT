<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String chooseitem = cf.getParameter(request,"chooseitem");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlgh.jsp" name="editform">
<div align="center">套餐标准主材项目－批量改[可更换主材]</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>是否可更换</td>
  <td><input type="radio" name="sfkgh"  value="1">
    不可换
    <input type="radio" name="sfkgh"  value="2">
    可换 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">可换最大数量</td>
  <td><input type="text" name="khzdsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">更换折价</td>
  <td><input type="text" name="ghzj" value="" size="20" maxlength="17" ></td>
</tr>

    <tr> 
      <td colspan="2" >
	<div align="center">
	<input type="hidden" name="chooseitem"  value="<%=chooseitem%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	!radioChecked(FormName.sfkgh)) {
		alert("请选择[是否可更换]！");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("错误！必须输入[可换最大数量]！");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "可换最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("错误！必须输入[更换折价]！");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "更换折价"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
