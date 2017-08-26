<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_dejsglfl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">序号</td>
      <td width="29%"> 
        <input type="text" name="xh" value="" size="20" maxlength="8" >
      </td>
      <td align="right" width="21%">地区</td>
      <td width="29%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">成本金额起始值（>=）</td>
      <td width="29%"> 
        <input type="text" name="qsz" value="" size="20" maxlength="17" >
      </td>
      <td align="right" width="21%">成本金额截止值（<）</td>
      <td width="29%"> 
        <input type="text" name="jzz" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">适用结算比例(0-100)</td>
      <td width="29%"> 
        <input type="text" name="jsbl" value="" size="20" maxlength="17" >
      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
      </td>
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("请输入[成本金额起始值（>=）]！");
		FormName.qsz.focus();
		return false;
	}
	if(!(isFloat(FormName.qsz, "成本金额起始值（>=）"))) {
		return false;
	}
	if(	javaTrim(FormName.jzz)=="") {
		alert("请输入[成本金额截止值（<）]！");
		FormName.jzz.focus();
		return false;
	}
	if(!(isFloat(FormName.jzz, "成本金额截止值（<）"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例(0-100)]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例(0-100)"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
