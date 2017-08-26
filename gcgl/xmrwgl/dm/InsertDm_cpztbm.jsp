<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_cpztbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品状态编码</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" value="" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">产品状态名称</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">产品类型</td>
  <td><input type="radio" name="cplx"  value="0">
    全部
      <input type="radio" name="cplx"  value="1">
      定制品
      <input type="radio" name="cplx"  value="2">
      成品 </td>
  <td align="right">供货方</td>
  <td><input type="radio" name="ghf"  value="甲供">
甲供
  <input type="radio" name="ghf"  value="公司供">
公司供</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">状态序号</td> 
  <td width="32%"><input type="text" name="ztxh" value="" size="20" maxlength="8" ></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.cpztbm)=="") {
		alert("请输入[产品状态编码]！");
		FormName.cpztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpztmc)=="") {
		alert("请输入[产品状态名称]！");
		FormName.cpztmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("请选择[产品类型]！");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("请选择[供货方]！");
		FormName.ghf[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ztxh)=="") {
		alert("请输入[状态序号]！");
		FormName.ztxh.focus();
		return false;
	}
	if(!(isNumber(FormName.ztxh, "状态序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
