<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] cpbm = request.getParameterValues("cpbm");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateCx.jsp" name="editform">
<div align="center">�ײ������Ŀ⣭�����޸ġ�������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#E8E8FF">
  <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ��д���</td>
  <td width="32%"><input type="radio" name="sfycx" value="N">
    û����
    <input type="radio" name="sfycx" value="Y">
    �д��� </td>
  <td width="18%" align="right">��������</td>
  <td width="32%"><input type="text" name="cxj" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td height="2" align="right" bgcolor="#E8E8FF">������ʼʱ��</td>
  <td height="2" bgcolor="#E8E8FF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" height="2">��������ʱ��</td>
  <td height="2"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">���������</td>
  <td><input name="cxjsj" type="text" value="" size="20" maxlength="17" ></td>
  <td align="right">�����������</td>
  <td><input name="cxjsbl" type="text"  value="" size="10" maxlength="17" >
    �ٷֱ�</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
	for (int i=0;i<cpbm.length ;i++ )
	{
		%>
		<input type="hidden" name="cpbm"  value="<%=cpbm[i]%>" >
		<%
	}
%>
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("������[������]��");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "������"))) {
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjssj.select();
			return false;
		}
		if(	javaTrim(FormName.cxjsj)=="") {
			alert("������[���������]��");
			FormName.cxjsj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsj, "���������"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjsbl)=="") {
			alert("������[�����������]��");
			FormName.cxjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxjsbl, "�����������"))) {
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
		FormName.cxjsj.value="";
		FormName.cxjsbl.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
