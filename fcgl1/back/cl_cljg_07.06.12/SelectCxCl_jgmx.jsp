<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_jgmxCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="cl_jgmx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("	<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>
  </td>
  <td align="right" width="15%">材料编码</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_clbm" size="20" maxlength="4" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">厂价</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_cj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">与厂家结算价</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_cjjsj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司材料单价</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_fgsdj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">工队价</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_gdj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">仓库名称</td> 
  <td width="35%"> 
    <input type="text" name="cl_jgmx_ckmc" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">是否入库</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cl_jgmx_sfrk","Y+是&N+否","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料名称</td> 
  <td width="35%"> 
    <input type="text" name="cl_clbm_clmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">材料规格</td> 
  <td width="35%"> 
    <input type="text" name="cl_clbm_clgg" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料单价</td> 
  <td width="35%"> 
    <input type="text" name="cl_clbm_cldj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">计量单位</td> 
  <td width="35%"> 
    <select name="cl_clbm_jldwmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">签约百分比</td> 
  <td width="35%"> 
    <input type="text" name="cl_clbm_qybfb" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">利润计算方式</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cl_clbm_lrjsfs","1+差价方式&2+百分比方式","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">利润百分比</td> 
  <td width="35%"> 
    <input type="text" name="cl_clbm_lrbfb" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">材料大类</td> 
  <td width="35%"> 
    <select name="cl_clbm_cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
%>
    </select>
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
	if(!(isFloat(FormName.cl_jgmx_cj, "厂价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_cjjsj, "与厂家结算价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_fgsdj, "分公司材料单价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_gdj, "工队价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_cldj, "材料单价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_qybfb, "签约百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_lrbfb, "利润百分比"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
