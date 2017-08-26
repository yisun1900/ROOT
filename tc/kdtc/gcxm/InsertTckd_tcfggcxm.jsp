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
<div align="center">录入－套餐标准工程项目</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
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
    <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm  where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>风格名称</td>
    <td><select name="fgmc" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <td align="right"><font color="#FF0000">*</font>户型</td>
    <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>结构位置</td>
    <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>项目编号</td> 
  <td width="32%"><input type="text" name="xmbh" value="" size="20" maxlength="16" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>标准数量</td> 
  <td><input type="text" name="bzsl" value="" size="20" maxlength="17" ></td>
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
	<A HREF="套餐标准工程项目.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
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
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzsl)=="") {
		alert("请输入[标准数量]！");
		FormName.bzsl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzsl, "标准数量"))) {
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

	FormName.action="SaveInsertTckd_tcfggcxm.jsp";
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

	FormName.action="LoadDataGc.jsp";
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

	FormName.action="ExpTckd_tcfggcxm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
