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
<form method="post" action="SaveInsertJxc_clxlbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>���ϴ�������</td> 
  <td width="32%"><select name="cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����С������</td>
  <td colspan="3"><input type="text" name="clxlmc" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfxzsl","1+������&2+���ܳ���&3+�ɳ�����Ӽ�","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input name="tcslxz" type="text" value="" size="20" maxlength="16"></td>
  <td align="right">�������ּӼ�</td>
  <td><input name="ccbfjj" type="text" value="" size="20" maxlength="16"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ƽ�������</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkjm","1+������&2+����","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������������</td>
  <td><input name="yxjmzdsl" type="text" value="" size="20" maxlength="16"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
<font size="-1"></font>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clxlmc)=="") {
		alert("������[����С������]��");
		FormName.clxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("������[���ϴ�������]��");
		FormName.cldlmc.focus();
		return false;
	}
	if(!(isFloat(FormName.tcslxz, "�ײ���������"))) {
		return false;
	}
	if(!(isFloat(FormName.ccbfjj, "�������ּӼ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxzsl)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.tcslxz)!="" && javaTrim(FormName.tcslxz)!="0" ) {
			alert("�������������ƣ�����Ҫ[��������]��");
			FormName.tcslxz.select();
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("�������������ƣ�����Ҫ[�������ּӼ�]��");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else if (FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("�����������ܳ�������������[��������]��");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("�������������ƣ�����Ҫ[�������ּӼ�]��");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("���������ɳ�����Ӽۣ���������[��������]��");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)=="") {
			alert("���������ɳ�����Ӽۣ���������[�������ּӼ�]��");
			FormName.ccbfjj.focus();
			return false;
		}
		if(!(isFloat(FormName.ccbfjj, "�������ּӼ�"))) {
			return false;
		}
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ����Ƽ�������]��");
		FormName.sfkjm[0].focus();
		return false;
	}

	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("��������[��������������]��");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
			return false;
		}
	}
	else{
		FormName.yxjmzdsl.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
