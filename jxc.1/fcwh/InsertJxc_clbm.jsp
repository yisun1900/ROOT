<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_clbm.jsp" name="insertform" target="_blank">
<div align="center">请录入辅材</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>材料大类</td>
    <td>
	<select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>材料小类</td>
    <td>
	<select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeClxlbm(insertform)">
        <option value=""></option>
    </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>子品牌</td>
    <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>采购类别</td>
    <td><input type="radio" name="cglb" value="J">
      集团采购
        <input type="radio" name="cglb" value="D">
      地方采购 </td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料名称</td> 
  <td colspan="3"><input type="text" name="clmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">内部编码</td>
  <td><input type="text" name="nbbm" value="" size="20" maxlength="100" ></td>
  <td align="right"><span class="STYLE1">*</span>计量单位</td>
  <td><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">型号</td>
  <td><input type="text" name="xh" value="" size="20" maxlength="100" ></td>
  <td align="right">规格</td>
  <td><input type="text" name="gg" value="" size="20" maxlength="100" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">单件重量</td>
  <td><input type="text" name="djzl" value="" size="20" maxlength="100" >
KG</td>
  <td align="right"><span class="STYLE1">*</span>包装计量单位</td>
  <td><select name="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>包装规格</td>
  <td colspan="3"><input type="text" name="bzgg" value="" size="12" maxlength="8" >
    （&gt;=1） 包装计量单位/计量单位</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">材料尺寸</td>
  <td colspan="3">长
    <input type="text" name="clcd" value="" size="10" maxlength="100" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宽
    <input type="text" name="clkd" value="" size="10" maxlength="100" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高
    <input type="text" name="clgd" value="" size="10" maxlength="100" >
    cm</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">保质期</td> 
  <td width="32%"> 
    <input type="text" name="bzq" value="" size="10" maxlength="10" >
    天</td>
  <td align="right" width="18%">保质期提醒</td> 
  <td width="32%"> 
    <input type="text" name="bztxq" value="" size="10" maxlength="10" >
    天 </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">采购周期</td> 
  <td width="32%"><input type="text" name="cgzq" value="" size="10" maxlength="10" >
    天</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>  </td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="f_dr(insertform)"  value="导入">
	<input type="reset"  value="重输" name="reset"> 
	
	<BR><BR> 
	<A HREF="辅材信息.xls"><B>点击右键另存为，下载Excel报价模板</B></A>
	
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

var lx="";

function changeCldlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeClxlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and cldl='"+FormName.cldlbm.value+"'  order by ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (lx=="2")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}



function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料大类]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请输入[材料小类]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cglb)) {
		alert("请选择[采购类别]！");
		FormName.cglb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[材料名称]！");
		FormName.clmc.focus();
		return false;
	}

	if(javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(javaTrim(FormName.bzjldwbm)=="") {
		alert("请选择[包装计量单位]！");
		FormName.bzjldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzgg)=="") {
		alert("请输入[包装规格]！");
		FormName.bzgg.focus();
		return false;
	}
	if(!(isNumber(FormName.bzgg, "包装规格"))) {
		return false;
	}
	if (parseFloat(FormName.bzgg.value)<1)
	{
		alert("[包装规格]必须大于或者等于1！");
		FormName.bzgg.select();
		return false;
	}

	if(!(isFloat(FormName.djzl, "单件重量"))) {
		return false;
	}
	if(!(isFloat(FormName.clcd, "长"))) {
		return false;
	}
	if(!(isFloat(FormName.clkd, "宽"))) {
		return false;
	}
	if(!(isFloat(FormName.clgd, "高"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "保质期"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "保质提醒期"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "采购周期"))) {
		return false;
	}

	FormName.action="SaveInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
