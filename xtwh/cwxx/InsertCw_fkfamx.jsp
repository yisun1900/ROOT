<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_fkfamx.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><span class="STYLE1">*</span>付款方案</td>
      <td width="28%"> 
    <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm","");
%> 
      </select>      </td>
      <td align="right" width="21%"><span class="STYLE1">*</span>收款期数</td>
      <td width="29%"> 
        <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>本期收款比率（%）</td>
      <td><input type="text" name="bqfkbl" value="" size="20" maxlength="9" >      </td>
      <td align="right"><span class="STYLE1">*</span>累计收款比率（%）</td>
      <td><input type="text" name="yfkbl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><span class="STYLE1">*</span>收款方式</td>
      <td colspan="3">
		<INPUT type="radio" name="lx" value="1">按折前收款(不含增减项)<BR>
		<INPUT type="radio" name="lx" value="2">按折前收款（含增减项一次收取）<BR>
		<INPUT type="radio" name="lx" value="3">按折前收款（含增减项分次收取）<BR><BR>

		<INPUT type="radio" name="lx" value="6">按折后收款(不含增减项)<BR>
		<INPUT type="radio" name="lx" value="7">按折后收款（含增减项一次收取）<BR>
		<INPUT type="radio" name="lx" value="8">按折后收款（含增减项分次收取）<BR><BR>

		<INPUT type="radio" name="lx" value="A">折前增减项<BR>
		<INPUT type="radio" name="lx" value="B">折后增减项<BR>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>是否按实际发生总额收款</td>
      <td><INPUT type="radio" name="sfsjfsesk" value="Y">
      是
        <input type="radio" name="sfsjfsesk" value="N">
        不含全部费用</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFFF"><span class="STYLE1"><strong>如果【不含全部费用】，请选择下述选项</strong></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含工程费</td>
      <td><%
	cf.radioToken(out, "sfbhgcf","N+不包含&Y+包含","");
%></td>
      <td align="right">是否含设计费</td>
      <td><%
	cf.radioToken(out, "sfbhsjf","N+不包含&Y+包含","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含记业绩其它费</td>
      <td><%
	cf.radioToken(out, "sfbhjrqtf","N+不包含&Y+包含","");
%></td>
      <td align="right">是否含不记业绩其它费</td>
      <td><%
	cf.radioToken(out, "sfbhbjrqtf","N+不包含&Y+包含","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">收款是否包含管理费</td>
      <td>
		<INPUT type="radio" name="sfbhglf" value="N">不包含
		<INPUT type="radio" name="sfbhglf" value="Y">包含	  </td>
      <td align="right">收款是否包含税金</td>
      <td>
		<INPUT type="radio" name="sfbhsj" value="N">不包含
		<INPUT type="radio" name="sfbhsj" value="Y">包含	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含主材费</td>
      <td><%
	cf.radioToken(out, "sfbhzcf","N+不包含&Y+包含","");
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请选择[付款方案]！");
		FormName.fkfabm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请选择[收款期数]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("请输入[累计收款比率（%）]！");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "累计收款比率（%）"))) {
		return false;
	}
	if(	javaTrim(FormName.bqfkbl)=="") {
		alert("请输入[本期收款比率（%）]！");
		FormName.bqfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bqfkbl, "本期收款比率（%）"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[收款方式]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfsjfsesk)) {
		alert("请选择[是否按实际发生总额收款]！");
		FormName.sfsjfsesk[0].focus();
		return false;
	}

	if (FormName.sfsjfsesk[1].checked)
	{
		if(	!radioChecked(FormName.sfbhgcf)) {
			alert("请选择[是否含工程费]！");
			FormName.sfbhgcf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhjrqtf)) {
			alert("请选择[是否含记业绩其它费]！");
			FormName.sfbhjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhbjrqtf)) {
			alert("请选择[是否含不记业绩其它费]！");
			FormName.sfbhbjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsjf)) {
			alert("请选择[是否含设计费]！");
			FormName.sfbhsjf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhglf)) {
			alert("请选择[收款是否包含管理费]！");
			FormName.sfbhglf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsj)) {
			alert("请选择[收款是否包含税金]！");
			FormName.sfbhsj[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhzcf)) {
			alert("请选择[是否含主材费]！");
			FormName.sfbhzcf[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
