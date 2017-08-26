<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sjstcblList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjstcbl_xh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">分段名称</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjstcbl_fdmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点（>）</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjstcbl_qd" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">终点（<=）</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjstcbl_zd" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提成百分比</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjstcbl_tcbfb" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">签单类型</td> 
  <td width="35%"> 
    <select name="cw_sjstcbl_qdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+非市场部家装&2+市场部家装&3+工装","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="cw_sjstcbl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
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
	if(!(isNumber(FormName.cw_sjstcbl_xh, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjstcbl_qd, "起点（>）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjstcbl_zd, "终点（<=）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjstcbl_tcbfb, "提成百分比"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
