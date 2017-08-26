<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_gzbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">考核周期</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_khzq" size="20" maxlength="6" >
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="rs_gzb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">发薪日期</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_fxrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">工资开始日期</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_ksrq" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工资终止日期</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_zzrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">全勤天数</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_qqts" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="rs_gzb_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="rs_gzb_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%>
    </select>
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
	if(!(isDatetime(FormName.rs_gzb_fxrq, "发薪日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_gzb_ksrq, "工资开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_gzb_zzrq, "工资终止日期"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_gzb_qqts, "全勤天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_gzb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
