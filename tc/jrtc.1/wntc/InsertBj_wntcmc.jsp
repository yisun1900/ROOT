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
<form method="post" action="SaveInsertBj_wntcmc.jsp" name="insertform" target="_blank">
<div align="center">录入－温暖套餐</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>户型</td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐名称</td> 
  <td colspan="3"><input type="text" name="tcmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>标准面积</td> 
  <td width="32%"> 
    <input type="text" name="bzmj" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐价格</td> 
  <td width="32%"> 
    <input type="text" name="tcjg" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>平米增加单价</td> 
  <td width="32%"> 
    <input type="text" name="pmzjdj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>面积是否可增加</td> 
  <td width="32%"><input type="radio" name="mjsfkzj" value="1">
不可增加
  <input type="radio" name="mjsfkzj" value="2">
增加加价 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>主材是否需选择</td>
  <td><input type="radio" name="zcsfxxz" value="1">
自动选择
  <input type="radio" name="zcsfxxz" value="2">
人工选择 </td>
  <td align="right"><span class="STYLE1">*</span>类型</td>
  <td><input type="radio" name="lx" value="1">
温暖套餐
  <input type="radio" name="lx" value="2">
静音套餐 </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="lr" type="button" onClick="f_lrmx(insertform)"  value="录入明细" disabled>
    <input name="dr" type="button" onClick="f_drmx(insertform)"  value="导入明细" disabled>
    <input name="ck" type="button" onClick="f_ckmx(insertform)"  value="查看明细" disabled>
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
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmj)=="") {
		alert("请输入[标准面积]！");
		FormName.bzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.bzmj, "标准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("请输入[套餐价格]！");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "套餐价格"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("请输入[平米增加单价]！");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "平米增加单价"))) {
		return false;
	}
	if(	!radioChecked(FormName.mjsfkzj)) {
		alert("请选择[面积是否可增加]！");
		FormName.mjsfkzj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zcsfxxz)) {
		alert("请选择[主材是否需选择]！");
		FormName.zcsfxxz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}

	FormName.action="SaveInsertBj_wntcmc.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.dr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="InsertBj_wntczcmx.jsp";
	FormName.submit();
	return true;
}

function f_drmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_ckmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="Bj_wntczcmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
