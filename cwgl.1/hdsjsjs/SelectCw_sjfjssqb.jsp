<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_sjfjssqbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">申请人</td> 
  <td width="35%"> 
    <input type="text" name="sqr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申请时间</td> 
  <td width="35%"> 
  从<input type="text" name="sqsj" size="20" maxlength="10" >
  <BR>到<input type="text" name="sqsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">审批人</td> 
  <td width="35%"> 
    <input type="text" name="spr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批时间</td> 
  <td width="35%"> 
  从<input type="text" name="spsj" size="20" maxlength="10" >
  <BR>到<input type="text" name="spsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">处理状态</td> 
  <td width="35%"> 
    <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+申请&2+审批同意&3+审批不同意&4+结算","");
%>
    </select>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqsj2, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj2, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
