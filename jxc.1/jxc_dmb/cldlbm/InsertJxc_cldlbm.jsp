<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_cldlbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料大类类别</td>
  <td><%
	cf.radioToken(out, "cldllb","1+主材&2+辅材","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料大类名称</td> 
  <td><input type="text" name="cldlmc" value="" size="50" maxlength="50" ></td>
  </tr>
    <tr align="center"> 
      <td colspan="2"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	!radioChecked(FormName.cldllb)) {
		alert("请选择[材料大类类别]！");
		FormName.cldllb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请输入[材料大类名称]！");
		FormName.cldlmc.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
