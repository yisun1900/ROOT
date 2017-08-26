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
<form method="post" action="Cl_clsgdCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申购批号</td> 
  <td width="35%"> 
    <input type="text" name="sgph" size="20" maxlength="11" >
  </td>
  <td align="right" width="15%">申购单位</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
		%> 
	</select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申购状态</td> 
  <td width="35%"> 
	<select name="sgzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
	  <option value="1">未提交</option>
	  <option value="2">已提交</option>
	  <option value="3">总部审核</option>
	  <option value="4">供应商下单</option>
	</select>
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申购总数量 从</td> 
  <td width="35%"> 
  <input type="text" name="sgzsl" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> <input type="text" name="sgzsl2" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">总部审核时间 从</td> 
  <td width="35%"> 
 <input type="text" name="zbshsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
    <input type="text" name="zbshsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">供应商下单时间 从</td> 
  <td width="35%"> 
 <input type="text" name="gysxdsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
  <input type="text" name="gysxdsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">供应商下单人</td> 
  <td width="35%"> 
  <input type="text" name="gysxdr" size="20" maxlength="20" ></td>
  <td align="right" width="15%">总部审核人</td> 
  <td width="35%"> 
    <input type="text" name="zbshr" size="20" maxlength="20" >
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
	if(!(isFloat(FormName.sgzsl, "申购总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.sgzsl2, "申购总数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj, "总部审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj2, "总部审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gysxdsj, "供应商下单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gysxdsj2, "供应商下单时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
