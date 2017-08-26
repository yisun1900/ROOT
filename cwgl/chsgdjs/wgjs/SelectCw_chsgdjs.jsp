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
<form method="post" action="Cw_chsgdjsList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsjlh" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_khbh" size="20" maxlength="20" >
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
  <td align="right" width="15%">处理状态</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_chsgdjs_clzt","1+结算&2+审批","");
%>
  </td>
  <td align="right" width="15%">审批人</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_spr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_spsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrbm" size="20" maxlength="5" >
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
	if(!(isDatetime(FormName.cw_chsgdjs_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_chsgdjs_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
