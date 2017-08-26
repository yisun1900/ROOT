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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">录入－套餐风格主材项目小计</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#E8E8FF">
    <td align="right"><font color="#FF0000">*</font>地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <td align="right"><font color="#FF0000">*</font>报价级别</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#E8E8FF">
  <td width="16%" align="right"><font color="#FF0000">*</font>风格名称</td> 
  <td width="34%"><select name="fgmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		out.println("<option value=\"\"></option>");

		if (yhjs.equals("A0"))
		{
			cf.selectItem(out,"select distinct tcmc c1,tcmc c2,dqbm from tckd_tcjgb order by dqbm,tcmc","");
		}
		else{
			cf.selectItem(out,"select distinct tcmc c1,tcmc c2 from tckd_tcjgb where dqbm='"+dqbm+"' order by tcmc","");
		}
%>
    </select></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>户型</td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td width="16%" align="right"><font color="#FF0000">*</font>结构位置</td> 
  <td width="34%"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
  </select></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>产品类别</td> 
  <td width="32%"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td>
	  <input type="radio" name="sfxzsl"  value="2">不可超量 
	  <input type="radio" name="sfxzsl"  value="3">无数量限制  </td>
  <td align="right">标准数量</td>
  <td><input type="text" name="bzsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否必选项</td>
  <td><input type="radio" name="sfbxx"  value="Y">
是
  <input type="radio" name="sfbxx"  value="N">
否 </td>
  <td align="right"><font color="#FF0000">*</font>是否要求相同品牌</td>
  <td><input type="radio" name="sfyqxtpp"  value="Y">
是
  <input type="radio" name="sfyqxtpp"  value="N">
否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>升级是否收费</td>
  <td><input type="radio" name="sfyxsj"  value="Y">
是
  <input type="radio" name="sfyxsj"  value="N">
否 </td>
  <td align="right">套餐升级分类</td>
  <td><input type="text" name="sjfl" size="20" maxlength="50"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级计价方式</td>
  <td><input type="radio" name="sjjjfs"  value="1">按套
  <input type="radio" name="sjjjfs"  value="2">按数量
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否可减免</td>
  <td>
	<input type="radio" name="sfkjm"  value="1">不可减免
	<input type="radio" name="sfkjm"  value="2">可减免  </td>
  <td align="right">减免分类</td>
  <td><input type="text" name="jmfl" size="20" maxlength="50"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">减免计量单位</td>
  <td><select name="jmjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">减免单价</td>
  <td><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="套餐风格主材项目小计.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
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
	if(	javaTrim(FormName.fgmc)=="") {
		alert("请选择[风格名称]！");
		FormName.fgmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}
	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("错误！数量可增项，必须输入[标准数量]！");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "标准数量"))) {
			return false;
		}
	}
	else
	{
		FormName.bzsl.value="";
	}


	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("请选择[是否要求相同品牌]！");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("请选择[升级是否收费]！");
		FormName.sfyxsj[0].focus();
		return false;
	}
	if (FormName.sfyxsj[0].checked)
	{
		if(	javaTrim(FormName.sjfl)=="") {
			alert("错误！必须输入[套餐升级分类]！");
			FormName.sjfl.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.sjfl)!="")
	{
		if(	!radioChecked(FormName.sjjjfs)) {
			alert("请选择[升级计价方式]！");
			FormName.sjjjfs[0].focus();
			return false;
		}
	}


	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否可减免]！");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.jmfl)=="") {
			alert("错误！必须输入[减免分类]！");
			FormName.jmfl.focus();
			return false;
		}
		if(	javaTrim(FormName.jmjldw)=="") {
			alert("错误！必须输入[减免计量单位]！");
			FormName.jmjldw.focus();
			return false;
		}
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！必须输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("错误！必须输入[减免单价]！");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "减免单价"))) {
			return false;
		}
	}
	else
	{
		FormName.jmfl.value="";
		FormName.jmjldw.value="";
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
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

	FormName.action="SaveInsertTckd_tcfgzcxmxj.jsp";
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

	FormName.action="LoadDataZc.jsp";
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

	FormName.action="ExpTckd_tcfgzcxmxj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
