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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">板材品牌</td> 
      <td width="33%"> 
        <input type="text" name="bcpp" value="" size="20" maxlength="50" >
  </td>
      <td align="right" width="17%">板材类型</td>    <td width="33%">
        <input type="text" name="bclx" value="" size="20" maxlength="50" >
      </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">板材厚度（mm）</td>
      <td width="33%"> 
        <input type="text" name="bchd" value="" size="20" maxlength="8" >
      </td>    
      <td align="right" width="17%">单价</td>
      <td width="33%"> 
        <input type="text" name="dj" value="" size="20" maxlength="17" >
      </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="button"  value="存盘" onClick="f_do(insertform)">
		<input type="reset"  value="重输" name="reset">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onClick="f_drnewExcel(insertform)"  value="增加家具板件报价（Excel）" >      
		<P><A HREF="家具板件报价.xls"><B>点击右键另存为，下载Excel报价模板</B></A>
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
	if(	javaTrim(FormName.bcpp)=="") {
		alert("请输入[板材品牌]！");
		FormName.bcpp.focus();
		return false;
	}
	if(	javaTrim(FormName.bclx)=="") {
		alert("请输入[板材类型]！");
		FormName.bclx.focus();
		return false;
	}
	if(	javaTrim(FormName.bchd)=="") {
		alert("请输入[板材厚度]！");
		FormName.bchd.focus();
		return false;
	}
	if(!(isNumber(FormName.bchd, "板材厚度"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	FormName.action="SaveInsertJc_jjbjbj.jsp";
	FormName.submit();
	return true;
}

function f_drnewExcel(FormName)//参数FormName:Form的名称
{
	FormName.action="ImpAddDataJjbj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
