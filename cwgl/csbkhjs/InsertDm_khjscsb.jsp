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
<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_khjscsb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
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
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>允许结算调折扣</td>
  <td><input type="radio" name="sftzk"  value="1">
    是
      <input type="radio" name="sftzk"  value="3">
      否</td>
  <td align="right"><span class="STYLE1">*</span>是否有结算工程优惠</td>
  <td><input type="radio" name="sfyjsgcyh"  value="1">
手工录入
  <input type="radio" name="sfyjsgcyh"  value="2">
自动获取
<input type="radio" name="sfyjsgcyh"  value="3">
无</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否有返券</td>
  <td><input type="radio" name="sfyfq"  value="1">
手工录入
  <input type="radio" name="sfyfq"  value="2">
自动获取
<input type="radio" name="sfyfq"  value="3">
无 </td>
  <td align="right"><span class="STYLE1">*</span>是否有订金返现</td>
  <td><input type="radio" name="sfydjfx"  value="1">
手工录入
  <input type="radio" name="sfydjfx"  value="2">
自动获取
<input type="radio" name="sfydjfx"  value="3">
无 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否有抵用券</td>
  <td><input type="radio" name="sfydyq"  value="1">
手工录入
  <input type="radio" name="sfydyq"  value="2">
自动获取
<input type="radio" name="sfydyq"  value="3">
无 </td>
  <td align="right"><span class="STYLE1">*</span>是否有主材返款</td>
  <td><input type="radio" name="sfyzcfk"  value="1">
手工录入
  <input type="radio" name="sfyzcfk"  value="2">
自动获取
<input type="radio" name="sfyzcfk"  value="3">
无 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它收费项目1</td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
  <td align="right">其它收费项目2</td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它收费项目3</td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代销品主材</td> 
  <td width="32%"><input type="radio" name="sfydxpzc"  value="1">
手工录入
  <input type="radio" name="sfydxpzc"  value="2">
自动获取
<input type="radio" name="sfydxpzc"  value="3">
无 </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代销品主材优惠</td> 
  <td width="32%"><input type="radio" name="sfydxpzcyh"  value="1">
手工录入
  <input type="radio" name="sfydxpzcyh"  value="2">
自动获取
<input type="radio" name="sfydxpzcyh"  value="3">
无 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代购主材</td> 
  <td width="32%"><input type="radio" name="sfydgzc"  value="1">
手工录入
  <input type="radio" name="sfydgzc"  value="2">
自动获取
<input type="radio" name="sfydgzc"  value="3">
无 </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代购主材优惠</td> 
  <td width="32%"><input type="radio" name="sfydgzcyh"  value="1">
手工录入
  <input type="radio" name="sfydgzcyh"  value="2">
自动获取
<input type="radio" name="sfydgzcyh"  value="3">
无 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有结算主材优惠</td> 
  <td width="32%"><input type="radio" name="sfyjszcyh"  value="1">
手工录入
  <input type="radio" name="sfyjszcyh"  value="2">
自动获取
<input type="radio" name="sfyjszcyh"  value="3">
无 </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有客户赔偿款</td> 
  <td width="32%"><input type="radio" name="sfykhpc"  value="1">
    手工录入
      <input type="radio" name="sfykhpc"  value="2">
      自动获取
      <input type="radio" name="sfykhpc"  value="3">
      无 </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项1</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx1"  value="1">是
    <input type="radio" name="sfyqtx1"  value="3">否  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有延期费</td> 
  <td width="32%"><input type="radio" name="sfyyqf"  value="1">
手工录入
  <input type="radio" name="sfyyqf"  value="2">
自动获取
<input type="radio" name="sfyyqf"  value="3">
无 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项1名称</td>
  <td colspan="3"><input type="text" name="qtx1mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项2</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx2"  value="1">是
    <input type="radio" name="sfyqtx2"  value="3">否  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项2名称</td>
  <td colspan="3"><input type="text" name="qtx2mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项3</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx3"  value="1">是
    <input type="radio" name="sfyqtx3"  value="3">否  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项3名称</td>
  <td colspan="3"><input type="text" name="qtx3mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需审批</td> 
  <td width="32%"> 
    <input type="radio" name="sfxsp"  value="1">是
    <input type="radio" name="sfxsp"  value="3">否  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需结算授权</td> 
  <td width="32%"> 
    <input type="radio" name="sfxsq"  value="1">是
    <input type="radio" name="sfxsq"  value="3">否  </td>
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.sfxmbm1.length=1;
	FormName.sfxmbm2.length=1;
	FormName.sfxmbm3.length=1;

	if (FormName.fgsbh.value=="")
	{
		return;
	}

	var sql;
	sql="select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.fgsbh.value+"') order by sfxmmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.sfxmbm1,ajaxRetStr);
	strToSelect(insertform.sfxmbm2,ajaxRetStr);
	strToSelect(insertform.sfxmbm3,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftzk)) {
		alert("请选择[允许结算调折扣]！");
		FormName.sftzk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjsgcyh)) {
		alert("请选择[是否有结算工程优惠]！");
		FormName.sfyjsgcyh[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyfq)) {
		alert("请选择[是否有返券]！");
		FormName.sfyfq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydjfx)) {
		alert("请选择[是否有订金返现]！");
		FormName.sfydjfx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydyq)) {
		alert("请选择[是否有抵用券]！");
		FormName.sfydyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyzcfk)) {
		alert("请选择[是否有主材返款]！");
		FormName.sfyzcfk[0].focus();
		return false;
	}



	if(	!radioChecked(FormName.sfydxpzc)) {
		alert("请选择[是否有代销品主材]！");
		FormName.sfydxpzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydxpzcyh)) {
		alert("请选择[是否有代销品主材优惠]！");
		FormName.sfydxpzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzc)) {
		alert("请选择[是否有代购主材]！");
		FormName.sfydgzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzcyh)) {
		alert("请选择[是否有代购主材优惠]！");
		FormName.sfydgzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjszcyh)) {
		alert("请选择[是否有结算主材优惠]！");
		FormName.sfyjszcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfykhpc)) {
		alert("请选择[是否有客户赔偿款]！");
		FormName.sfykhpc[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyyqf)) {
		alert("请选择[是否有延期费]！");
		FormName.sfyyqf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqtx1)) {
		alert("请选择[是否有其它项1]！");
		FormName.sfyqtx1[0].focus();
		return false;
	}
	if (FormName.sfyqtx1[0].checked)
	{
		if(	javaTrim(FormName.qtx1mc)=="") {
			alert("请选择[其它项1名称]！");
			FormName.qtx1mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx1mc.value="";
	}

	if(	!radioChecked(FormName.sfyqtx2)) {
		alert("请选择[是否有其它项2]！");
		FormName.sfyqtx2[0].focus();
		return false;
	}
	if (FormName.sfyqtx2[0].checked)
	{
		if(	javaTrim(FormName.qtx2mc)=="") {
			alert("请选择[其它项1名称]！");
			FormName.qtx2mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx2mc.value="";
	}
	if(	!radioChecked(FormName.sfyqtx3)) {
		alert("请选择[是否有其它项3]！");
		FormName.sfyqtx3[0].focus();
		return false;
	}
	if (FormName.sfyqtx3[0].checked)
	{
		if(	javaTrim(FormName.qtx3mc)=="") {
			alert("请选择[其它项3名称]！");
			FormName.qtx3mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx3mc.value="";
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("请选择[是否需审批]！");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("请选择[是否需结算授权]！");
		FormName.sfxsq[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
