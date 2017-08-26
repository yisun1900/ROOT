<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm=request.getParameterValues("clbm");
%>

<html>
<head>
<title>替换维护人(<%=clbm%>)</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlthLxr.jsp" name="editform">
  <div align="center">替换维护人
  <table width="70%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
        <td align="right" width="46%" height="64">维护人</td>
        <td width="54%" height="64"> 
          <input type="text" name="wxr" value="" size="20" maxlength="20">
      </td>
    </tr>
    <tr> 
        <td colspan="2" height="41"> 
          <div align="center"> <%
	for (int i=0;i<clbm.length ;i++ )
	{
		%> <input type="hidden" name="clbm" value="<%=clbm[i]%>" >
		<%
	}

%>
          <input type="button"  value="保存" onClick="f_do(editform)">
        </div>
      </td>
    </tr>
  </table>
</div> 

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wxr)=="") {
		alert("请输入[维护人]！");
		FormName.wxr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
