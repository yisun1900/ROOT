<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>



<html>
<head>
<title>�ޱ����ĵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="insertKhId.jsp">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2" height="58" align="center"><font color="#0000CC">����д����</font></td>
    </tr>
    <tr> 
      <td width="42%" align="right" height="35">����ǰ׺</td>
      <td width="58%" height="35"> 
        <input type="text" name="khqz" maxlength="10" value=""  size="20">
      </td>
    </tr>
    <tr> 
      <td width="42%" align="right" height="37">���ų���</td>
      <td width="58%" height="37"> 
        <input type="text" name="khcd" maxlength="10" size="20">
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="62" align="center"> 
        <input type="button" name="Submit" value="�ύ" onClick="return isValid(form1)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function isValid(FormName)
{
	if(	javaTrim(FormName.khqz)=="") {
		alert("������[����ǰ׺]��");
		FormName.khqz.focus();
		return false;
	}
	if(	javaTrim(FormName.khcd)=="") {
		alert("������[���ų���]��");
		FormName.khcd.focus();
		return false;
	}
	if(!(isNumber(FormName.khcd, "���ų���"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

