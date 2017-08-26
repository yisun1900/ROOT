<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] cpbm = request.getParameterValues("cpbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateYxbz.jsp" name="editform">
<div align="center">套餐外主材库－批量设置【有效标志】</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font>是否有效</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfyx","1+永远有效&2+无效&3+阶段有效","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效开始时间</td>
  <td width="32%"><input type="text" name="yxkssj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td width="18%" align="right">有效结束时间</td>
  <td width="32%"><input type="text" name="yxjzsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
	for (int i=0;i<cpbm.length ;i++ )
	{
		%>
		<input type="hidden" name="cpbm"  value="<%=cpbm[i]%>" >
		<%
	}
%>
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfyx)) {
		alert("请选择[是否有效]！");
		FormName.sfyx[0].focus();
		return false;
	}
	if (FormName.sfyx[2].checked)
	{
		if(	javaTrim(FormName.yxkssj)=="") {
			alert("请输入[有效开始时间]！");
			FormName.yxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)=="") {
			alert("请输入[有效结束时间]！");
			FormName.yxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
			return false;
		}

		if (FormName.yxjzsj.value<FormName.yxkssj.value)
		{
			alert("错误！[有效结束时间]<[有效开始时间]");
			FormName.yxjzsj.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yxkssj)!="") {
			alert("错误！不需输入[有效开始时间]！");
			FormName.yxkssj.select();
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)!="") {
			alert("错误！不需输入[有效结束时间]！");
			FormName.yxjzsj.select();
			return false;
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
