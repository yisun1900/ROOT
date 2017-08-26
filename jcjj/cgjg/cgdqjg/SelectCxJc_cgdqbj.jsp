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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgdqbjCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">电器编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_dqbm" size="20" maxlength="5" >
  </td>
  <td width="15%"> 
    <div align="right">电器名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_dqmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">电器类别</div>
  </td>
  <td width="35%"> 
    <select name="jc_cgdqbj_dqlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqlbbm,dqlbmc from jdm_dqlbbm order by dqlbbm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">型号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_xh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">规格</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_gg" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <div align="right">计量单位</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_jldw" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">产品特征</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_cptz" size="20" maxlength="200" >
  </td>
  <td width="15%"> 
    <div align="right">产地</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_cd" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">零售价</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_lsj" size="20" maxlength="9" >
  </td>
  <td width="15%"> 
    <div align="right">优惠价</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_yhj" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">生产厂家</div>
  </td>
  <td width="35%"> 
    <select name="jc_cgdqbj_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(!(isFloat(FormName.jc_cgdqbj_lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cgdqbj_yhj, "优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
