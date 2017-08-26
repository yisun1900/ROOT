<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_clxlbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>材料大类名称</td> 
  <td width="32%"><select name="cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>材料小类名称</td>
  <td colspan="3"><input type="text" name="clxlmc" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfxzsl","1+不限制&2+不能超量&3+可超量需加价","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">数量限制</td>
  <td><input name="tcslxz" type="text" value="" size="20" maxlength="16"></td>
  <td align="right">超出部分加价</td>
  <td><input name="ccbfjj" type="text" value="" size="20" maxlength="16"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制减免数量</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkjm","1+不限制&2+限制","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input name="yxjmzdsl" type="text" value="" size="20" maxlength="16"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
<font size="-1"></font>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clxlmc)=="") {
		alert("请输入[材料小类名称]！");
		FormName.clxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请输入[材料大类名称]！");
		FormName.cldlmc.focus();
		return false;
	}
	if(!(isFloat(FormName.tcslxz, "套餐数量限制"))) {
		return false;
	}
	if(!(isFloat(FormName.ccbfjj, "超出部分加价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.tcslxz)!="" && javaTrim(FormName.tcslxz)!="0" ) {
			alert("错误！数量不限制，不需要[数量限制]！");
			FormName.tcslxz.select();
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("错误！数量不限制，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else if (FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("错误！数量不能超量，必须输入[数量限制]！");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "数量限制"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("错误！数量不限制，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("错误！数量可超量需加价，必须输入[数量限制]！");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "数量限制"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)=="") {
			alert("错误！数量可超量需加价，必须输入[超出部分加价]！");
			FormName.ccbfjj.focus();
			return false;
		}
		if(!(isFloat(FormName.ccbfjj, "超出部分加价"))) {
			return false;
		}
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否限制减免数量]！");
		FormName.sfkjm[0].focus();
		return false;
	}

	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
	}
	else{
		FormName.yxjmzdsl.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
