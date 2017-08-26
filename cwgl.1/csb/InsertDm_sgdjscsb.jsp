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
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_sgdjscsb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付次数</td> 
  <td width="32%">
  <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">第一次</option>
    <option value="2">第二次</option>
    <option value="3">第三次</option>
    <option value="4">第四次</option>
    <option value="5">第五次</option>
    <option value="6">第六次</option>
    <option value="7">第七次</option>
    <option value="8">第八次</option>
    <option value="9">第九次</option>
    <option value="10">第十次</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付基数</td> 
  <td> 
    <input type="radio" name="bfjs"  value="1">工程费
	<BR>
    <input type="radio" name="bfjs"  value="2">工程费＋其它费
	<BR>
    <input type="radio" name="bfjs"  value="3">实收款总额
	<BR>
    <input type="radio" name="bfjs"  value="4">一期款
	<BR>
    <input type="radio" name="bfjs"  value="5">二期款
	<BR>
    <input type="radio" name="bfjs"  value="6">三期款
	<BR>
    <input type="radio" name="bfjs"  value="7">工程基础报价
	<BR>
    <input type="radio" name="bfjs"  value="8">工程基础报价＋其它费基础报价
	<BR>
    <input type="radio" name="bfjs"  value="9">工程施工成本价
	<BR>
    <input type="radio" name="bfjs"  value="A">工程施工成本价＋其它费施工成本
	<BR>
    <input type="radio" name="bfjs"  value="B">工程成本价  
	<BR>
    <input type="radio" name="bfjs"  value="C">工程成本价＋其它费成本	</td>
  <td align="right"><span class="STYLE1">*</span>拨付比例</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
% </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>水电路结算方式</td>
  <td>
	<input type="radio" name="sdljsfs"  value="1">统一比例结算
	<BR>
	<input type="radio" name="sdljsfs"  value="2">独立比例结算
	<BR>
	<input type="radio" name="sdljsfs"  value="3">手工录入结算金额
	<BR>
	<input type="radio" name="sdljsfs"  value="9">不结算  </td>
  <td align="right">水电路拨付比例</td>
  <td><input type="text" name="sdlbfbl" value="" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣质保金</td> 
  <td width="32%">
	<input type="radio" name="sfkzbj"  value="Y">扣质保金比例不可改
	<BR>
	<input type="radio" name="sfkzbj"  value="M">扣质保金比例可改
	<BR>
	<input type="radio" name="sfkzbj"  value="N">不扣质保金  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">扣质保金基数</td>
  <td><input type="radio" name="kzbjjs"  value="1">
    结算基数
      <input type="radio" name="kzbjjs"  value="2">
      结算总额 </td>
  <td align="right">扣质保金比例</td>
  <td><input type="text" name="kzbjbl" value="" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣材料款</td> 
  <td width="32%"> 
    <input type="radio" name="sfkclk"  value="Y">是
    <input type="radio" name="sfkclk"  value="N">否  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣工地用品</td> 
  <td width="32%"> 
    <input type="radio" name="sfkgdyp"  value="Y">是
    <input type="radio" name="sfkgdyp"  value="N">否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣已付工费</td>
  <td><input type="radio" name="sfkyfgf"  value="Y">
    是
      <input type="radio" name="sfkyfgf"  value="N">
      否 </td>
  <td align="right"><span class="STYLE1">*</span>是否与施工队级别相关</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否完工结算</td> 
  <td width="32%"><input type="radio" name="sfwgjs"  value="Y">
是
  <input type="radio" name="sfwgjs"  value="N">
否 </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否含增减项</td> 
  <td width="32%"><input type="radio" name="sfhzjx"  value="Y">
    是
      <input type="radio" name="sfhzjx"  value="N">
      否 </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="button3" type="button" onClick="f_lr(insertform)"  value="单额结算比例">
    <input name="button" type="button" onClick="f_lr(insertform)"  value="扣质保金比例">
    <input name="button" type="button" onClick="f_jbtz(insertform)"  value="施工队级别调结算比例">
    <input name="button2" type="button" onClick="f_zbjtz(insertform)"  value="质保金调结算比例">
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
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("请选择[拨付基数]！");
		FormName.bfjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "拨付比例"))) {
		return false;
	}

	if(	!radioChecked(FormName.sdljsfs)) {
		alert("请选择[水电路结算方式]！");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[1].checked)
	{
		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("请输入[水电路拨付比例]！");
			FormName.sdlbfbl.focus();
			return false;
		}
	}
	if(!(isFloat(FormName.sdlbfbl, "水电路拨付比例"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfwgjs)) {
		alert("请选择[是否完工结算]！");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclk)) {
		alert("请选择[是否扣材料款]！");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("请选择[是否扣工地用品]！");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("请选择[是否扣已付工费]！");
		FormName.sfkyfgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzbj)) {
		alert("请选择[是否扣质保金]！");
		FormName.sfkzbj[0].focus();
		return false;
	}
	if (FormName.sfkzbj[0].checked || FormName.sfkzbj[1].checked)
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("请选择[扣质保金基数]！");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("请输入[扣质保金比例]！");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "扣质保金比例"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("请选择[是否与施工队级别相关]！");
		FormName.sgdjbxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhzjx)) {
		alert("请选择[是否含增减项]！");
		FormName.sfhzjx[0].focus();
		return false;
	}

	FormName.action="SaveInsertDm_sgdjscsb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
