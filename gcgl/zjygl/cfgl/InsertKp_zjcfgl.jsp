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
<form method="post" action="SaveInsertKp_zjcfgl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚记录号</td> 
  <td width="35%"> 
    <input type="text" name="cfjlh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">工程担当</td> 
  <td width="35%"> 
    <input type="text" name="zjxm" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="15%">处罚人</td> 
  <td width="35%"> 
    <input type="text" name="cfr" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚时间</td> 
  <td width="35%"> 
    <input type="text" name="cfsj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">处罚类型</td> 
  <td width="35%"> 
    <select name="cflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cflxbm,cflxmc from kp_cflxbm order by cflxbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚原因</td> 
  <td width="35%"> 
    <select name="cfyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cfyybm,cfyymc from kp_cfyybm order by cfyybm","");
%>
    </select>
  </td>
  <td align="right" width="15%">罚款总额</td> 
  <td width="35%"> 
    <input type="text" name="fkze" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">扣分</td> 
  <td width="35%"> 
    <input type="text" name="kf" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入单位</td> 
  <td width="35%"> 
    <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"></textarea>
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
	if(	javaTrim(FormName.cfjlh)=="") {
		alert("请输入[处罚记录号]！");
		FormName.cfjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.cfjlh, "处罚记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[工程担当]！");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cfr)=="") {
		alert("请输入[处罚人]！");
		FormName.cfr.focus();
		return false;
	}
	if(	javaTrim(FormName.cfsj)=="") {
		alert("请输入[处罚时间]！");
		FormName.cfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cfsj, "处罚时间"))) {
		return false;
	}
	if(	javaTrim(FormName.cflxbm)=="") {
		alert("请选择[处罚类型]！");
		FormName.cflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfyybm)=="") {
		alert("请选择[处罚原因]！");
		FormName.cfyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkze)=="") {
		alert("请输入[罚款总额]！");
		FormName.fkze.focus();
		return false;
	}
	if(!(isFloat(FormName.fkze, "罚款总额"))) {
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("请输入[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(!(isNumber(FormName.kf, "扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
