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
<form method="post" action="SavePljm.jsp" name="editform">
<div align="center">套餐标准主材项目－批量改[减免]</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right"><font color="#FF0000">*</font>是否可减免</td>
  <td width="60%"><input type="radio" name="sfkjm"  value="1">
    不可减免
      <input type="radio" name="sfkjm"  value="2">
      可减免 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">减免单价</td>
  <td><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
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
	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否可减免]！");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！必须输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("错误！必须输入[减免单价]！");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "减免单价"))) {
			return false;
		}
	}
	else
	{
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
