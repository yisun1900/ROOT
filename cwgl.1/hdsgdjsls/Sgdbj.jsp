<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="sgdtjb.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    客户编号  </td>
  <td width="33%"> 
    <input type="text" name="cw_gdjsjl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="19%"> 
    施工队  </td>
  <td width="31%"> 
    <select name="cw_gdjsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 结算记录号 </td>
  <td><input type="text" name="cw_gdjsjl_gdjsjlh" size="20" maxlength="9" >  </td>
  <td align="right"> 客户姓名 </td>
  <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 房屋地址 </td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right"> 联系方式 </td>
  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 设计师 </td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right"> 合同号 </td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 质检 </td>
  <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
  <td align="right">家装标志</td>
  <td><select name="cw_gdjsjl_jzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+家装&2+公装","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    提点基数  </td>
  <td width="33%"> 
    <select name="cw_gdjsjl_tdjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+应付工程款总额&2+实收款&3+签约额&4+实际成本&5+工程量&9+其它","");
%>
    </select>  </td>
  <td align="right" width="19%"> 
    管理费提点  </td>
  <td width="31%"> 
    <input type="text" name="cw_gdjsjl_glftd" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算部结算人</td>
  <td><input type="text" name="cw_gdjsjl_jsr" size="20" maxlength="20" ></td>
  <td align="right">结算单位</td>
  <td><select name="cw_gdjsjl_jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">结算部结算时间 从</td>
  <td width="33%"><input type="text" name="cw_gdjsjl_jssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">到</td>
  <td width="31%"><input type="text" name="cw_gdjsjl_jssj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审批时间 从</td>
  <td><input type="text" name="cw_gdjsjl_spsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_gdjsjl_spsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审批人</td>
  <td><input type="text" name="cw_gdjsjl_spr" size="20" maxlength="20" ></td>
  <td align="right">审批结论</td>
  <td><%
	cf.radioToken(out, "cw_gdjsjl_spjl","3+通过&4+未通过","");
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">财务结算时间 从</td>
  <td width="33%"><input type="text" name="cw_gdjsjl_cwjssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">到</td>
  <td width="31%"><input type="text" name="cw_gdjsjl_cwjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 财务结算人 </td>
  <td><input type="text" name="cw_gdjsjl_cwjsr" size="20" maxlength="20" >
  </td>
  <td align="right">结算进度 </td>
  <td><select name="cw_gdjsjl_jsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectToken(out,"1+结算部结算&2+结算审批&3+财务结算","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">分公司</div></td>
  <td bgcolor="#FFFFCC"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>
  </td>
  <td align="right" width="19%">&nbsp;</td>
  <td width="31%">&nbsp;</td>
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
	if(!(isFloat(FormName.cw_gdjsjl_glftd, "管理费提点"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj, "结算部结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj2, "结算部结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_spsj2, "审批时间"))) {
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
