<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] xh = request.getParameterValues("xh");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateJsj.jsp" name="editform">
<div align="center"><strong>修改单品结算价</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>结算价</td>
  <td width="52%"><input name="cbj" type="text" size="20" maxlength="16" ></td>
</tr>

    <tr> 
      <td colspan="2" align="center" >
<%
for (int i=0;i<xh.length ;i++ )
{
	%>
		<input type="hidden" name="xh"  value="<%=xh[i]%>" >
	<%
}
%>
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">	 </td>
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
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}

	if (!confirm("修改后不可恢复，不要改错了，确实要继续吗?") )	
	{
		return true;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
