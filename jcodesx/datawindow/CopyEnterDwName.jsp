<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<title>�������ݴ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dw_name=request.getParameter("dw_name");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveCopyDW.jsp" name="formname">
    
  <table width="100%" border="0">
    <tr align="center"> 
      <td colspan="2" height="40">�����µ����ݴ�������</td>
    </tr>
    <tr>
      <td align="right" width="36%"><font color="#0000FF">���������ݴ���</font></td>
      <td width="64%"><font color="#CC00CC">
        <input type="text" name="dw_name1" size="20" maxlength="40" value="<%=dw_name%>" readonly>
        </font></td>
    </tr>
    <tr> 
      <td align="right" width="36%"><font color="#CC00CC">���ݴ�������</font></td>
      <td width="64%"><font color="#CC00CC"> 
        <input type="text" name="dw_name" size="20" maxlength="40" value="">
        </font></td>
    </tr>
    <tr> 
      <td align="right" width="36%"><font color="#CC00CC">���ݴ���˵��</font></td>
      <td width="64%"> 
        <input type="text" name="dw_note" maxlength="100" size="40">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="56"> 
        <input type="button"  value="����" onClick="f_do(formname)" >
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
		alert("������[���ݴ�������]��");
		FormName.dw_name.focus();
		return false;
	}
	if(	javaTrim(FormName.dw_note)=="") {
		alert("������[���ݴ���˵��]��");
		FormName.dw_note.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
