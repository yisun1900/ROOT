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
<form method="post" action="SaveInsertJdm_mtxbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�����߱���</td> 
      <td width="32%"> 
        <input type="text" name="mtxbm" value="" size="20" maxlength="2" >
  </td>
      <td align="right" width="18%">����������</td> 
      <td width="32%"> 
        <input type="text" name="mtxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�����żӼ���</td> 
      <td width="32%"> 
        <input type="text" name="ztmjjl" value="" size="10" maxlength="9" >
        % </td>    <td align="right" width="18%">�ƿڼӼ���</td> 
      <td width="32%"> 
        <input type="text" name="ykjjl" value="" size="10" maxlength="9" >
        % </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">���׼Ӽ���</td> 
      <td width="32%"> 
        <input type="text" name="ctjjl" value="" size="10" maxlength="9" >
        % </td>    <td align="right" width="18%">&nbsp; </td>
      <td width="32%">&nbsp; </td>
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
	if(	javaTrim(FormName.mtxbm)=="") {
		alert("������[�����߱���]��");
		FormName.mtxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mtxmc)=="") {
		alert("������[����������]��");
		FormName.mtxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmjjl)=="") {
		alert("������[�����żӼ���]��");
		FormName.ztmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ztmjjl, "�����żӼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.ykjjl)=="") {
		alert("������[�ƿڼӼ���]��");
		FormName.ykjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ykjjl, "�ƿڼӼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.ctjjl)=="") {
		alert("������[���׼Ӽ���]��");
		FormName.ctjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjjl, "���׼Ӽ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
