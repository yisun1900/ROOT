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
<form method="post" action="SaveInsertKp_yzfdzpdcs.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">分公司</td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">上一年度的平均单额</td> 
  <td width="31%"> 
    <input type="text" name="pjde" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">班组工人最小值</td> 
  <td width="31%"> 
    <input type="text" name="grs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">质保金最小值</td> 
  <td width="31%"> 
    <input type="text" name="zbj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">客户满意度最小值</td> 
  <td width="31%"> 
    <input type="text" name="khmyd" value="" size="10" maxlength="9" >
    %
  </td>
  <td align="right" width="19%">班组最小在施工地数</td> 
  <td width="31%"> 
    <input type="text" name="zxzsgds" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">班组最大在施工地数</td> 
  <td width="31%"> 
    <input type="text" name="zdzsgds" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.pjde)=="") {
		alert("请输入[上一年度的平均单额]！");
		FormName.pjde.focus();
		return false;
	}
	if(!(isFloat(FormName.pjde, "上一年度的平均单额"))) {
		return false;
	}
	if(	javaTrim(FormName.grs)=="") {
		alert("请输入[班组工人最小值]！");
		FormName.grs.focus();
		return false;
	}
	if(!(isNumber(FormName.grs, "班组工人最小值"))) {
		return false;
	}
	if(	javaTrim(FormName.zbj)=="") {
		alert("请输入[质保金最小值]！");
		FormName.zbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zbj, "质保金最小值"))) {
		return false;
	}
	if(	javaTrim(FormName.khmyd)=="") {
		alert("请输入[客户满意度最小值]！");
		FormName.khmyd.focus();
		return false;
	}
	if(!(isFloat(FormName.khmyd, "客户满意度最小值"))) {
		return false;
	}
	if(	javaTrim(FormName.zxzsgds)=="") {
		alert("请输入[班组最小在施工地数]！");
		FormName.zxzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zxzsgds, "班组最小在施工地数"))) {
		return false;
	}
	if(	javaTrim(FormName.zdzsgds)=="") {
		alert("请输入[班组最大在施工地数]！");
		FormName.zdzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zdzsgds, "班组最大在施工地数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
