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
<form method="post" action="Tc_cxxmList.jsp" name="selectform">
<div align="center">套餐促销项目</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">促销项目编码</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_cxxmbm" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">地区</td> 
  <td colspan="3"> 
    <select name="tc_cxxm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">报价级别</td> 
  <td width="35%"> 
    <select name="tc_cxxm_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">项目名称</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_xmmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">品牌</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_ppmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">型号</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_xh" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计量单位</td> 
  <td width="35%"> 
    <select name="tc_cxxm_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>
  </td>
  <td align="right" width="15%">单价</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_dj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="tc_cxxm_lrsj" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.tc_cxxm_dj, "单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_cxxm_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
