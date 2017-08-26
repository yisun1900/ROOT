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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_zck.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">产品编码</font></td>
  <td><input type="text" name="cpbm" value="0" size="20" maxlength="13" readonly></td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"> 
    <input type="text" name="nbbm" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"> 
    <select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeDl(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
//	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="gg" value="" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单计量单位</td> 
  <td width="32%"> 
    <select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
  <td align="right" width="18%">下单比</td> 
  <td width="32%"> 
    <input type="text" name="xdb" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">损耗</td> 
  <td width="32%"> 
    <input type="text" name="sh" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">排序序号</td> 
  <td width="32%"><input type="text" name="xuhao" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需处理小数</td>
  <td colspan="3"><input type="radio" name="sfxclxs"  value="1">
    向上取整
      <input type="radio" name="sfxclxs"  value="2">
      向下取整
      <input type="radio" name="sfxclxs"  value="3">
      4舍5入
      <input type="radio" name="sfxclxs"  value="4">
      不处理</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算价</td> 
  <td width="32%"> 
    <input type="text" name="jsj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">客户销售单价</td> 
  <td width="32%"> 
    <input type="text" name="khxsdj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">升级价1</td> 
  <td width="32%"> 
    <input type="text" name="sjj1" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">升级价2</td> 
  <td width="32%"> 
    <input type="text" name="sjj2" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级价3</td>
  <td><input type="text" name="sjj3" value="" size="20" maxlength="17" >  </td>
  <td align="right">升级价4</td>
  <td><input type="text" name="sjj4" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队单价</td> 
  <td width="32%"> 
    <input type="text" name="sgddj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">升级价5</td> 
  <td width="32%"><input type="text" name="sjj5" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">类型</td>
  <td colspan="3"><input type="radio" name="lx"  value="1">套餐项
      <input type="radio" name="lx"  value="2">促销项
      <input type="radio" name="lx"  value="3">礼包项
      <input type="radio" name="lx"  value="4">套餐外	  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">促销项目编码</td>
  <td colspan="3"><select name="cxxmbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cxxmbm,xmmc from tc_cxxm order by xmmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">礼包项目编码</td>
  <td colspan="3"><select name="lbxmbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lbxmbm,xmmc from tc_yhlbmx order by xmmc","");
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否有效</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfyx","1+正在销售&2+停止销售&3+阶段销售&4+售前核实","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效开始时间</td>
  <td><input type="text" name="yxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">有效结束时间</td>
  <td><input type="text" name="yxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset" onClick="bc.disabled=false">    
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="CSH01-主材报价信息.xls"><B>点击右键另存为，下载Excel报价模板</B></A> </td>
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
	//启用Ajax
	cf.ajax(out);
%>

function changeDl(FormName)
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.clxl,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
		return false;
	}
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
	if(	javaTrim(FormName.cldl)=="") {
		alert("请选择[产品大类]！");
		FormName.cldl.focus();
		return false;
	}
	if(	javaTrim(FormName.clxl)=="") {
		alert("请选择[产品小类]！");
		FormName.clxl.focus();
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
		alert("请选择[计量单位]！");
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
	if(	javaTrim(FormName.sh)=="") {
		alert("请输入[损耗]！");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "损耗"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("请选择[是否需处理小数]！");
		FormName.sfxclxs[0].focus();
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
	if(	javaTrim(FormName.khxsdj)=="") {
		alert("请输入[客户销售单价]！");
		FormName.khxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.khxsdj, "客户销售单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj1)=="") {
		alert("请输入[升级价1]！");
		FormName.sjj1.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj1, "升级价1"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj2)=="") {
		alert("请输入[升级价2]！");
		FormName.sjj2.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj2, "升级价2"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj3)=="") {
		alert("请输入[升级价3]！");
		FormName.sjj3.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj3, "升级价3"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj4)=="") {
		alert("请输入[升级价4]！");
		FormName.sjj4.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj4, "升级价4"))) {
		return false;
	}
	if(	javaTrim(FormName.sjj5)=="") {
		alert("请输入[升级价5]！");
		FormName.sjj5.focus();
		return false;
	}
	if(!(isFloat(FormName.sjj5, "升级价5"))) {
		return false;
	}
	if(	javaTrim(FormName.sgddj)=="") {
		alert("请输入[施工队单价]！");
		FormName.sgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgddj, "施工队单价"))) {
		return false;
	}
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[排序序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isFloat(FormName.xuhao, "排序序号"))) {
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyx)) {
		alert("请选择[是否有效]！");
		FormName.sfyx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
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

	FormName.action="ExpBj_tczcbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
