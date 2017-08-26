<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_jgb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">地区</td> 
  <td width="33%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="17%">报价级别</td> 
  <td width="33%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">套餐名称</td> 
  <td width="33%"> 
    <input type="text" name="tcmc" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="17%">平米单价</td> 
  <td width="33%"> 
    <input type="text" name="mjdj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最小面积</td>
  <td><input type="text" name="zxmj" value="" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">油漆限定颜色数量</td>
  <td><input type="text" name="yssl" value="" size="20" maxlength="17" ></td>
  <td align="right">调色费</td>
  <td><input type="text" name="tsf" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">每套卫浴价格</td> 
  <td width="33%"><input type="text" name="wyjg" value="" size="20" maxlength="17" ></td>
  <td align="right" width="17%">每套磁砖价格 </td>
  <td width="33%"><input type="text" name="czjg" value="" size="20" maxlength="17" ></td>
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
	if(	javaTrim(FormName.mjdj)=="") {
		alert("请输入[平米单价]！");
		FormName.mjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjdj, "平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.zxmj)=="") {
		alert("请输入[最小面积]！");
		FormName.zxmj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxmj, "最小面积"))) {
		return false;
	}

	if(	javaTrim(FormName.yssl)=="") {
		alert("请输入[油漆限定颜色数量]！");
		FormName.yssl.focus();
		return false;
	}
	if(!(isNumber(FormName.yssl, "油漆限定颜色数量"))) {
		return false;
	}
	if(	javaTrim(FormName.tsf)=="") {
		alert("请输入[调色费]！");
		FormName.tsf.focus();
		return false;
	}
	if(!(isFloat(FormName.tsf, "调色费"))) {
		return false;
	}
	
	if(	javaTrim(FormName.wyjg)=="") {
		alert("请输入[每套卫浴价格]！");
		FormName.wyjg.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjg, "每套卫浴价格"))) {
		return false;
	}
	
	if(	javaTrim(FormName.czjg)=="") {
		alert("请输入[每套磁砖价格]！");
		FormName.czjg.focus();
		return false;
	}
	if(!(isFloat(FormName.czjg, "每套磁砖价格"))) {
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
