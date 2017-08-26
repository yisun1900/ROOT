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
<form method="post" action="Hdm_hfdxbmCxList.jsp" name="selectform">
<div align="center">回访对象－－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">序号</td>
  <td><input type="text" name="xh" size="20" maxlength="8" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回访对象分类</td>
  <td colspan="3"><select name="hfdxflbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hfdxflbm,hfdxflmc from hdm_hfdxflbm order by hfdxflbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访对象编码</td> 
  <td width="32%"> 
    <input type="text" name="hfdxbm" size="20" maxlength="4" >  </td>
  <td align="right" width="18%">回访对象名称</td> 
  <td width="32%"> 
    <input type="text" name="hfdxmc" size="20" maxlength="50" >  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
