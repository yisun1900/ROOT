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
<form method="post" action="Yy_wxbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属分公司</td>
  <td><select name="yy_wxb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td><select name="yy_wxb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <input type="text" name="yy_wxb_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">网销部员工名称</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxb_ygmc" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">目标客户数量本月计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_byjh" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">目标客户数量本月累计</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_bylj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">目标客户数量上周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_szjh" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">目标客户数量上周完成</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_szwc" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">目标客户数量本周预计</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_bzyj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">收取定金数量本月计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">收取定金数量本月累计</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">收取定金数量上周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">收取定金数量上周完成</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">收取定金数量本周计划</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_bzjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="yy_wxb_yy_wxb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yy_wxb_yy_wxb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">录入人</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxb_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_wxb_zqs, "周期数"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_byjh, "收取定金数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_bylj, "收取定金数量本月累计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_szjh, "收取定金数量上周计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_szwc, "收取定金数量上周完成"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_bzjh, "收取定金数量本周计划"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_yy_wxb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_yy_wxb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
