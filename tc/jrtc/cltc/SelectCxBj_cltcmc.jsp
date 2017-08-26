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
<form method="post" action="Bj_cltcmcCxList.jsp" name="selectform">
<div align="center">窗帘套餐－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="bj_cltcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">户型</td> 
  <td width="32%"><select name="bj_cltcmc_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐名称</td>
  <td colspan="3"><input type="text" name="tcmc" value="" size="73" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐价格</td> 
  <td width="32%"><input type="text" name="bj_cltcmc_tcjg" size="20" maxlength="17" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">主材是否需选择</td>
  <td><input type="radio" name="zcsfxxz" value="1">
    自动选择
    <input type="radio" name="zcsfxxz" value="2">
    人工选择 </td>
  <td align="right">类型</td>
  <td><input type="radio" name="lx" value="1">
    窗帘套餐
 </td>
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
	if(!(isFloat(FormName.bj_cltcmc_tcjg, "套餐价格"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
