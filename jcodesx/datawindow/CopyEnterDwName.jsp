<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<title>复制数据窗口</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dw_name=request.getParameter("dw_name");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveCopyDW.jsp" name="formname">
    
  <table width="100%" border="0">
    <tr align="center"> 
      <td colspan="2" height="40">输入新的数据窗口名称</td>
    </tr>
    <tr>
      <td align="right" width="36%"><font color="#0000FF">被复制数据窗口</font></td>
      <td width="64%"><font color="#CC00CC">
        <input type="text" name="dw_name1" size="20" maxlength="40" value="<%=dw_name%>" readonly>
        </font></td>
    </tr>
    <tr> 
      <td align="right" width="36%"><font color="#CC00CC">数据窗口名称</font></td>
      <td width="64%"><font color="#CC00CC"> 
        <input type="text" name="dw_name" size="20" maxlength="40" value="">
        </font></td>
    </tr>
    <tr> 
      <td align="right" width="36%"><font color="#CC00CC">数据窗口说明</font></td>
      <td width="64%"> 
        <input type="text" name="dw_note" maxlength="100" size="40">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="56"> 
        <input type="button"  value="存盘" onClick="f_do(formname)" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)
{
	if(	javaTrim(FormName.dw_name)=="") {
		alert("请输入[数据窗口名称]！");
		FormName.dw_name.focus();
		return false;
	}
	if(	javaTrim(FormName.dw_note)=="") {
		alert("请输入[数据窗口说明]！");
		FormName.dw_note.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
