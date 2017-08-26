<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_lrList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">周期数</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">分公司</td> 
  <td width="29%"> 
    <select name="yy_lr_yy_lr_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">客户管理费比例应收比例(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrglf_ysbl" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">客户管理费比例实际收取(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrglf_sjsq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">税金及其他比例应收比例(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrsj_ysbl" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">税金及其他比例实际收取(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrsj_sjsq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">工程毛利率去年平均(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrgc_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">工程毛利率本周指数(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrgc_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">主材毛利率去年平均(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrzc_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">主材毛利率本周指数(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrzc_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="yy_lr_yy_lr_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yy_lr_yy_lr_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">录入人</td> 
  <td width="29%"><input type="text" name="yy_lr_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_lr_zqs, "周期数"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrglf_ysbl, "客户管理费比例应收比例(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrglf_sjsq, "客户管理费比例实际收取(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrsj_ysbl, "税金及其他比例应收比例(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrsj_sjsq, "税金及其他比例实际收取(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrgc_qnpj, "工程毛利率去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrgc_bzzs, "工程毛利率本周指数(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrzc_qnpj, "主材毛利率去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrzc_bzzs, "主材毛利率本周指数(%)"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_lr_yy_lr_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_lr_yy_lr_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
