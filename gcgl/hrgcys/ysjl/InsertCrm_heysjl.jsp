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
<form method="post" action="SaveInsertCrm_heysjl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ռ�¼��</td> 
  <td width="35%"> 
    <input type="text" name="ysjlh" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">���մ�����¼��</td> 
  <td width="35%"> 
    <input type="text" name="yscsjlh" value="" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="khbh" value="" size="20" maxlength="25" >
  </td>
  <td align="right" width="15%">���ʦ</td> 
  <td width="35%"> 
    <input type="text" name="sjs" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <input type="text" name="sgd" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�ʼ�</td> 
  <td width="35%"> 
    <input type="text" name="zjxm" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���հ汾��</td> 
  <td width="35%"> 
    <input type="text" name="gcysbbh" value="" size="20" maxlength="25" >
  </td>
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="gcysxmbm" value="" size="20" maxlength="25" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="gcysxmmc" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">������������</td> 
  <td width="35%"> 
    <input type="text" name="yszxsl" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="yssj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��Ŀ������</td> 
  <td width="35%"> 
    <input type="text" name="ysr" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ���ս��</td> 
  <td width="35%"> 
    <input type="text" name="sjysjg" value="" size="20" maxlength="1" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.yscsjlh)=="") {
		alert("������[���մ�����¼��]��");
		FormName.yscsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("������[���հ汾��]��");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "������������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj, "��Ŀ����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
