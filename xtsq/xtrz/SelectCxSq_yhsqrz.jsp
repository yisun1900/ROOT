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
<form method="post" action="Sq_yhsqrzCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">序号</td> 
      <td width="33%"> 
        <input type="text" name="sq_yhsqrz_xh" size="20" maxlength="16" >
  </td>
      <td align="right" width="19%">录入人IP地址</td> 
      <td width="31%"> 
        <input type="text" name="sq_yhsqrz_ip" size="20" maxlength="30" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">录入人登陆名</td> 
      <td width="33%"> 
        <input type="text" name="sq_yhsqrz_lrrdlm" size="20" maxlength="16" >
  </td>
      <td align="right" width="19%">录入人姓名</td> 
      <td width="31%"> 
        <input type="text" name="sq_yhsqrz_lrrxm" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="sq_yhsqrz_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>    
      <td width="31%"> 
        <input type="text" name="sq_yhsqrz_lrsj2" size="20" maxlength="10" >
      </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">操作类型</td> 
      <td width="33%"> 
        <select name="sq_yhsqrz_czlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+插入&2+删除&3+修改","");
%>
    </select>
  </td>
      <td align="right" width="19%">被操作的用户登陆名 </td>
      <td width="31%"> 
        <input type="text" name="sq_yhsqrz_yhdlm" size="20" maxlength="16" >
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
	if(!(isNumber(FormName.sq_yhsqrz_xh, "序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhsqrz_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhsqrz_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
