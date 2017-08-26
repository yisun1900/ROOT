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
<form method="post" action="Cw_gdyplyjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_jlh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <select name="cw_gdyplyjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">工地用品</td> 
  <td width="35%"> 
    <select name="cw_gdyplyjl_gdyp" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gdyp c1,gdyp c2 from dm_gdyp order by gdyp","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">单价</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_dj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">数量</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_sl" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_je" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">办理人</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_jkblr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">办理时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_jkblsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="cw_gdyplyjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_gdyplyjl_jsbz","0+未结算&1+已结算","");
%>
  </td>
  <td align="right" width="15%">结算记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_jsjlh" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">删除标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_gdyplyjl_scbz","N+未删除&Y+删除","");
%>
  </td>
  <td align="right" width="15%">删除人</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_scr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">删除时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdyplyjl_scsj" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.cw_gdyplyjl_dj, "单价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_gdyplyjl_sl, "数量"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_gdyplyjl_je, "金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdyplyjl_jkblsj, "办理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdyplyjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdyplyjl_scsj, "删除时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
