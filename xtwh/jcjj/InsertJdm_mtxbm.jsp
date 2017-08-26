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
<form method="post" action="SaveInsertJdm_mtxbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">门套线编码</td> 
      <td width="32%"> 
        <input type="text" name="mtxbm" value="" size="20" maxlength="2" >
  </td>
      <td align="right" width="18%">门套线名称</td> 
      <td width="32%"> 
        <input type="text" name="mtxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">整樘门加价率</td> 
      <td width="32%"> 
        <input type="text" name="ztmjjl" value="" size="10" maxlength="9" >
        % </td>    <td align="right" width="18%">哑口加价率</td> 
      <td width="32%"> 
        <input type="text" name="ykjjl" value="" size="10" maxlength="9" >
        % </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">窗套加价率</td> 
      <td width="32%"> 
        <input type="text" name="ctjjl" value="" size="10" maxlength="9" >
        % </td>    <td align="right" width="18%">&nbsp; </td>
      <td width="32%">&nbsp; </td>
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
	if(	javaTrim(FormName.mtxbm)=="") {
		alert("请输入[门套线编码]！");
		FormName.mtxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mtxmc)=="") {
		alert("请输入[门套线名称]！");
		FormName.mtxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmjjl)=="") {
		alert("请输入[整樘门加价率]！");
		FormName.ztmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ztmjjl, "整樘门加价率"))) {
		return false;
	}
	if(	javaTrim(FormName.ykjjl)=="") {
		alert("请输入[哑口加价率]！");
		FormName.ykjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ykjjl, "哑口加价率"))) {
		return false;
	}
	if(	javaTrim(FormName.ctjjl)=="") {
		alert("请输入[窗套加价率]！");
		FormName.ctjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjjl, "窗套加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
