<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Jc_khzcgmxxList.jsp" name="selectform">
<div align="center">客户主材购买信息－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmxx_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="17%">客户姓名</td> 
  <td width="33%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="17%">处理状态</td> 
  <td width="33%"> 
    <INPUT name="jc_khzcgmxx_clzt" type="radio" value="N" checked>
    未审核
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmxx_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="17%">录入部门</td> 
  <td width="33%"><select name="jc_khzcgmxx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="jc_khzcgmxx_lrsj" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jc_khzcgmxx_lrsj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核人</td> 
  <td width="32%"><input type="text" name="jc_khzcgmxx_shr" size="20" maxlength="20" ></td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核时间 从</td> 
  <td width="32%"><input type="text" name="jc_khzcgmxx_shsj" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="17%">到 </td>
  <td width="33%"><input type="text" name="jc_khzcgmxx_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.jc_khzcgmxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmxx_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmxx_shsj2, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
