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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">辅材领用比例－录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>材料小类编码</td> 
  <td width="32%"> 
    <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by cldlmc,clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>标准－领用比例</td> 
  <td width="32%"> 
    <input type="text" name="bzlybl" value="" size="14" maxlength="9" >
    百分比</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>领用比例－下限</td> 
  <td width="32%"><input type="text" name="lyblxx" value="" size="14" maxlength="9" >
百分比</td>
  <td align="right" width="18%"><span class="STYLE1">*</span>领用比例－上限 </td>
  <td width="32%"><input type="text" name="lyblsx" value="" size="14" maxlength="9" >
百分比</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="f_dr(insertform)"  value="导入">
	<input type="reset"  value="重输" name="reset"> 
	
	<BR><BR> 
	<A HREF="辅材领用比例.xls"><B>点击右键另存为，下载Excel报价模板</B></A>
	
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
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请选择[材料小类编码]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.clxlbm, "材料小类编码"))) {
		return false;
	}
	if(	javaTrim(FormName.bzlybl)=="") {
		alert("请输入[标准领用比例]！");
		FormName.bzlybl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzlybl, "标准领用比例"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblxx)=="") {
		alert("请输入[领用比例下限]！");
		FormName.lyblxx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblxx, "领用比例下限"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblsx)=="") {
		alert("请输入[领用比例上限]！");
		FormName.lyblsx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblsx, "领用比例上限"))) {
		return false;
	}

	FormName.action="SaveInsertJxc_fclybl.jsp";
	FormName.submit();
	return true;
}


function f_dr(FormName)//参数FormName:Form的名称
{
	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
