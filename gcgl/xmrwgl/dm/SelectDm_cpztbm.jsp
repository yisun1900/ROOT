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
<form method="post" action="Dm_cpztbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品状态编码</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="18%">产品状态名称</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品类型</td> 
  <td width="32%"> 
    <input type="radio" name="cplx"  value="0">全部
    <input type="radio" name="cplx"  value="1">定制品
    <input type="radio" name="cplx"  value="2">成品
  </td>
  <td align="right" width="18%">供货方  </td>
  <td width="32%"><input type="radio" name="ghf"  value="甲供">
甲供
  <input type="radio" name="ghf"  value="公司供">
公司供  </td>
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
