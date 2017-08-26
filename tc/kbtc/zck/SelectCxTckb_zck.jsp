<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Tckb_zckCxList.jsp" name="selectform">
<div align="center">套餐主材库－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="tckb_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right">报价级别</td>
  <td><select name="tckb_zck_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"><input type="text" name="tckb_zck_cpbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">科宝物料编码</td> 
  <td width="32%"><input type="text" name="kbwlbm" value="" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">科宝产品编码</td>
  <td><input type="text" name="kbcpbm" value="" size="20" maxlength="20" ></td>
  <td align="right">允许替换升级</td>
  <td><input type="radio" name="yxthsj"  value="Y">
允许
  <input type="radio" name="yxthsj"  value="N">
否</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"><select name="cpdl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"><select name="cpxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">规格</td>
  <td><input type="text" name="tckb_zck_gg" size="20" maxlength="50" ></td>
  <td align="right">材料类型</td>
  <td><input type="radio" name="cllx" value="1">
包内产品
  <input type="radio" name="cllx" value="2">
包外产品</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"><input type="text" name="tckb_zck_cpmc" size="20" maxlength="100" ></td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商</td>
  <td colspan="3"><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="tckb_zck_xh" size="20" maxlength="50" ></td>
  <td align="right" width="18%">型号（模糊查询）</td> 
  <td width="32%"><input type="text" name="tckb_zck_xh2" size="14" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"><select name="tckb_zck_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">是否可改单价</td> 
  <td width="32%">
	<INPUT type="radio" name="sfkgdj" value="Y">是
    <INPUT type="radio" name="sfkgdj" value="N">否  </td>
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
  <td align="right">是否有效</td>
  <td colspan="3"><INPUT type="radio" name="sfyx" value="1">
    正在销售
    <INPUT type="radio" name="sfyx" value="2">
    停止销售
    <INPUT type="radio" name="sfyx" value="3">
    阶段销售
    <INPUT type="radio" name="sfyx" value="4">
    售前核实 </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">有效开始时间 从</td>
  <td><input type="text" name="yxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效结束时间 从</td>
  <td><input type="text" name="yxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="tckb_zck_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="tckb_zck_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="tckb_zck_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">排序序号</td> 
  <td width="32%"><input type="text" name="tckb_zck_xuhao" size="20" maxlength="8" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
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


function changeDl(FormName)
{
	FormName.cpxl.length=1;

	if (FormName.cpdl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2  from jxc_clxlbm where cldlmc='"+FormName.cpdl.options[FormName.cpdl.selectedIndex].text+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToItem(selectform.cpxl,ajaxRetStr);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.tckb_zck_xuhao, "排序序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.tckb_zck_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tckb_zck_lrsj2, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
