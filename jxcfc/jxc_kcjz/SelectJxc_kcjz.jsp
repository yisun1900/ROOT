<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_kcjzList.jsp" name="selectform">
<div align="center">����תά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ת����</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_jzph" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">�ֿ�����</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ckbh" size="20" maxlength="4" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ʒ������</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_zcpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">����Ʒ�ܽ��</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_zcpzjg" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�д�Ʒ������</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ccpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">�д�Ʒ�ܽ��</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_ccpzje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ʒ������</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_bfpzsl" size="20" maxlength="16" >
  </td>
  <td align="right" width="15%">����Ʒ�ܽ��</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_bfpzje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ת����</td> 
  <td width="35%"> 
    <input type="text" name="jxc_kcjz_jzrq" size="20" maxlength="10" >
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
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(!(isNumber(FormName.jxc_kcjz_zcpzsl, "����Ʒ������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_zcpzjg, "����Ʒ�ܽ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcjz_ccpzsl, "�д�Ʒ������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_ccpzje, "�д�Ʒ�ܽ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_kcjz_bfpzsl, "����Ʒ������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_kcjz_bfpzje, "����Ʒ�ܽ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_kcjz_jzrq, "��ת����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
