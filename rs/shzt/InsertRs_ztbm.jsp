<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ztbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态编码</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">状态名称</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" value="" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态类型</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="01">招聘</option>
    <option value="02">培训</option>
    <option value="03">变动</option>
    <option value="04">费用审批</option>
    <option value="06">二次入职</option>
    <option value="07">调休申请</option>
    <option value="08">加班申请</option>
    <option value="09">考勤卡修正单</option>
    <option value="10">请假单</option>
    <option value="11">出差申请</option>
    <option value="12">增设岗位申请</option>
    <option value="13">辞职申请</option>
    <option value="14">退回人员申请</option>
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
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请输入[状态编码]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmc)=="") {
		alert("请输入[状态名称]！");
		FormName.ztmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztlx)=="") {
		alert("请选择[状态类型]！");
		FormName.ztlx.focus();
		return false;
	}
	if(	javaTrim(FormName.sqzt)=="") {
		alert("请输入[需修改申请状态]！");
		FormName.sqzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
