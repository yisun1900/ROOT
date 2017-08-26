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
<form method="post" action="Cw_fklxbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款类型编码</td> 
  <td width="35%"> 
    <input type="text" name="fklxbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">付款类型名称</td> 
  <td width="35%"> 
    <input type="text" name="fklxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款大类</td> 
  <td width="35%"> 
    <select name="fkdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+家装款&2+集成款&3+集成订金&4+咨询收款&5+预付款&9+其它收款","");
%>
    </select>
  </td>
  <td align="right" width="15%">凭证分类</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "pzfl","1+工程款&2+集成款","");
%>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
