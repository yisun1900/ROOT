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
    <option value="9">完工结算</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付基数</td> 
  <td><select name="bfjs" style="FONT-SIZE:12PX;WIDTH:232PX">
    <OPTION value=""></OPTION>
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm order by jsjsbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>拨付比例</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
% </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否与施工队级别相关</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+是&N+否","");
%></td>
  <td align="right"><span class="STYLE1">*</span>是否完工结算</td>
  <td><%
	cf.radioToken(out, "sfwgjs","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="2" align="right"><span class="STYLE1">*</span>水电路结算方式</td>
  <td rowspan="2"><%
	cf.radioToken(out, "sdljsfs","1+不独立结算<BR>&2+独立比例不可改<BR>&3+独立比例可改<BR>&4+手工录入结算金额","");
%></td>
  <td align="right">水电路取值</td>
  <td><%
	cf.radioToken(out, "sdlqz","1+折前&2+折后&3+施工成本价","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">水电路拨付比例</td>
  <td><input type="text" name="sdlbfbl" value="" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="5" align="right"><font color="#FF0000">*</font>增减项奖罚方式</td>
  <td rowspan="5"><%
	cf.radioToken(out, "zjxjffs","1+不奖罚<BR>&2+累计折后增减项金额<BR>&3+累计增减项施工成本<BR>&4+折后增项金额减项金额<BR>&5+增项施工成本减项施工成本<BR>&6+增项施工成本折后减项金额<BR>&7+折后增项金额减项施工成本","");
%></td>
  <td align="right">增减项包含范围</td>
  <td><%
	cf.radioToken(out, "zjxbhfw","1+工程&2+其它费&3+工程＋其它费<br>&4+工程(含水电)&5+工程＋其它费(含水电)","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">增减项时间点</td>
  <td><%
	cf.radioToken(out, "zjxsjd","1+全部&2+开工前&3+开工后","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>累计增减项系数</td>
  <td><input name="ljzjxxs" type="text" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>增项系数</td>
  <td><input type="text" name="zxxs" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>减项系数</td>
  <td><input type="text" name="jxxs" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣延期费赔偿款</td>
  <td><%
	cf.radioToken(out, "sfkyqpc","Y+自动获取&S+人工录入&N+否","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>主材是否结算</td>
  <td><%
	cf.radioToken(out, "zcsfjs","1+不结算&2+按比例结算&3+人工录入","");
%></td>
  <td align="right">主材金额获取方式</td>
  <td><%
	cf.radioToken(out, "zcjehqfs","1+自动获取&2+人工录入","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">主材结算比例可修改</td>
  <td><%
	cf.radioToken(out, "zcjsblkg","1+可修改&2+不可修改","");
%></td>
  <td align="right">主材结算比例</td>
  <td><input type="text" name="zcjsbl" value="0" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" rowspan="2" align="right"><span class="STYLE1">*</span>是否扣质保金</td> 
  <td width="32%" rowspan="2"><%
	cf.radioToken(out, "sfkzbj","Y+扣质保金比例不可改<BR>&M+扣质保金比例可改<BR>&N+不扣质保金","");
%></td>
  <td align="right" width="18%">扣质保金基数</td> 
  <td width="32%"><input type="radio" name="kzbjjs"  value="1">
结算基数
  <input type="radio" name="kzbjjs"  value="2">
结算总额</td>
</tr>

<tr bgcolor="#FFFFFF">
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
  <td><input type="radio" name="sfkyfgf"  value="Y">是
      <input type="radio" name="sfkyfgf"  value="N">否 </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否扣辅材罚款</td>
  <td><%
	cf.radioToken(out, "sfkclfk","Y+自动获取&S+人工录入&N+否","");
%></td>
  <td align="right"><font color="#FF0000">*</font>是否扣材料运费</td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+自动获取&S+人工录入&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否扣主材扣款</td>
  <td><%
	cf.radioToken(out, "sfkzckk","Y+自动获取&S+人工录入&N+否","");
%></td>
  <td align="right"><font color="#FF0000">*</font>是否加主材奖励</td>
  <td><%
	cf.radioToken(out, "sfjzcjl","Y+自动获取&S+人工录入&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否扣罚款金额</td>
  <td><%
	cf.radioToken(out, "sfkfkje","Y+自动获取&S+人工录入&N+否","");
%></td>
  <td align="right"><font color="#FF0000">*</font>是否加奖励金额</td>
  <td><%
	cf.radioToken(out, "sfjjlje","Y+自动获取&S+人工录入&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否加其它金额</td>
  <td><%
	cf.radioToken(out, "sfjqtje","Y+自动获取&S+人工录入&N+否","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>最大领款合计百分比</td>
  <td colspan="3"><input name="lkhjbfb" type="text" value="100" size="10" maxlength="9" >
    %&nbsp;&nbsp;&nbsp;&nbsp;材料款+工地用品+拨工费&lt;=拨付基数*最大领款合计百分比</td>
</tr>
<tr bgcolor="#CCCCCC">
  <td height="23" colspan="4" align="center">结算条件</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>要求满足付款比例</td>
  <td><input name="fkbl" type="text" value="100" size="10" maxlength="9" >
%</td>
  <td rowspan="2" align="right"><span class="STYLE1">*</span>要求满足工程进度</td>
  <td rowspan="2"><select name="gcjdbm" size="5" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm where gcjdbm!='7' order by gcjdbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>付款是否需财务审核</td>
  <td><input type="radio" name="sksh" value="Y">需审核
    <input type="radio" name="sksh" value="N">不需审核</td>
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
	if(	javaTrim(FormName.bfjs)=="") {
		alert("请输入[拨付基数]！");
		FormName.bfjs.focus();
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
	if (FormName.sdljsfs[0].checked)
	{
		notRadio(FormName.sdlqz);
		FormName.sdlbfbl.value="0";
	}
	else 
	{
		if(	!radioChecked(FormName.sdlqz)) {
			alert("请选择[水电路取值]！");
			FormName.sdlqz[0].focus();
			return false;
		}

		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("请输入[水电路拨付比例]！");
			FormName.sdlbfbl.focus();
			return false;
		}
		if(!(isFloat(FormName.sdlbfbl, "水电路拨付比例"))) {
			return false;
		}
	}

	if(	!radioChecked(FormName.zcsfjs)) {
		alert("请选择[主材是否结算]！");
		FormName.zcsfjs[0].focus();
		return false;
	}

	if (FormName.zcsfjs[0].checked)
	{
		FormName.zcjehqfs[0].checked=true;
		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}
	else if (FormName.zcsfjs[1].checked)
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("请选择[主材金额获取方式]！");
			FormName.zcjehqfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcjsblkg)) {
			alert("请选择[主材结算比例可修改]！");
			FormName.zcjsblkg[0].focus();
			return false;
		}

		if(	javaTrim(FormName.zcjsbl)=="") {
			alert("请输入[主材结算比例]！");
			FormName.zcjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.zcjsbl, "主材结算比例"))) {
			return false;
		}
	}
	else
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("请选择[主材金额获取方式]！");
			FormName.zcjehqfs[0].focus();
			return false;
		}

		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}


	if(	!radioChecked(FormName.sfkzbj)) {
		alert("请选择[是否扣质保金]！");
		FormName.sfkzbj[0].focus();
		return false;
	}

	if (FormName.sfkzbj[2].checked)
	{
		notRadio(FormName.kzbjjs);
		FormName.kzbjbl.value="0";
	}
	else
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

	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("请选择[是否与施工队级别相关]！");
		FormName.sgdjbxg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.zjxjffs)) {
		alert("请选择[增减项奖罚方式]！");
		FormName.zjxjffs[0].focus();
		return false;
	}

	if (FormName.zjxjffs[0].checked)
	{
		FormName.ljzjxxs.value="0";
		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
		notRadio(FormName.zjxbhfw);
		notRadio(FormName.zjxsjd);
	}
	else if (FormName.zjxjffs[1].checked || FormName.zjxjffs[2].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("请选择[增减项包含范围]！");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("请选择[增减项时间点]！");
			FormName.zjxsjd[0].focus();
			return false;
		}
		if(	javaTrim(FormName.ljzjxxs)=="") {
			alert("请输入[累计增减项系数]！");
			FormName.ljzjxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.ljzjxxs, "累计增减项系数"))) {
			return false;
		}

		if (parseFloat(FormName.ljzjxxs.value)<=0)
		{
			alert("错误！[累计增减项系数]必须大于0");
			FormName.ljzjxxs.select();
			return false;
		}

		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
	}
	else if (FormName.zjxjffs[3].checked || FormName.zjxjffs[4].checked || FormName.zjxjffs[5].checked || FormName.zjxjffs[6].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("请选择[增减项包含范围]！");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("请选择[增减项时间点]！");
			FormName.zjxsjd[0].focus();
			return false;
		}

		FormName.ljzjxxs.value="0";

		if(	javaTrim(FormName.zxxs)=="") {
			alert("请输入[增项系数]！");
			FormName.zxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.zxxs, "增项系数"))) {
			return false;
		}

		if (parseFloat(FormName.zxxs.value)<=0)
		{
			alert("错误！[增项系数]必须大于0");
			FormName.zxxs.select();
			return false;
		}
		if(	javaTrim(FormName.jxxs)=="") {
			alert("请输入[减项系数]！");
			FormName.jxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.jxxs, "减项系数"))) {
			return false;
		}

		if (parseFloat(FormName.jxxs.value)<=0)
		{
			alert("错误！[减项系数]必须大于0");
			FormName.jxxs.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfkclfk)) {
		alert("请选择[是否扣辅材罚款]！");
		FormName.sfkclfk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclyf)) {
		alert("请选择[是否扣材料运费]！");
		FormName.sfkclyf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzckk)) {
		alert("请选择[是否扣主材扣款]！");
		FormName.sfkzckk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzcjl)) {
		alert("请选择[是否加主材奖励]！");
		FormName.sfjzcjl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkfkje)) {
		alert("请选择[是否扣罚款金额]！");
		FormName.sfkfkje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjjlje)) {
		alert("请选择[是否加奖励金额]！");
		FormName.sfjjlje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjqtje)) {
		alert("请选择[是否加其它金额]！");
		FormName.sfjqtje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyqpc)) {
		alert("请选择[是否扣延期费赔偿款]！");
		FormName.sfkyqpc[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfwgjs)) {
		alert("请选择[是否完工结算]！");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lkhjbfb)=="") {
		alert("请输入[最大领款合计百分比]！");
		FormName.lkhjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.lkhjbfb, "最大领款合计百分比"))) {
		return false;
	}
	if (parseFloat(FormName.lkhjbfb.value)<0 || parseFloat(FormName.lkhjbfb.value)>100)
	{
		alert("错误！[最大领款合计百分比]应在0和100之间");
		FormName.lkhjbfb.focus();
		return false;
	}


	if(	javaTrim(FormName.fkbl)=="") {
		alert("请输入[要求满足付款比例]！");
		FormName.fkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fkbl, "要求满足付款比例"))) {
		return false;
	}
	if (parseFloat(FormName.fkbl.value)<0 || parseFloat(FormName.fkbl.value)>100)
	{
		alert("错误！[要求满足付款比例]应在0和100之间");
		FormName.fkbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sksh)) {
		alert("请选择[付款是否需财务审核]！");
		FormName.sksh[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.gcjdbm)) {
		alert("请输入[要求满足工程进度]！");
		FormName.gcjdbm.focus();
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
