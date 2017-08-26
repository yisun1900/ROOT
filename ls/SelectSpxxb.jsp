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
<form method="post" action="SpxxbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">商品代码</td> 
  <td width="35%"> 
        <input type="text" name="kcxm" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">商品分类</td> 
  <td width="35%"> 
    <select name="spfldm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select spfldm,spfl from spflb order by spfldm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="15%">生产厂家</td> 
  <td width="35%"> 
        <input type="text" name="sccj" value="dd"  size="20" maxlength="40" >
      </td>
  <td align="right" width="15%">商品名称描述</td> 
  <td width="35%"> 
    <textarea name="spmcms" cols="29" rows=""></textarea>
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
