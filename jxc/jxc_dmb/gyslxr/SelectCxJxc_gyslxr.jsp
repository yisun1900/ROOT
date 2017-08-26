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
<form method="post" action="Jxc_gyslxrCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td colspan="3"><input type="text" name="xh" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">供应商编码</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:352PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx  order by gysmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">联系人姓名</td> 
  <td width="35%"> 
    <input type="text" name="lxrxm" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">职务</td> 
  <td width="35%"> 
    <input type="text" name="zw" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">手机</td> 
  <td width="35%"> 
    <input type="text" name="sj" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">办公电话</td> 
  <td width="35%"> 
    <input type="text" name="bgdh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">传真</td> 
  <td width="35%"> 
    <input type="text" name="cz" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">是否离职</td> 
  <td width="35%"> 
    <select name="sflz" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
  <option value="Y">离职</option>
  <option value="N">在职</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <input type="text" name="bz" size="60" maxlength="100" >    </td>
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
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
