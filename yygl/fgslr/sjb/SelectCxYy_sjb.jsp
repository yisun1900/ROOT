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
	String ssbm=(String)session.getAttribute("dwbh");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_sjbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属分公司</td>
  <td><select name="yy_sjb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </select></td>
  <td align="right">所属部门</td>
  <td><select name="yy_sjb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">周期数</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">设计部员工名称</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjb_ygmc" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">以往(非本月)储备</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_sydjcb" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">本月计划收取定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">本月累计收取定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">上周计划收取定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">上周完成收取定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">本周预计收取定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bzyj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">本周退定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bztdj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">本月累计退定金</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_byljtdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">设计费本月计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">设计费本月累计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_bylj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">设计费上周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_szjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">设计费上周完成</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_szwc" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">设计费本周预计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_bzyj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">工程产值本月计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_byjh" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">工程产值本月累计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_bylj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">工程产值上周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_szjh" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">工程产值上周完成</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_szwc" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">工程产值本周预计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_bzyj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">主材产值本月计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">主材产值本月累计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_bylj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">主材产值上周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_szjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">主材产值上周完成</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_szwc" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">主材产值本月预计</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_bzyj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">录入人</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjb_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">录入时间 从</td> 
  <td width="29%"><input type="text" name="yy_sjb_yy_sjb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="21%">到 </td>
  <td width="29%"><input type="text" name="yy_sjb_yy_sjb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isNumber(FormName.yy_sjb_zqs, "周期数"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_sydjcb, "以往(非本月)储备"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_byjh, "本月计划收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bylj, "本月累计收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_szjh, "上周计划收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_szwc, "上周完成收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bzyj, "本周预计收取定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bztdj, "本周退定金"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_byljtdj, "本月累计退定金"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_byjh, "设计费本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_bylj, "设计费本月累计"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_szjh, "设计费上周计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_szwc, "设计费上周完成"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_bzyj, "设计费本周预计"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_byjh, "工程产值本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_bylj, "工程产值本月累计"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_szjh, "工程产值上周计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_szwc, "工程产值上周完成"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_bzyj, "工程产值本周预计"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_byjh, "主材产值本月计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_bylj, "主材产值本月累计"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_szjh, "主材产值上周计划"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_szwc, "主材产值上周完成"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_bzyj, "主材产值本月预计"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_yy_sjb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_yy_sjb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
