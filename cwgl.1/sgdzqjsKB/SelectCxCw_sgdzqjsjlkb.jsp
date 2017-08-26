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
<form method="post" action="Cw_sgdzqjsjlkbCxList.jsp" name="selectform">
<div align="center">工程拨款汇总表</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsjlh" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_khbh" size="20" maxlength="20" >
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
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <select name="cw_sgdzqjsjlkb_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>
  </td>
  <td align="right" width="15%">现场负责人</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_sgbz" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算日期</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">中期实收款</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jskjs" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算比例</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsbl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">结算金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="cw_sgdzqjsjlkb_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
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
	if(!(isDatetime(FormName.cw_sgdzqjsjlkb_jsrq, "结算日期"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jskjs, "中期实收款"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jsje, "结算金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjsjlkb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
