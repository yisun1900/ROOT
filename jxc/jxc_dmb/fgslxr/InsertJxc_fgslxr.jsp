<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_fgslxr.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��λ���</td> 
  <td width="35%"> 
    <input type="text" name="dwbh" value="" size="20" maxlength="5" >
  </td>
  <td align="right" width="15%">��λ����</td> 
  <td width="35%"> 
    <input type="text" name="dwmc" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�绰</td> 
  <td width="35%"> 
    <input type="text" name="dh" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="cz" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="jbr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�������ֻ�</td> 
  <td width="35%"> 
    <input type="text" name="jbrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ջ���</td> 
  <td width="35%"> 
    <input type="text" name="shr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�ջ����ֻ�</td> 
  <td width="35%"> 
    <input type="text" name="shrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="fzr" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�������ֻ�</td> 
  <td width="35%"> 
    <input type="text" name="fzrsj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ַ</td> 
  <td width="35%"> 
    <input type="text" name="dz" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="khyh" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�˺�</td> 
  <td width="35%"> 
    <input type="text" name="zh" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">����������</td> 
  <td width="35%"> 
    <input type="text" name="khrxm" value="" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">˵��1</td> 
  <td width="35%"> 
    <input type="text" name="sm1" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">˵��2</td> 
  <td width="35%"> 
    <input type="text" name="sm2" value="" size="20" maxlength="200" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
