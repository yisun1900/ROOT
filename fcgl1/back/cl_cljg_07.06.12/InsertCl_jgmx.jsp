<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCl_jgmx.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("	<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>
  </td>
      <td align="right" width="15%">材料</td> 
  <td width="35%"> 
    <select name="clbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clbm,clmc||'（'||clgg||'）' from cl_clbm order by clbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">厂价</td> 
  <td width="35%"> 
    <input type="text" name="cj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">与厂家结算价</td> 
  <td width="35%"> 
    <input type="text" name="cjjsj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司材料单价</td> 
  <td width="35%"> 
    <input type="text" name="fgsdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">工队价</td> 
  <td width="35%"> 
    <input type="text" name="gdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">仓库名称</td> 
  <td width="35%"> 
    <input type="text" name="ckmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">是否入库</td> 
  <td width="35%"> 
    <input type="radio" name="sfrk"  value="Y">是
    <input type="radio" name="sfrk"  value="N">否
  </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[材料编码]！");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cj)=="") {
		alert("请输入[厂价]！");
		FormName.cj.focus();
		return false;
	}
	if(!(isFloat(FormName.cj, "厂价"))) {
		return false;
	}
	if(	javaTrim(FormName.cjjsj)=="") {
		alert("请输入[与厂家结算价]！");
		FormName.cjjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.cjjsj, "与厂家结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsdj)=="") {
		alert("请输入[分公司材料单价]！");
		FormName.fgsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.fgsdj, "分公司材料单价"))) {
		return false;
	}
	if(	javaTrim(FormName.gdj)=="") {
		alert("请输入[工队价]！");
		FormName.gdj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdj, "工队价"))) {
		return false;
	}
	if(	javaTrim(FormName.ckmc)=="") {
		alert("请输入[仓库名称]！");
		FormName.ckmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfrk)) {
		alert("请选择[是否入库]！");
		FormName.sfrk[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
