<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">板材品牌</td> 
  <td width="35%"> 
    <input type="text" name="bcpp" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">板材厚度</td> 
  <td width="35%"> 
    <input type="text" name="bchd" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">单价</td> 
  <td width="35%"> 
    <input type="text" name="dj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">&nbsp; 
    
  </td>
  <td width="35%">&nbsp; 
    
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="导出报价">  </td>
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
	if(!(isNumber(FormName.bchd, "板材厚度"))) {
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_jjbjbjList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_jjbjbjDcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
