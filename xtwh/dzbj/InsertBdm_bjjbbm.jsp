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
<form method="post" action="SaveInsertBdm_bjjbbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ������</td> 
  <td width="32%"> 
    <input type="text" name="bjjbbm" value="" size="20" maxlength="1" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ�������</td> 
  <td width="32%"> 
    <input type="text" name="bjjbmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����</td>
  <td><input type="radio" name="lx"  value="1">
    ���Ի�
    <input type="radio" name="lx"  value="2">
    �ײ�
    <input type="radio" name="lx"  value="3">
    ��װ
	</td>
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input type="text" name="yxj" value="" size="20" maxlength="8" ></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ������]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbmc)=="") {
		alert("������[���ۼ�������]��");
		FormName.bjjbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.yxj)=="") {
		alert("������[��������]��");
		FormName.yxj.focus();
		return false;
	}
	if(!(isNumber(FormName.yxj, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
