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
<form method="post" action="Yy_rqsdList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">周期数</td> 
  <td width="35%"> 
    <input type="text" name="zqs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">上周日期开始</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_szs" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">上周日期结束</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_sze" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">本周日期开始</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_bzs" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">本周日期结束</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_bze" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_szs, "上周日期开始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_sze, "上周日期结束"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bzs, "本周日期开始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bze, "本周日期结束"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
