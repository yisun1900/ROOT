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
<form method="post" action="Yy_sjList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">周期数</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">分公司</td> 
  <td width="27%"> 
    <select name="yy_sj_yy_sj_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="23%">总客源目标客户数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjzky_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">总客源收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjzky_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计部设计费本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_sjf" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">设计部去年同期月度设计费</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_tqsjf" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计部工程产值本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_gccz" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">设计部去年同期月度工程产值</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_tqgccz" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">家居部主材产值本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjjjb_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">家居部去年同期月度主材产值</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjjjb_qntq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">市场部目标客户数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjscb_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">网销部目标客户数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjwxb_mbkh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">其他渠道目标客户数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjqtqd_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">市场部收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjscb_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网销部收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjwxb_sqdj" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">其他渠道收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjqtqd_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="yy_sj_yy_sj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到 </td>
  <td><input type="text" name="yy_sj_yy_sj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">录入人</td> 
  <td width="27%"><input type="text" name="yy_sj_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_sj_zqs, "周期数"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjzky_mbkh, "总客源目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjzky_sqdj, "总客源收取定金数量本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_sjf, "设计部设计费本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_tqsjf, "设计部去年同期月度设计费"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_gccz, "设计部工程产值本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_tqgccz, "设计部去年同期月度工程产值"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjjjb_byjh, "家居部主材产值本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjjjb_qntq, "家居部去年同期月度主材产值"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjscb_mbkh, "市场部目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjwxb_mbkh, "网销部目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjqtqd_mbkh, "其他渠道目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjscb_sqdj, "市场部收取定金数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjwxb_sqdj, "网销部收取定金数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjqtqd_sqdj, "其他渠道收取定金数量本月计划"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sj_yy_sj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sj_yy_sj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
