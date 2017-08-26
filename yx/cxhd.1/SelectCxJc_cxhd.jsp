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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_cxhdCxList.jsp" name="selectform">
<div align="center">促销活动管理－查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">促销活动编码</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_cxhdbm" size="20" maxlength="7" >
      </td>
      <td align="right" width="20%">促销活动名称</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_cxhdmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">分公司</td>
      <td width="31%"> 
        <select name="jc_cxhd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      <td align="right" width="20%">订金</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_dj" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">工程费折扣</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_gcfzk" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">工程增项折扣</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_gczxzk" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">管理费折扣</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_glfzk" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">附件名称</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_fjmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">活动类型</td>
      <td colspan="3">
        <input type="radio" name="hdlx" value="1">
        无活动 
        <input type="radio" name="hdlx" value="2">
        公司活动 
        <input type="radio" name="hdlx" value="3">
        小区活动 
		<input type="radio" name="hdlx" value="4">
		展会活动
		<input type="radio" name="hdlx" value="5">
		市场活动</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">折扣类型</td>
      <td colspan="3">
        <input type="radio" name="zklx" value="1">
        签约额直接打折 
        <input type="radio" name="zklx" value="2">
        签约额不打折，结算时打折 
        <input type="radio" name="zklx" value="4">
        无折扣</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">可共享其它活动</td>
      <td width="31%"><%
	cf.radioToken(out, "kgxqthd","1+不可共享&2+可共享","");
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">结束标志</td>
      <td width="31%"> 
        <INPUT type="radio" name="jc_cxhd_jsbz" value="N" >
        未结束 
        <INPUT type="radio" name="jc_cxhd_jsbz" value="Y" >
        结束 </td>
      <td align="right" width="20%">审批标志</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_cxhd_spbz","N+未审批&Y+审批","");
%> </td>
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
	if(!(isNumber(FormName.jc_cxhd_dj, "订金"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_gcfzk, "工程费折扣"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_gczxzk, "工程增项折扣"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_glfzk, "管理费折扣"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
