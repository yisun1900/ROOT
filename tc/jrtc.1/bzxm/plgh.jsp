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
<form method="post" action="SavePlgh.jsp" name="editform">
<div align="center">�ײͱ�׼������Ŀ��������[�ɸ�������]</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�Ƿ�ɸ���</td>
  <td><input type="radio" name="sfkgh"  value="1">
    ���ɻ�
    <input type="radio" name="sfkgh"  value="2">
    �ɻ� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ɻ��������</td>
  <td><input type="text" name="khzdsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ۼ�</td>
  <td><input type="text" name="ghzj" value="" size="20" maxlength="17" ></td>
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
	if(	!radioChecked(FormName.sfkgh)) {
		alert("��ѡ��[�Ƿ�ɸ���]��");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("���󣡱�������[�ɻ��������]��");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "�ɻ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("���󣡱�������[�����ۼ�]��");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "�����ۼ�"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
