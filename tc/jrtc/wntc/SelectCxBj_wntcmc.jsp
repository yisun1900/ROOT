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
<form method="post" action="Bj_wntcmcCxList.jsp" name="selectform">
<div align="center">温暖套餐－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="bj_wntcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">户型</td> 
  <td width="32%"><select name="bj_wntcmc_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="18%">标准面积</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_bzmj" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">套餐价格</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_tcjg" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">平米增加单价</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_pmzjdj" size="20" maxlength="17" >  </td>
  <td align="right">面积是否可增加</td>
  <td><input type="radio" name="mjsfkzj" value="1">
    不可增加
    <input type="radio" name="mjsfkzj" value="2">
    增加加价 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">主材是否需选择</td>
  <td><input type="radio" name="zcsfxxz" value="1">
    自动选择
    <input type="radio" name="zcsfxxz" value="2">
    人工选择 </td>
  <td align="right">类型</td>
  <td><input type="radio" name="lx" value="1">
    温暖套餐
    <input type="radio" name="lx" value="2">
    静音套餐 </td>
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
	if(!(isNumber(FormName.bj_wntcmc_bzmj, "标准面积"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_wntcmc_tcjg, "套餐价格"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_wntcmc_pmzjdj, "平米增加单价"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
