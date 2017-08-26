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
<form method="post" action="SaveInsertTc_yhlb.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">礼包名称</td> 
  <td colspan="3"> 
    <input type="text" name="lbmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否必选</td>
  <td><input type="radio" name="sfbx"  value="1">
    必选
      <input type="radio" name="sfbx"  value="2">
      非必选 </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">礼包折前价</td> 
  <td width="32%"> 
    <input type="text" name="lbzqj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">礼包优惠价</td> 
  <td width="32%"> 
    <input type="text" name="lbyhj" value="" size="20" maxlength="17" >  </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("请输入[礼包名称]！");
		FormName.lbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbx)) {
		alert("请选择[是否必选]！");
		FormName.sfbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lbzqj)=="") {
		alert("请输入[礼包折前价]！");
		FormName.lbzqj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbzqj, "礼包折前价"))) {
		return false;
	}
	if(	javaTrim(FormName.lbyhj)=="") {
		alert("请输入[礼包优惠价]！");
		FormName.lbyhj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbyhj, "礼包优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
