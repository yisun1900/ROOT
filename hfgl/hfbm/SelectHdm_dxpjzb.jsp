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
<form method="post" action="Hdm_dxpjzbList.jsp" name="selectform">
<div align="center">回访对象评价指标－－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">回访对象</td>
  <td colspan="3"><select name="hfdxbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc||'---『'||hfdxflmc||'』' from hdm_hfdxbm,hdm_hfdxflbm where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">回访对象评价指标编码</td> 
  <td width="30%"> 
    <input type="text" name="dxpjzbbm" size="20" maxlength="6" >  </td>
  <td align="right" width="20%">回访对象评价指标</td> 
  <td width="30%"> 
    <input type="text" name="dxpjzb" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">序号</td> 
  <td width="30%"><input type="text" name="xh" size="20" maxlength="8" ></td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
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
