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

<form method="post" action="SaveInsertKp_deflbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflbm" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">�����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dedy" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">����С��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dexy" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ƽ��ֵ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="depjz" value="" size="20" maxlength="8" >
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
	if(	javaTrim(FormName.deflbm)=="") {
		alert("������[����������]��");
		FormName.deflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.deflmc)=="") {
		alert("������[�����������]��");
		FormName.deflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dedy)=="") {
		alert("������[�������]��");
		FormName.dedy.focus();
		return false;
	}
	if(!(isNumber(FormName.dedy, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.dexy)=="") {
		alert("������[����С��]��");
		FormName.dexy.focus();
		return false;
	}
	if(!(isNumber(FormName.dexy, "����С��"))) {
		return false;
	}
	if(	javaTrim(FormName.depjz)=="") {
		alert("������[����ƽ��ֵ]��");
		FormName.depjz.focus();
		return false;
	}
	if(!(isNumber(FormName.depjz, "����ƽ��ֵ"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
