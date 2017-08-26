<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String chooseitem = cf.getParameter(request,"chooseitem");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlsj.jsp" name="editform">
<div align="center">套餐标准主材项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>升级是否收费</td>
  <td><%
	cf.radioToken(out, "sfyxsj","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right">套餐升级分类</td>
  <td width="60%"><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc","");
%>
  </select></td>
</tr>

    <tr> 
      <td colspan="2" >
	<div align="center">
	<input type="hidden" name="chooseitem"  value="<%=chooseitem%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("请选择[升级是否收费]！");
		FormName.sfyxsj[0].focus();
		return false;
	}

	if(	javaTrim(FormName.tcsjflbm)=="") {
		alert("请输入[套餐升级分类]！");
		FormName.tcsjflbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
