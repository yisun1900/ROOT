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
<form method="post" action="SaveInsertCw_fklxbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ͱ���</td> 
  <td width="35%"> 
    <input type="text" name="fklxbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">������������</td> 
  <td width="35%"> 
    <input type="text" name="fklxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <select name="fkdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��װ��</option>
    <option value="2">���ɿ�</option>
    <option value="3">���ɶ���</option>
    <option value="4">��ѯ�տ�</option>
    <option value="5">Ԥ����</option>
    <option value="9">�����տ�</option>
    </select>
  </td>
  <td align="right" width="15%">ƾ֤����</td> 
  <td width="35%"> 
    <input type="radio" name="pzfl"  value="1">���̿�
    <input type="radio" name="pzfl"  value="2">���ɿ�
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
	if(	javaTrim(FormName.fklxbm)=="") {
		alert("������[�������ͱ���]��");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fklxmc)=="") {
		alert("������[������������]��");
		FormName.fklxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fkdl)=="") {
		alert("��ѡ��[�������]��");
		FormName.fkdl.focus();
		return false;
	}
	if(	!radioChecked(FormName.pzfl)) {
		alert("��ѡ��[ƾ֤����]��");
		FormName.pzfl[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
