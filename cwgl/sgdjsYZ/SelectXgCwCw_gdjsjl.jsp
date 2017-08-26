<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">施工队结算--修改财务结算</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_gdjsjlXgCwList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">客户编号</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_khbh" size="20" maxlength="20" >  </td>
  <td width="15%"> 
    <div align="right">施工队</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">客户姓名</div></td>
  <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td><div align="right">房屋地址</div></td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">联系方式</div></td>
  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >  </td>
  <td><div align="right">设计师</div></td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">合同号</div></td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td><div align="right">质检</div></td>
  <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">家装标志</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_jzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+家装&2+公装","");
%>
    </select>  </td>
  <td width="15%"> 
    <div align="right">折扣率</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_zkl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">提点基数</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_tdjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+客户结算金额&2+实收款&3+签约额&4+实际成本&5+工程量&9+其它","");
%>
    </select>  </td>
  <td width="15%"> 
    <div align="right">管理费提点</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_glftd" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">结算部结算人</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_jsr" size="20" maxlength="20" >  </td>
  <td width="15%"> 
    <div align="right">结算单位</div>  </td>
  <td width="35%"><select name="cw_gdjsjl_jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算部结算时间 从</td>
  <td><input type="text" name="cw_gdjsjl_jssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_gdjsjl_jssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务结算时间 从</td>
  <td><input type="text" name="cw_gdjsjl_cwjssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_gdjsjl_cwjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">结算进度</div>  </td>
  <td width="35%"><select name="cw_gdjsjl_jsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="3">财务结算</option>
  </select></td>
  <td width="15%"> 
    <div align="right">结算记录号</div>  </td>
  <td width="35%"><input type="text" name="cw_gdjsjl_gdjsjlh" size="20" maxlength="9" ></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.cw_gdjsjl_zkl, "折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_gdjsjl_glftd, "管理费提点"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj, "结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj2, "结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj, "财务结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj2, "财务结算时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
