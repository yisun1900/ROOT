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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_cd.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdbh" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxh" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵���ʾ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxsmc" value="" size="20" maxlength="100" >
  </td>
  <td width="15%"> 
    <div align="right">�˵�����URL</div>
  </td>
  <td width="35%"> 
    <input type="file" name="glurl" value="" size="40" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fcdbh" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�Ƿ�ĩ���˵�</div>
  </td>
  <td width="35%"> 
    <input type="radio" name="sfmjcd"  value="Y">��
    <input type="radio" name="sfmjcd"  value="N">��
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵�˵��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdsm" value="" size="20" maxlength="250" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
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
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cdbh)=="") {
		alert("������[�˵����]��");
		FormName.cdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cdxh)=="") {
		alert("������[�˵����]��");
		FormName.cdxh.focus();
		return false;
	}
	if(!(isNumber(FormName.cdxh, "�˵����"))) {
		return false;
	}
	if(	javaTrim(FormName.cdxsmc)=="") {
		alert("������[�˵���ʾ����]��");
		FormName.cdxsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fcdbh)=="") {
		alert("������[���˵����]��");
		FormName.fcdbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfmjcd)) {
		alert("��ѡ��[�Ƿ�ĩ���˵�]��");
		FormName.sfmjcd[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
