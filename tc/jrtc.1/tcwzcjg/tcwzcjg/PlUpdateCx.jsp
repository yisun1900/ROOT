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
<form method="post" action="SavePlUpdateCx.jsp" name="editform">
<div align="center">套餐外主材库－批量修改【促销】</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#E8E8FF">
  <td width="18%" align="right"><font color="#FF0000">*</font>是否有促销</td>
  <td width="32%"><input type="radio" name="sfycx" value="N">
    没促销
    <input type="radio" name="sfycx" value="Y">
    有促销 </td>
  <td width="18%" align="right">促销单价</td>
  <td width="32%"><input type="text" name="cxj" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="2" align="right" bgcolor="#E8E8FF">促销开始时间</td>
  <td height="2" bgcolor="#E8E8FF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" height="2">促销结束时间</td>
  <td height="2"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">促销结算价</td>
  <td><input name="cxjsj" type="text" value="" size="20" maxlength="17" ></td>
  <td align="right">促销结算比例</td>
  <td><input name="cxjsbl" type="text"  value="" size="10" maxlength="17" >
    百分比</td>
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
	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("请输入[促销价]！");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "促销价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("请输入[促销开始时间]！");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjssj.select();
			return false;
		}
		if(	javaTrim(FormName.cxjsj)=="") {
			alert("请输入[促销结算价]！");
			FormName.cxjsj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsj, "促销结算价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjsbl)=="") {
			alert("请输入[促销结算比例]！");
			FormName.cxjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsbl, "促销结算比例"))) {
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
		FormName.cxjsj.value="";
		FormName.cxjsbl.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
