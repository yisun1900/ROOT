<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Xz_bgypbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">办公用品编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgypbh" size="20" maxlength="5" >
  </td>
  <td width="15%"> 
    <div align="right">办公用品名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgypmc" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">品牌</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pp" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <div align="right">供货人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ghr" size="20" maxlength="40" >
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

	  
	  </div>
    </td>
  </tr>
</table>
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
