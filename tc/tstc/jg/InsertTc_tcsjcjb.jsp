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
<div align="center">录入－套餐升级差价表</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>套餐升级分类</td>
    <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bdm_tcsjflbm order by tcsjflbm","");
%>
    </select></td>
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
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>原报价级别</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>升级报价级别</td>
    <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' order by bjjbbm","");
%>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>计量单位</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>升级差价</td> 
  <td width="32%"><input type="text" name="sjcj" value="" size="20" maxlength="17" ></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>升级是否有促销</td>
    <td colspan="3" bgcolor="#E8E8FF">
		<input type="radio" name="sjsfycx" value="1">无促销
		<input type="radio" name="sjsfycx" value="2">无数量限制促销 
	  <input type="radio" name="sjsfycx" value="3">有数量限制促销	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF">促销开始时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" bgcolor="#E8E8FF">促销结束时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF">促销升级差价</td>
    <td bgcolor="#E8E8FF"><input type="text" name="cxsjcj" value="" size="20" maxlength="9" ></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="CSH04-套餐升级差价表.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.tcsjflbm)=="") {
		alert("请选择[套餐升级分类]！");
		FormName.tcsjflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[原报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("请选择[升级报价级别]！");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("请输入[升级差价]！");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "升级差价"))) {
		return false;
	}


	if(	!radioChecked(FormName.sjsfycx)) {
		alert("请选择[升级是否有促销]！");
		FormName.sjsfycx[0].focus();
		return false;
	}

	if (FormName.sjsfycx[1].checked || FormName.sjsfycx[2].checked)
	{
		if(	javaTrim(FormName.cxsjcj)=="") {
			alert("请输入[促销升级差价]！");
			FormName.cxsjcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxsjcj, "促销升级差价"))) {
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
	}
	else{
		FormName.cxsjcj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
	}

	FormName.action="SaveInsertTc_tcsjcjb.jsp";
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

	FormName.action="LoadDataSj.jsp";
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

	FormName.action="ExpTc_tcsjcjb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
