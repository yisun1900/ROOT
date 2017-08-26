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
<form method="post" action="Dm_rcjcxmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目编码</td> 
  <td width="35%"> 
    <input type="text" name="dm_rcjcxm_xmbm" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">项目名称</td> 
  <td width="35%"> 
    <input type="text" name="dm_rcjcxm_xmmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">日常检查大类</td> 
  <td width="35%"> 
    <select name="dm_rcjcxm_rcjcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rcjcdlbm,rcjcdlmc from dm_rcjcdlbm order by rcjcdlbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">检查内容</td> 
  <td width="35%"> 
    <input type="text" name="dm_rcjcxm_jcnr" size="20" maxlength="200" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">日常检查类型</td> 
  <td width="35%"> 
    <select name="dm_rcjcxm_rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm","");
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
