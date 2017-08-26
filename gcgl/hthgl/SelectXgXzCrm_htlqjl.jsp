<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_htlqjlXgXzList.jsp" name="selectform">
<div align="center">合同销账－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">领取分公司</td>
  <td><select name="crm_htlqjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
  <td align="right">领取部门</td>
  <td><select name="crm_htlqjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">领取记录号</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_lqjlh" size="20" maxlength="11" >  </td>
  <td align="right" width="15%">领取数量</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_lqsl" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">使用数量</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_sysl" size="20" maxlength="8" >  </td>
  <td align="right" width="15%">做废数量</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_zfsl" size="20" maxlength="8" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起始合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_qshth" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">终止合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_zzhth" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">领取时间 从</td>
  <td><input type="text" name="crm_htlqjl_lqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_htlqjl_lqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">领取人</td>
  <td><input type="text" name="crm_htlqjl_lqr" size="20" maxlength="20" ></td>
  <td align="right">录入人</td>
  <td><input type="text" name="crm_htlqjl_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_htlqjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到 </td>
  <td><input type="text" name="crm_htlqjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">销账标志</td> 
  <td width="35%"> 
   <INPUT type="radio" name="crm_htlqjl_xzbz" value="N" checked>未销账
  </td>
  <td align="right" width="15%">销账人</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_xzr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">销账时间 从</td> 
  <td width="35%"><input type="text" name="crm_htlqjl_xzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="crm_htlqjl_xzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isNumber(FormName.crm_htlqjl_lqsl, "领取数量"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_htlqjl_sysl, "使用数量"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_htlqjl_zfsl, "做废数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lqsj2, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_xzsj, "销账时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_xzsj2, "销账时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
