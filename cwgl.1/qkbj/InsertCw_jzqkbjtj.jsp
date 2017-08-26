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
<form method="post" action="SaveInsertCw_jzqkbjtj.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    工程进度
  </td>
  <td width="35%"> 
    <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm","");
//	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    工程实收款率小于
  </td>
  <td width="35%"> 
    <input type="text" name="sfkl" value="" size="20" maxlength="9" >
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
	if(	javaTrim(FormName.zqysxmbm)=="") {
		alert("请选择[工程进度]！");
		FormName.zqysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkl)=="") {
		alert("请输入[工程实收款率小于]！");
		FormName.sfkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkl, "工程实收款率小于"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
