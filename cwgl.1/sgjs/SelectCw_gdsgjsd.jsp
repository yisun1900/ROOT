<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String lrbm=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Cw_gdsgjsdList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdsgjsd_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">客户姓名</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">房屋地址</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="15%">电话</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_gdsgjsd_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"><select name="cw_gdsgjsd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="cw_gdsgjsd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_gdsgjsd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_gdsgjsd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdsgjsd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
