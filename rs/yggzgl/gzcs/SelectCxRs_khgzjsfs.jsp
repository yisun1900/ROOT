<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_khgzjsfsCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">设计师级别</td> 
  <td width="35%"> 
    <select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%>
    </select>
  </td>
  <td align="right" width="15%">业绩下限</td> 
  <td width="35%"> 
    <input type="text" name="yjxx" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">业绩上限</td> 
  <td width="35%"> 
    <input type="text" name="yjsx" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">考核工资</td> 
  <td width="35%"> 
    <input type="text" name="khgz" size="20" maxlength="17" >
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
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.yjxx, "业绩下限"))) {
		return false;
	}
	if(!(isFloat(FormName.yjsx, "业绩上限"))) {
		return false;
	}
	if(!(isFloat(FormName.khgz, "考核工资"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
