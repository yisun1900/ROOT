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
<form method="post" action="Crm_ycglList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">异常单编号</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_ycdbh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户姓名</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">房屋地址</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">异常分类</td> 
  <td width="35%"> 
    <select name="crm_ycgl_ycflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ycflbm,ycflmc from dm_ycflbm order by ycflbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">异常发生时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_ycfssj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">责任人</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_zrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">异常情况说明</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_ycqksm" cols="29" rows="6"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">方案制订人</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_fazdr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">方案制订时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_fazdsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划解决时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_jhjjsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">解决方案</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_jjfa" cols="29" rows="6"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际处理人</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_sjclr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">实际处理时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_sjclsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际处理情况</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_sjclqk" cols="29" rows="6"></textarea>
  </td>
  <td align="right" width="15%">完成时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_wcsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否解决</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "crm_ycgl_sfjj","1+录入异常&2+制订方案&3+解决","");
%>
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="crm_ycgl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_bz" cols="29" rows="2"></textarea>
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
	if(!(isDatetime(FormName.crm_ycgl_ycfssj, "异常发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_fazdsj, "方案制订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_sjclsj, "实际处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_wcsj, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
