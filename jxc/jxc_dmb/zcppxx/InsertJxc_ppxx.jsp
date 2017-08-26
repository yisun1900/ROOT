<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppxx.jsp" name="insertform" target="_blank">
<div align="center"> 主材－子品牌录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>子品牌名称</td>
    <td colspan="3"><input type="text" name="ppmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌类别</td>
  <td width="32%">
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value="1">主材</option>
  </select></td>
  <td width="18%" align="right"><span class="STYLE1">*</span>品牌</td>
  <td width="32%"><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc c1,scsmc c2 from jxc_scsxx where scslb in('1','3')  order by scsmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料大类</td>
  <td><select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">子品牌负责人</td>
  <td><input name="ppfzr" type="text" id="ppfzr" value="" size="20" maxlength="20" ></td>
  <td width="18%" align="right">每日安装户数限制</td>
  <td width="32%"><input type="text" name="mrazhs" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务代码</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20" ></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
      <textarea name="bz" cols="72" rows="2"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">	</td>
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

	if(	javaTrim(FormName.pplb)=="") {
		alert("请选择[子品牌类别]！");
		FormName.pplb.focus();
		return false;
	}
	if(	javaTrim(FormName.cldl)=="") {
		alert("请选择[材料大类]！");
		FormName.cldl.focus();
		return false;
	}

	if(	javaTrim(FormName.scsmc)=="") {
		alert("请输入[品牌]！");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(!(isNumber(FormName.mrazhs, "每日安装户数限制"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
