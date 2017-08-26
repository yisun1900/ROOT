<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrtcbl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">分公司</td> 
  <td width="28%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店长设计费提成比例</td>
  <td><input type="text" name="dzsjftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right">店长装修费提成比例</td>
  <td><input type="text" name="dzzxftcbl" value="" size="10" maxlength="17" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">文员装修费提成比例</td> 
  <td width="28%"><input type="text" name="wyzxftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">业务员设计费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="khjlsjftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">业务员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="khjlzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">设计师设计费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjssjftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">设计师装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjszxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">设计师远程费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjsycftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户经理装修费提成比例</td>
  <td><input type="text" name="zjzxftcbl" value="" size="10" maxlength="17" >
%</td>
  <td align="right">客户经理远程费提成比例</td>
  <td><input type="text" name="zjycftcbl" value="" size="10" maxlength="17" >
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">材料员装修费提成比例</td> 
  <td width="28%"><input type="text" name="clyzxftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right" width="22%">小区主管装修费提成比例</td> 
  <td width="28%"><input type="text" name="xqzgzxftcbl" value="" size="10" maxlength="17" >
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">小区组长装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="xqzzzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">小区专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="xqzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网络营销主管装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wlyxzgzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">营销专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="yxzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站策划装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wzchzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">网页设计装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wysjzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站程序员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wzcxyzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">电话专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="dhzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站推广员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wztgyzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">司机装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">录入人</td> 
  <td width="28%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right" width="22%">录入时间 </td>
  <td width="28%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("请输入[店长设计费提成比例]！");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "店长设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("请输入[店长装修费提成比例]！");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "店长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("请输入[文员装修费提成比例]！");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "文员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("请输入[业务员设计费提成比例]！");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "业务员设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("请输入[业务员装修费提成比例]！");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "业务员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("请输入[设计师设计费提成比例]！");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "设计师设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("请输入[设计师装修费提成比例]！");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "设计师装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("请输入[设计师远程费提成比例]！");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "设计师远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("请输入[客户经理装修费提成比例]！");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "客户经理装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("请输入[客户经理远程费提成比例]！");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "客户经理远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("请输入[小区主管装修费提成比例]！");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "小区主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("请输入[小区组长装修费提成比例]！");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "小区组长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("请输入[小区专员装修费提成比例]！");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "小区专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("请输入[网络营销主管装修费提成比例]！");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "网络营销主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("请输入[营销专员装修费提成比例]！");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "营销专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("请输入[网站策划装修费提成比例]！");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "网站策划装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("请输入[网页设计装修费提成比例]！");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "网页设计装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("请输入[网站程序员装修费提成比例]！");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "网站程序员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("请输入[电话专员装修费提成比例]！");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "电话专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("请输入[网站推广员装修费提成比例]！");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "网站推广员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("请输入[司机装修费提成比例]！");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "司机装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("请输入[材料员装修费提成比例]！");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "材料员装修费提成比例"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
