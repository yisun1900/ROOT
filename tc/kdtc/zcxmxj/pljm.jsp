<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String chooseitem = cf.getParameter(request,"chooseitem");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePljm.jsp" name="editform">
<div align="center">�ײͱ�׼������Ŀ��������[����]</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right"><font color="#FF0000">*</font>�Ƿ�ɼ���</td>
  <td width="60%"><input type="radio" name="sfkjm"  value="1">
    ���ɼ���
      <input type="radio" name="sfkjm"  value="2">
      �ɼ��� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������������</td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ⵥ��</td>
  <td><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
</tr>

    <tr> 
      <td colspan="2" >
	<div align="center">
	<input type="hidden" name="chooseitem"  value="<%=chooseitem%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ�ɼ���]��");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("���󣡱�������[��������������]��");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("���󣡱�������[���ⵥ��]��");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "���ⵥ��"))) {
			return false;
		}
	}
	else
	{
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
