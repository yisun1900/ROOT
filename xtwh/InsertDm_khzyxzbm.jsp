<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_khzyxzbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�ͻ���Դ���ʱ��루2λ��</td> 
  <td width="29%"> 
    <input type="text" name="khzyxzbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="18%">�ͻ���Դ����</td> 
  <td width="32%"> 
    <input type="text" name="khzyxz" value="" size="20" maxlength="20" >
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khzyxzbm)=="") {
		alert("������[�ͻ���Դ���ʱ���]��");
		FormName.khzyxzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.khzyxz)=="") {
		alert("������[�ͻ���Դ����]��");
		FormName.khzyxz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
