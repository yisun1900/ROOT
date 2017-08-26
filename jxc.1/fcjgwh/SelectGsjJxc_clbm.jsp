<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_cljgbGsjList.jsp" name="insertform">
<div align="center">修改分公司价</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料大类</td>
  <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
  </select></td>
  <td align="right">材料小类</td>
  <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(insertform)">
    <option value=""></option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料编码</td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料名称</td>
  <td><input type="text" name="clmc" size="20" maxlength="50" ></td>
  <td align="right">子品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">包装计量单位</td> 
  <td width="32%"><select name="bzjldwbm" id="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">单件重量 从</td> 
  <td width="32%"> 
    <input type="text" name="djzl" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="djzl2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">采购周期 从</td> 
  <td width="32%"> 
    <input type="text" name="cgzq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cgzq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">保质期 从</td> 
  <td width="32%"> 
    <input type="text" name="bzq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="bzq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">保质提醒期 从</td> 
  <td width="32%"> 
    <input type="text" name="bztxq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="bztxq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商</td>
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('2','3') order by gysmc","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">销售方式</td>
  <td colspan="3"><input type="radio" name="xsfs" value="1">
代销品
  <input type="radio" name="xsfs" value="2">现货销售
<input type="radio" name="xsfs" value="3">
期货销售
<input type="radio" name="xsfs" value="4">
虚拟出入库 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否常用</td>
  <td>
	  <input type="radio" name="sfcy" value="Y">常用
	  <input type="radio" name="sfcy" value="N">非常用 
  </td>
  <td align="right">是否有货</td>
  <td>
     <input type="radio" name="sfyh" value="Y">有货
     <input type="radio" name="sfyh" value="N">无货 
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">每页显示数量</td>
  <td><input type="text" name="myxssl" size="20" value="30"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(insertform)">
    <input type="reset"  value="重输">  </td>
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
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and clxl='"+FormName.clxlbm.value+"'  order by ppmc";

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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(!(isNumber(FormName.djzl, "单件重量"))) {
		return false;
	}
	if(!(isNumber(FormName.djzl2, "单件重量"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "采购周期"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq2, "采购周期"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "保质期"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq2, "保质期"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "保质提醒期"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq2, "保质提醒期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	if(	javaTrim(FormName.myxssl)=="") {
		alert("请选择[每页显示数量]！");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "每页显示数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
