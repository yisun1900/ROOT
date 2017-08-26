<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_sckhyxbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户意向编码</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxbm" size="20" maxlength="1" >
  </td>
  <td align="right" width="15%">客户意向名称</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">对应状态</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "zt","1+跟踪&2+失败&5+准备移交&6+准备失败","");
%>
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
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
