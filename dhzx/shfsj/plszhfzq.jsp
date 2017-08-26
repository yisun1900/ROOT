<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] khbh=request.getParameterValues("khbh");
%>

<html>
<head>
<title>设置回访时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

        <form method="post" action="SavePlszhfzq.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="2"><b><font color="#000066">批量设置回访周期</font></b></td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="42%" align="right">回访周期</td>
              <td width="58%"> 
                <input type="text" name="hfzq" value="" size="20" maxlength="10"  >              </td>
            </tr>
            <tr> 
              <td height="2" colspan="2" align="center"> 
<%
	for (int i=0;i<khbh.length ;i++ )
	{
		%>
		<input type="hidden" name="khbh"  value="<%=khbh[i]%>" >
		<%
	}
%>
				
				<input type="button"  value="保存" onClick="f_do(editform)">
				<input type="reset"  value="重输"></td>
            </tr>
          </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hfzq)=="") {
		alert("请选择[回访周期]！");
		FormName.hfzq.focus();
		return false;
	}
	if(!(isNumber(FormName.hfzq, "回访周期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
