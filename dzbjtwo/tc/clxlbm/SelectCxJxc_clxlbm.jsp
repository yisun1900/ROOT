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
<form method="post" action="Jxc_clxlbmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料小类编码</td> 
  <td width="35%"> 
    <input type="text" name="clxlbm" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">材料小类名称</td> 
  <td width="35%"> 
    <input type="text" name="clxlmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料大类名称</td> 
  <td width="35%"> 
   <select name="cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	  out.print("<optgroup label=\"主材大类\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='1' order by cldlmc","");
	out.print("<optgroup label=\"辅材大类\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='2' order by cldlmc","");
	out.print("<optgroup label=\"通用大类\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='3' order by cldlmc","");
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
