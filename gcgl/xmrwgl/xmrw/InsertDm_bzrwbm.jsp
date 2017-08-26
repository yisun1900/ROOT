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
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">录入－自定义任务</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>任务分类</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE2">*</span>任务编码(4位)</td>
  <td><input type="text" name="rwbm" value="" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>任务名称</td> 
  <td colspan="3"><input type="text" name="rwmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">摘要任务</td>
  <td colspan="3">
  <select name="zyrwbm" style="FONT-SIZE:12PX;WIDTH:524PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>需工艺停工</td>
  <td><input type="radio" name="xgytg"  value="Y">
    是
    <input type="radio" name="xgytg"  value="N">
    否 </td>
  <td rowspan="4" align="right">涉及产品分类</td>
  <td rowspan="4"><select name="cpflbm" size="7" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">工艺停工天数</td>
  <td><input type="text" name="gytgts" value="" size="20" maxlength="8" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否涉及产品信息</td>
  <td><input type="radio" name="sjcpxx"  value="Y">
    是
    <input type="radio" name="sjcpxx"  value="N">
    否 </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>报警级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>报警类别</td>
  <td colspan="3"><input type="radio" name="bjlb"  value="1">
    事前报警
      <input type="radio" name="bjlb"  value="2">
      事后提醒
      <input type="radio" name="bjlb"  value="3">
      事前事后都提醒
      <input type="radio" name="bjlb"  value="9">
      一般记录 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">事前提醒天数</td> 
  <td width="33%"> 
    <input type="text" name="sqtxts" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="17%">事后提醒天数</td> 
  <td width="33%"><input type="text" name="shtxts" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">事前提醒内容</td> 
  <td colspan="3"><textarea name="sqtxnr" cols="72" rows="2"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事后提醒内容</td>
  <td colspan="3"><textarea name="shtxnr" cols="72" rows="2"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否为里程碑</td>
  <td><input type="radio" name="sfwlcb"  value="Y">
是
  <input type="radio" name="sfwlcb"  value="N">
否 </td>
  <td align="right"><span class="STYLE2">*</span>任务序号</td>
  <td><input name="rwxh" type="text" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>是否影响后续工期</td> 
  <td width="33%"><input type="radio" name="sfyxhxgq"  value="Y">
    是
      <input type="radio" name="sfyxhxgq"  value="N">
      否 </td>
  <td align="right" width="17%"><span class="STYLE2">*</span>是否影响复尺</td> 
  <td width="33%"><input type="radio" name="sfyxfc"  value="Y">
    是
      <input type="radio" name="sfyxfc"  value="N">
      否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>是否需验收</td> 
  <td width="33%"><input type="radio" name="sfxys"  value="Y">
    是
      <input type="radio" name="sfxys"  value="N">
      否 </td>
  <td align="right" width="17%"><span class="STYLE2">*</span>重点监控任务</td> 
  <td width="33%"><input type="radio" name="zdjkrw"  value="1">
    重点监控
      <input type="radio" name="zdjkrw"  value="2">
      非重点监控 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">关注内容</td>
  <td colspan="3"><textarea name="gznr" cols="72" rows="5"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">任务备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="2"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button" onClick="f_do1(insertform)"  value="任务逻辑关系" name="ljgx" disabled>
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
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("请选择[任务分类]！");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwmc)=="") {
		alert("请输入[任务名称]！");
		FormName.rwmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.xgytg)) {
		alert("请选择[需工艺停工]！");
		FormName.xgytg[0].focus();
		return false;
	}
	if(!(isNumber(FormName.gytgts, "工艺停工天数"))) {
		return false;
	}
	if(	!radioChecked(FormName.sjcpxx)) {
		alert("请选择[是否涉及产品信息]！");
		FormName.sjcpxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("请选择[报警类别]！");
		FormName.bjlb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("请选择[报警类别]！");
		FormName.bjlb[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqtxts, "事前提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.shtxts, "事后提醒天数"))) {
		return false;
	}
	if (FormName.bjlb[0].checked )
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("请输入[事前提醒天数]！");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("请输入[事前提醒内容]！");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[事后提醒天数]应为空！");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[事后提醒内容]应为空！");
			FormName.shtxnr.select();
			return false;
		}
	}
	else if (FormName.bjlb[1].checked )
	{
		if(	javaTrim(FormName.shtxts)=="") {
			alert("请输入[事后提醒天数]！");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("请输入[事后提醒内容]！");
			FormName.shtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[事前提醒天数]应为空！");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[事前提醒内容]应为空！");
			FormName.sqtxnr.select();
			return false;
		}
	}
	else if ( FormName.bjlb[2].checked)
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("请输入[事前提醒天数]！");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("请输入[事前提醒内容]！");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)=="") {
			alert("请输入[事后提醒天数]！");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("请输入[事后提醒内容]！");
			FormName.shtxnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[事前提醒天数]应为空！");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[事前提醒内容]应为空！");
			FormName.sqtxnr.select();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[事后提醒天数]应为空！");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[事后提醒内容]应为空！");
			FormName.shtxnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfwlcb)) {
		alert("请选择[是否为里程碑]！");
		FormName.sfwlcb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("请输入[任务序号]！");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isFloat(FormName.rwxh, "任务序号"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("请选择[是否影响后续工期]！");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxfc)) {
		alert("请选择[是否影响复尺]！");
		FormName.sfyxfc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxys)) {
		alert("请选择[是否需验收]！");
		FormName.sfxys[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("请选择[重点监控任务]！");
		FormName.zdjkrw[0].focus();
		return false;
	}

	FormName.action="SaveInsertDm_bzrwbm.jsp";
	FormName.submit();
	FormName.ljgx.disabled=false;
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="InsertDm_bzrwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
