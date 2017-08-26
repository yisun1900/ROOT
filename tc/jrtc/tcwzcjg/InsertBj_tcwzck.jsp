<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_tcwzck.jsp" name="insertform" target="_blank">
<div align="center">录入<strong>套餐外主材库</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>地区</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">产品编码</font></td> 
  <td width="32%"><input type="text" name="cpbm" value="0" size="20" maxlength="13" readonly></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>产品大类</td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>产品类别</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
//	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>产品名称</td> 
  <td width="32%"><input type="text" name="cpmc" value="" size="20" maxlength="50" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>品牌</td> 
  <td width="32%">
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>供应商</td>
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="xh" value="" size="20" maxlength="50" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="gg" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>报价计量单位</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>损耗</td> 
  <td width="32%"><input type="text" name="sh" value="" size="8" maxlength="9" >
    %（0～100）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>下单计量单位</td>
  <td><select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>下单比</td>
  <td><input type="text" name="xdb" value="" size="8" maxlength="9" >
    报价计量单位/下单计量单位</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否需处理小数</td>
  <td colspan="3">
	<input type="radio" name="sfxclxs"  value="1">向上取整
	<input type="radio" name="sfxclxs"  value="2">向下取整
	<input type="radio" name="sfxclxs"  value="3">4舍5入
	<input type="radio" name="sfxclxs"  value="4">
	不处理
    <strong>（在生成主材订单时使用）</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>单价</td> 
  <td width="32%"> 
    <input type="text" name="dj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>结算方式</td> 
  <td width="32%"><%
	cf.radioToken(out, "jsfs","1+结算价&2+结算比例","");
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>结算价</td>
  <td><input type="text" name="jsj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>结算比例</td>
  <td><input type="text" name="jsbl" value="" size="10" maxlength="17" >
  百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否有效</td>
  <td><%
	cf.radioToken(out, "sfyx","1+永远有效&2+无效&3+阶段有效","");
%></td>
  <td align="right"><font color="#FF0000">*</font>是否可改单价</td>
  <td><%
	cf.radioToken(out, "sfkgdj","Y+可改&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效开始时间</td>
  <td><input type="text" name="yxkssj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">有效结束时间</td>
  <td><input type="text" name="yxjzsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#FF0000">*</font>是否有促销</td>
  <td><input type="radio" name="sfycx" value="N">
没促销
  <input type="radio" name="sfycx" value="Y">
有促销 </td>
  <td align="right">促销单价</td>
  <td><input type="text" name="cxj" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="2" align="right" bgcolor="#E8E8FF">促销开始时间</td>
  <td height="2" bgcolor="#E8E8FF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" height="2">促销结束时间</td>
  <td height="2"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">促销结算价</td>
  <td><input name="cxjsj" type="text" id="cxjsj" value="" size="20" maxlength="17" ></td>
  <td align="right">促销结算比例</td>
  <td><input name="cxjsbl" type="text" id="cxjsbl" value="" size="10" maxlength="17" >
    百分比</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>计价方式</td>
  <td colspan="3"><%
	cf.radioToken(out, "jjfs","1+套外升级（补差价）&2+套外升级（独立计价）&3+套餐选配","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
	<input type="button"  value="重输" onClick="bc.disabled=false">
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="套餐外主材库.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changeDl(FormName)
{
	FormName.tccplbbm.length=1;

	if (FormName.tccpdlbm.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlbm,clxlmc  from jxc_clxlbm where cldlmc='"+FormName.tccpdlbm.options[FormName.tccpdlbm.selectedIndex].text+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToItem(insertform.tccplbbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyx)) {
		alert("请选择[是否有效]！");
		FormName.sfyx[0].focus();
		return false;
	}
	if (FormName.sfyx[2].checked)
	{
		if(	javaTrim(FormName.yxkssj)=="") {
			alert("请输入[有效开始时间]！");
			FormName.yxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)=="") {
			alert("请输入[有效结束时间]！");
			FormName.yxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
			return false;
		}

		if (FormName.yxjzsj.value<FormName.yxkssj.value)
		{
			alert("错误！[有效结束时间]<[有效开始时间]");
			FormName.yxjzsj.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yxkssj)!="") {
			alert("错误！不需输入[有效开始时间]！");
			FormName.yxkssj.select();
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)!="") {
			alert("错误！不需输入[有效结束时间]！");
			FormName.yxjzsj.select();
			return false;
		}
	}



	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("请输入[产品名称]！");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请选择[供应商]！");
		FormName.gysmc.focus();
		return false;
	}




	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[报价计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdjldw)=="") {
		alert("请选择[下单计量单位]！");
		FormName.xdjldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdb)=="") {
		alert("请输入[下单比]！");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "下单比"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("请选择[是否需处理小数]！");
		FormName.sfxclxs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sh)=="") {
		alert("请输入[损耗]！");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "损耗"))) {
		return false;
	}
	if (parseFloat(FormName.sh.value)<0 || parseFloat(FormName.sh.value)>100)
	{
		alert("错误！[损耗]只能在0到100之间");
		FormName.sh.select();
		return false;
	}

	
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}


	if(	!radioChecked(FormName.jsfs)) {
		alert("请选择[结算方式]！");
		FormName.jsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jsj)=="") {
		alert("请输入[结算价]！");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("请输入[促销价]！");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "促销价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("请输入[促销开始时间]！");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjssj.select();
			return false;
		}
		if(	javaTrim(FormName.cxjsj)=="") {
			alert("请输入[促销结算价]！");
			FormName.cxjsj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsj, "促销结算价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjsbl)=="") {
			alert("请输入[促销结算比例]！");
			FormName.cxjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsbl, "促销结算比例"))) {
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
		FormName.cxjsj.value="";
		FormName.cxjsbl.value="";
	}

	if(	!radioChecked(FormName.sfkgdj)) {
		alert("请选择[是否可改单价]！");
		FormName.sfkgdj[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.jjfs)) {
		alert("请选择[计价方式]！");
		FormName.jjfs[0].focus();
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

	FormName.action="SaveInsertBj_tcwzck.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}

	FormName.action="ExpBj_tcwzck.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
