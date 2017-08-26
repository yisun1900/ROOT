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
<form method="post" action="SaveInsertGdm_mbsjjd.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">模版编码</td> 
  <td width="37%"> 
    <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:252PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb order by mbbm","");
%>
    </select>  </td>
  <td align="right" width="13%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">任务编码</td>
  <td><select name="rwbm" style="FONT-SIZE:12PX;WIDTH:252PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm order by rwbm","");
%>
  </select></td>
  <td align="right">任务序号</td>
  <td><input type="text" name="rwxh" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">任务发生时间</td>
  <td><input type="text" name="rwsfsj" value="" size="20" maxlength="8" ></td>
  <td align="right">任务天数</td>
  <td><input name="rwts" type="text" id="rwts" value="" size="20" maxlength="8" ></td>
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[模版编码]！");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请选择[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwsfsj)=="") {
		alert("请输入[任务发生时间]！");
		FormName.rwsfsj.focus();
		return false;
	}
	if(!(isNumber(FormName.rwsfsj, "任务发生时间"))) {
		return false;
	}
	if(	javaTrim(FormName.rwts)=="") {
		alert("请输入[任务天数]！");
		FormName.rwts.focus();
		return false;
	}
	if(!(isNumber(FormName.rwts, "任务天数"))) {
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("请输入[任务序号]！");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isNumber(FormName.rwxh, "任务序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
