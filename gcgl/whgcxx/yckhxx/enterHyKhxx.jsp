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
<form method="post" action="HyKHzL.jsp" name="selectform">
<div align="center">
  <p>还原客户信息</p>
  <p>备份数据库－－>当前数据库 </p>
<table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td height="36" colspan="2" align="center" bgcolor="#CCCCCC"><strong>请选择还原范围</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="36" align="right">录入时间 从 </td>
  <td><input type="text" name="qslrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="40%" height="27" align="right">到</td>
  <td width="60%"><input type="text" name="qzlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
<tr align="center"> 
  <td colspan="2"> 
    <input type="button"  value="开始还原" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</div>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.qslrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.qslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qslrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qzlrsj2)=="") {
		alert("请输入[录入时间]！");
		FormName.qzlrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.qzlrsj2, "录入时间"))) {
		return false;
	}

	if ( !confirm("确实要继续吗?") )	
	{
		return;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
