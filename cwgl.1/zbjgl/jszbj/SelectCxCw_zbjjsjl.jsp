<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


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
<form method="post" action="Cw_zbjjsjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="cw_zbjjsjl_xuhao" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <select name="cw_zbjjsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd  where cxbz='N' order by ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd  where cxbz='N' and ssfgs='"+ssfgs+"' order by ssfgs,sgdmc","");
	}
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">质保金减少原因</td> 
  <td width="35%"> 
    <select name="cw_zbjjsjl_zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm","");
%>
    </select>
  </td>
  <td align="right" width="15%">金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_zbjjsjl_je" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_zbjjsjl_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_zbjjsjl_lrsj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.cw_zbjjsjl_xuhao, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zbjjsjl_je, "金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zbjjsjl_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
