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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Kp_ybjkpCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">施工队</div>
  </td>
  <td width="35%"> 
    <select name="kp_ybjkp_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','7','8') order by dwbh","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">提供样板间数量</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_ybjsl" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">参观次数</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgcs" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">参观失败次数</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgsbcs" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">参观成功次数</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgcgcs" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">特殊加减分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_tsjjf" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">样板间评分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_ybjpf" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">考评起始时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_qssj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考评截止时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_jzsj" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">考评人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_kpr" size="20" maxlength="16" >
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
	if(!(isNumber(FormName.kp_ybjkp_ybjsl, "提供样板间数量"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgcs, "参观次数"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgsbcs, "参观失败次数"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgcgcs, "参观成功次数"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_tsjjf, "特殊加减分"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_ybjpf, "样板间评分"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_ybjkp_qssj, "考评起始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_ybjkp_jzsj, "考评截止时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
