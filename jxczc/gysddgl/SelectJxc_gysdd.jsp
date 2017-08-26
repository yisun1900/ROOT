<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gysddList.jsp" name="selectform">
<div align="center">修改订单</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商订单批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysddph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">下单公司</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select  dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商编码</td>
  <td><input type="text" name="jxc_gysdd_gysbm" size="20" maxlength="8" ></td>
  <td align="right">供应商名称</td>
  <td><input type="text" name="jxc_gysdd_gysmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">采购类别</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_cglb" value="J">集团采购
	<INPUT type="radio" name="jxc_gysdd_cglb" value="D">地方采购
  </td>
  <td align="right" width="18%">材料类别</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_cllb" value="0">主材
	<INPUT type="radio" name="jxc_gysdd_cllb" value="1">辅材
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单人</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_xdr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">下单日期 从</td>
  <td><input type="text" name="jxc_gysdd_xdrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gysdd_xdrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_psfs" value="1">配送
	<INPUT type="radio" name="jxc_gysdd_psfs" value="2">自取
	<INPUT type="radio" name="jxc_gysdd_psfs" value="3">其他
  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">要求到货时间 从</td>
  <td><input type="text" name="jxc_gysdd_yqdhsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gysdd_yqdhsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否发货</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="N">未发货
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="Y">已完成
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="M">部分发货
  </td>
  <td align="right" width="18%">供应商接收人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysjsr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商接收日期 从</td>
  <td><input type="text" name="jxc_gysdd_gysjsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gysdd_gysjsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商发货日期 从</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_gysfhrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_gysfhrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商发货人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysfhr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否结算</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_gysdd_sfjs" value="Y">已结算
    <INPUT type="radio" name="jxc_gysdd_sfjs" value="N">未结算
  </td>
  <td align="right" width="18%">结算人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_jsr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算日期 从</td>
  <td><input type="text" name="jxc_gysdd_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gysdd_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否直接入库申购单位</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_sfrksgdw" value="Y">直接入库申购单位
	<INPUT type="radio" name="jxc_gysdd_sfrksgdw" value="N">否
  </td>
  <td align="right" width="18%">申购批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_sgph" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">订单状态</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_ddzt" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="7">未提交</option>
		<option value="0">等待下单</option>
		<option value="1">已下单</option>
		<option value="2">已接受</option>
		<option value="3">部分发货</option>
		<option value="5">已完成发货</option>
		<option value="4">已入库</option>
		<option value="6">正在办理入库</option>
		<option value="9">已结算</option>
	</select>
  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="jxc_gysdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gysdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>  </td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.jxc_gysdd_gysbm, "供应商编码"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_xdrq, "下单日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_xdrq2, "下单日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_yqdhsj, "要求到货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_yqdhsj2, "要求到货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysjsrq, "供应商接收日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysjsrq2, "供应商接收日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysfhrq, "供应商发货日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysfhrq2, "供应商发货日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_jsrq, "结算日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_jsrq2, "结算日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
