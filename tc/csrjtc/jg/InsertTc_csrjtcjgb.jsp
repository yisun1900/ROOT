<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjtcjgb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐名称</td> 
  <td width="32%"> 
    <input type="text" name="tcmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>面积平米单价</td> 
  <td width="32%"> 
    <input type="text" name="mjpmdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>套内最小计价面积</td> 
  <td width="32%"> 
    <input type="text" name="tnzxjjmj" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>厨房单价</td> 
  <td width="32%"> 
    <input type="text" name="cfdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>厨房标准面积</td> 
  <td width="32%"> 
    <input type="text" name="cfbzmj" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>厨房超出面积单价</td> 
  <td width="32%"> 
    <input type="text" name="cfccmjdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>卫生间单价</td> 
  <td width="32%"> 
    <input type="text" name="wsjdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>卫生间标准面积</td> 
  <td width="32%"> 
    <input type="text" name="wsjbzmj" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>卫生间超出面积单价</td> 
  <td width="32%"> 
    <input type="text" name="wsjccmjdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>涂料改为壁纸减免价</td> 
  <td width="32%"> 
    <input type="text" name="tlgbzjmj" value="" size="20" maxlength="17" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请输入[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.mjpmdj)=="") {
		alert("请输入[面积平米单价]！");
		FormName.mjpmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjpmdj, "面积平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.tnzxjjmj)=="") {
		alert("请输入[套内最小计价面积]！");
		FormName.tnzxjjmj.focus();
		return false;
	}
	if(!(isNumber(FormName.tnzxjjmj, "套内最小计价面积"))) {
		return false;
	}
	if(	javaTrim(FormName.cfdj)=="") {
		alert("请输入[厨房单价]！");
		FormName.cfdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfdj, "厨房单价"))) {
		return false;
	}
	if(	javaTrim(FormName.cfbzmj)=="") {
		alert("请输入[厨房标准面积]！");
		FormName.cfbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.cfbzmj, "厨房标准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.cfccmjdj)=="") {
		alert("请输入[厨房超出面积单价]！");
		FormName.cfccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfccmjdj, "厨房超出面积单价"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjdj)=="") {
		alert("请输入[卫生间单价]！");
		FormName.wsjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjdj, "卫生间单价"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjbzmj)=="") {
		alert("请输入[卫生间标准面积]！");
		FormName.wsjbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.wsjbzmj, "卫生间标准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjccmjdj)=="") {
		alert("请输入[卫生间超出面积单价]！");
		FormName.wsjccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjccmjdj, "卫生间超出面积单价"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjmj)=="") {
		alert("请输入[涂料改为壁纸减免价]！");
		FormName.tlgbzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjmj, "涂料改为壁纸减免价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
