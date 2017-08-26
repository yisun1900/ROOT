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
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_dzbjbb.jsp" name="insertform" target="_blank">
<div align="center">录入报价版本</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>地区</td> 
  <td width="33%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>报价版本号</td>
  <td colspan="3"><input type="text" name="bjbbh" value="" size="73" maxlength="50" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否在用版本</td>
  <td colspan="3">
	<INPUT type="radio" name="sfzybb" value="1">未启用
	<INPUT type="radio" name="sfzybb" value="2">当前版
	<INPUT type="radio" name="sfzybb" value="3">可用版
	<INPUT type="radio" name="sfzybb" value="4">已停用  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>启用时间</td>
  <td><input type="text" name="qysj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>有效期</td>
  <td><input type="text" name="yxq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请输入[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfzybb)) {
		alert("请选择[是否在用版本]！");
		FormName.sfzybb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.qysj)=="") {
		alert("请输入[启用时间]！");
		FormName.qysj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qysj, "启用时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yxq)=="") {
		alert("请输入[有效期]！");
		FormName.yxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxq, "有效期"))) {
		return false;
	}
	if (FormName.yxq.value<FormName.qysj.value)
	{
		alert("[有效期]不能小于[启用时间]！");
		FormName.yxq.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
