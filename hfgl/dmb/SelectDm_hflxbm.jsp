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

<form method="post" action="Dm_hflxbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">回访类型编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hflxbm" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">回访类型名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hflxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">回访大类</div>
  </td>
  <td width="35%"> 
    <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	  <option value="1">咨询客户回访</option>
	  <option value="2">在施工程回访</option>
	  <option value="3">保修客户回访</option>
	  <option value="4">投诉报修回访</option>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">回访时间间隔</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sjjg" size="20" maxlength="8" >
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
	if(!(isNumber(FormName.sjjg, "回访时间间隔"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
