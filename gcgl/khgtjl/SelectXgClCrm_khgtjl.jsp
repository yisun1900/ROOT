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
<form method="post" action="Crm_khgtjlXgClList.jsp" name="selectform">
<div align="center">客户沟通记录－－修改处理</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">登记编号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khgtjl_djbh" size="20" maxlength="10" >  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khgtjl_khbh" size="20" maxlength="20" >  </td>
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
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">沟通人</td> 
  <td width="35%"> 
    <input type="text" name="crm_khgtjl_gtr" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">沟通时间 从</td>
  <td><input type="text" name="crm_khgtjl_gtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_khgtjl_gtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否需处理</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "crm_khgtjl_sfxcl","N+不需处理&Y+需处理","");
%>  </td>
  <td align="right" width="15%">处理人</td> 
  <td width="35%"> 
    <input type="text" name="crm_khgtjl_clr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">处理时间 从</td>
  <td><input type="text" name="crm_khgtjl_clsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_khgtjl_clsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"><input type="text" name="crm_khgtjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"><select name="crm_khgtjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"><input type="text" name="crm_khgtjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="crm_khgtjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.crm_khgtjl_gtsj, "沟通时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khgtjl_gtsj2, "沟通时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khgtjl_clsj, "处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khgtjl_clsj2, "处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khgtjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khgtjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
