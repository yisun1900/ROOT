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
<form method="post" action="Yy_cxCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">周期数</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">所属分公司</td> 
  <td width="31%"> 
    <select name="yy_cx_yy_cx_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="19%">直接折扣去年平均(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzjzk_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">直接折扣本周指数(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzjzk_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">赠品赠券去年平均(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzpzq_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">赠品赠券本周指数(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzpzq_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">工程返现去年平均(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxgcfx_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">工程返现本周指数(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxgcfx_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">让利合计去年平均(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxrlhj_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">让利合计本周指数(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxrlhj_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="yy_cx_yy_cx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yy_cx_yy_cx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入人</td> 
  <td width="31%"><input type="text" name="yy_cx_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="100">
  </td>
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
	if(!(isNumber(FormName.yy_cx_zqs, "周期数"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzjzk_qnpj, "直接折扣去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzjzk_bzzs, "直接折扣本周指数(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzpzq_qnpj, "赠品赠券去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzpzq_bzzs, "赠品赠券本周指数(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxgcfx_qnpj, "工程返现去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxgcfx_bzzs, "工程返现本周指数(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxrlhj_qnpj, "让利合计去年平均(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxrlhj_bzzs, "让利合计本周指数(%)"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_cx_yy_cx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_cx_yy_cx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
