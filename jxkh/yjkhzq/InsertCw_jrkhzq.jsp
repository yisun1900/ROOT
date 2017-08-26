<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrkhzq.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核周期</td> 
  <td width="32%"> 
    <input type="text" name="khzq" value="" size="20" maxlength="6" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核起始时间</td> 
  <td width="32%"> 
    <input type="text" name="khqssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>考核截至时间</td> 
  <td width="32%"> 
    <input type="text" name="khjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>全勤天数</td>
  <td><input type="text" name="qqts" value="" size="20" maxlength="10"  ></td>
  <td align="right">是否扣保险</td>
  <td><label>
    <input type="radio" name="radiobutton" value="radiobutton">
扣保险
<input type="radio" name="radiobutton" value="radiobutton">
不扣保险</label></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khqssj)=="") {
		alert("请输入[考核起始时间]！");
		FormName.khqssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khqssj, "考核起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.khjzsj)=="") {
		alert("请输入[考核截至时间]！");
		FormName.khjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khjzsj, "考核截至时间"))) {
		return false;
	}

	if(	javaTrim(FormName.qqts)=="") {
		alert("请输入[全勤天数]！");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "全勤天数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
