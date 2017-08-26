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
<form method="post" action="Tc_yhlbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区</td> 
  <td width="35%"> 
    <select name="tc_yhlb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">报价级别</td> 
  <td width="35%"> 
    <select name="tc_yhlb_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">礼包名称</td> 
  <td width="35%"> 
    <input type="text" name="tc_yhlb_lbmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">是否必选</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "tc_yhlb_sfbx","1+必选&2+非必选","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">礼包折前价</td> 
  <td width="35%"> 
    <input type="text" name="tc_yhlb_lbzqj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">礼包优惠价</td> 
  <td width="35%"> 
    <input type="text" name="tc_yhlb_lbyhj" size="20" maxlength="17" >
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
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
	if(!(isFloat(FormName.tc_yhlb_lbzqj, "礼包折前价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_yhlb_lbyhj, "礼包优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
