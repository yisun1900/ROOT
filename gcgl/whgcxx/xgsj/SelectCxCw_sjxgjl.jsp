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
<form method="post" action="Cw_sjxgjlCxList.jsp" name="selectform">
<div align="center">查询－修改税金记录</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">修改记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_xgjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">客户编号</td> 
  <td width="31%"> 
    <input type="text" name="cw_sjxgjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="19%">所属分公司</td> 
  <td width="31%"> 
    <select name="cw_sjxgjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">工程原报价</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_wdzgce" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">签约额</td> 
  <td width="31%"> 
    <input type="text" name="cw_sjxgjl_qye" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">折后管理费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_guanlif" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">合同号</td> 
  <td width="31%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">设计师</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="cw_sjxgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_sjxgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="cw_sjxgjl_lrr" size="20" maxlength="20" ></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.cw_sjxgjl_wdzgce, "工程原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjxgjl_qye, "签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjxgjl_guanlif, "折后管理费"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjxgjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjxgjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
