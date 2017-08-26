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
<form method="post" action="Rs_ztbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态编码</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">状态名称</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态类型</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+招聘&02+培训&03+变动&04+费用审批&06+二次入职&07+调休申请&08+加班申请&09+考勤卡修正单&10+请假单&11+出差申请&12+增设岗位申请&13+辞职申请&14+退回人员申请","");
%>
    </select>
  </td>
  <td align="right" width="15%">需修改申请状态</td> 
  <td width="35%"> 
     <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"02+正在审批&03+审批通过&04+审批取消","");
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
