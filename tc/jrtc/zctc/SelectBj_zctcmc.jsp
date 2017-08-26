<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_zctcmcList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐编码</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcbm" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="bj_zctcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐名称</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">原价</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_yj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐价</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">类型</td> 
  <td width="32%"><input type="radio" name="lx" value="1">
    家具套餐
      <input type="radio" name="lx" value="2">
      健康计划 </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.bj_zctcmc_tcbm, "套餐编码"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_zctcmc_yj, "原价"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_zctcmc_tcj, "套餐价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
