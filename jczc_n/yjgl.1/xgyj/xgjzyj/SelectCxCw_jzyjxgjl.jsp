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
<form method="post" action="Cw_jzyjxgjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_khbh" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改时间</td> 
  <td width="35%"> 
  从<input type="text" name="cw_jzyjxgjl_xgsj" size="20" maxlength="10" >
  <BR>到<input type="text" name="cw_jzyjxgjl_xgsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">修改人</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xgr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户类型</td> 
  <td width="35%"> 
    <select name="cw_jzyjxgjl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+家装客户&3+退单客户&4+集成客户&5+设计客户","");
%>
    </select>
  </td>
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_hth" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户姓名</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_khxm" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">修改类型</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_jzyjxgjl_xglx","1+修改&2+删除&3+增加","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">原业绩结转时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_yjzrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">原合同原报价</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_ywdzgce" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">原工程签约额</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_yqye" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">修改后业绩结转时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xjzrq" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改后合同原报价</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xwdzgce" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">修改后工程签约额</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xqye" size="20" maxlength="17" >
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
	if(!(isDatetime(FormName.cw_jzyjxgjl_xgsj, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_xgsj2, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_yjzrq, "原业绩结转时间"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_ywdzgce, "原合同原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_yqye, "原工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_xjzrq, "修改后业绩结转时间"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_xwdzgce, "修改后合同原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_xqye, "修改后工程签约额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
