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
<form method="post" action="SavePlUpdateJsj.jsp" name="editform">
<div align="center">套餐主材报价维护－批量修改【结算价】</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font>结算价</td>
  <td colspan="3">
  <input type="text" name="jsj" size="20" maxlength="17"  value="" >
  
  </td>
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
	if(	javaTrim(FormName.jsj)=="") {
		alert("请输入[结算价]！");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "结算价"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
