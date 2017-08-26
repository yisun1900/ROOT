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
<form method="post" action="Tc_dbjgbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区</td> 
  <td width="35%"> 
    <select name="tc_dbjgb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">报价级别</td> 
  <td width="35%"> 
    <select name="tc_dbjgb_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">产品小类</td> 
  <td width="35%"> 
    <select name="tc_dbjgb_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
    </select>
  </td>
  <td align="right" width="15%">产品大类</td> 
  <td width="35%"> 
    <select name="tc_dbjgb_tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否要求相同品牌</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "tc_dbjgb_sfyqxtpp","Y+是&N+否","");
%>
  </td>
  <td align="right" width="15%">计量单位</td> 
  <td width="35%"> 
    <input type="text" name="tc_dbjgb_jldw" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否可减免</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "tc_dbjgb_sfkjm","1+不可减免&2+可减免","");
%>
  </td>
  <td align="right" width="15%">减免单价</td> 
  <td width="35%"> 
    <input type="text" name="tc_dbjgb_jmdj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">升级折价</td> 
  <td width="35%"> 
    <input type="text" name="tc_dbjgb_sjzj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="tc_dbjgb_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="tc_dbjgb_lrsj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.tc_dbjgb_tccplbbm, "产品小类"))) {
		return false;
	}
	if(!(isNumber(FormName.tc_dbjgb_tccpdlbm, "产品大类"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_dbjgb_jmdj, "减免单价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_dbjgb_sjzj, "升级折价"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_dbjgb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
