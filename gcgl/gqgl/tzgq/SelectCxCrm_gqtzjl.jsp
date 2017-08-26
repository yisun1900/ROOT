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
<form method="post" action="Crm_gqtzjlCxList.jsp" name="selectform">
<div align="center">查询－工期调整记录</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">登记记录号</td> 
  <td width="35%"> 
    <input type="text" name="crm_gqtzjl_djjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="crm_gqtzjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户姓名</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">房屋地址</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">手机</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">签约日期</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>  </td>
  <td align="right" width="15%">工程担当</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">调整类型</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "crm_gqtzjl_tzlx","1+延期&2+工期缩减&3+工期合理增加","");
%>  </td>
  <td align="right" width="15%">工期调整原因</td> 
  <td width="35%"><select name="crm_gqtzjl_gqtzyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gqtzyybm,gqtzyymc from dm_gqtzyybm order by lx,gqtzyybm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">调整时间点从</td>
  <td><input type="text" name="crm_gqtzjl_tzsjd" size="20" maxlength="10" ondblclick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_gqtzjl_tzsjd2" size="20" maxlength="10" ondblclick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">调整天数</td> 
  <td width="35%"> 
    <input type="text" name="crm_gqtzjl_tzts" size="20" maxlength="8" >  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"><input type="text" name="crm_gqtzjl_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)"></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="crm_gqtzjl_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"><input type="text" name="crm_gqtzjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="15%">录入单位 </td>
  <td width="35%"><select name="crm_gqtzjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gqtzjl_tzsjd, "调整时间点"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gqtzjl_tzsjd2, "调整时间点"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_gqtzjl_tzts, "调整天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gqtzjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gqtzjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
