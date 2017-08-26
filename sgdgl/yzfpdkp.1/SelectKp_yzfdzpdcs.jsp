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
<form method="post" action="Kp_yzfdzpdcsList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">分公司</td> 
  <td width="31%"> 
    <select name="kp_yzfdzpdcs_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">上一年度的平均单额</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_pjde" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">班组工人最小值</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_grs" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">质保金最小值</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zbj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">客户满意度最小值</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_khmyd" size="20" maxlength="9" >
  </td>
  <td align="right" width="19%">班组最小在施工地数</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zxzsgds" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">班组最大在施工地数</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zdzsgds" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
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
	if(!(isFloat(FormName.kp_yzfdzpdcs_pjde, "上一年度的平均单额"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_grs, "班组工人最小值"))) {
		return false;
	}
	if(!(isFloat(FormName.kp_yzfdzpdcs_zbj, "质保金最小值"))) {
		return false;
	}
	if(!(isFloat(FormName.kp_yzfdzpdcs_khmyd, "客户满意度最小值"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_zxzsgds, "班组最小在施工地数"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_zdzsgds, "班组最大在施工地数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
