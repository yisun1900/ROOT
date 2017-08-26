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
<form method="post" action="Yy_qtqdList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">周期数</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">所属分公司</td> 
  <td width="30%"> 
    <select name="yy_qtqd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="20%">目标客户数量本月计划</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_byjh" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">目标客户数量本月累计</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_bylj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">目标客户数量上周计划</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_szjh" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">目标客户数量上周完成</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_szwc" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">目标客户数量本周预计</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_bzyj" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">收取定金数量本月计划</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">收取定金数量本月累计</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">收取定金数量上周计划</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">收取定金数量上周完成</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">收取定金数量本周预计</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_bzyj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="yy_qtqd_yy_qtqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yy_qtqd_yy_qtqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">录入人</td> 
  <td width="30%"><input type="text" name="yy_qtqd_yy_qtqd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_qtqd_zqs, "周期数"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_byjh, "收取定金数量本月计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_bylj, "收取定金数量本月累计"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_szjh, "收取定金数量上周计划"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_szwc, "收取定金数量上周完成"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_bzyj, "收取定金数量本周预计"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_yy_qtqd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_yy_qtqd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
