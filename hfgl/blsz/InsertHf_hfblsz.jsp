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
<form method="post" action="SaveInsertHf_hfblsz.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回访类型</td>
  <td colspan="3"><input type="radio" name="hflx"  value="1">
    飞单回访
      <input type="radio" name="hflx"  value="2">
      在施工回访
      <input type="radio" name="hflx"  value="3">
      完工回访 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户数开始点</td> 
  <td width="32%"> 
    <input type="text" name="khsksd" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">客户数截至点</td> 
  <td width="32%"> 
    <input type="text" name="khsjzd" value="" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访比例</td> 
  <td width="32%"> 
    <input type="text" name="hfbl" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!radioChecked(FormName.hflx)) {
		alert("请选择[回访类型]！");
		FormName.hflx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.khsksd)=="") {
		alert("请输入[客户数开始点]！");
		FormName.khsksd.focus();
		return false;
	}
	if(!(isInt(FormName.khsksd, "客户数开始点"))) {
		return false;
	}
	if(	javaTrim(FormName.khsjzd)=="") {
		alert("请输入[客户数截至点]！");
		FormName.khsjzd.focus();
		return false;
	}
	if(!(isInt(FormName.khsjzd, "客户数截至点"))) {
		return false;
	}
	if(	javaTrim(FormName.hfbl)=="") {
		alert("请输入[回访比例]！");
		FormName.hfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.hfbl, "回访比例"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
