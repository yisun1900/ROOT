<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_fkfamx.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><span class="STYLE1">*</span>�����</td>
      <td width="28%"> 
    <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm","");
%> 
      </select>      </td>
      <td align="right" width="21%"><span class="STYLE1">*</span>�տ�����</td>
      <td width="29%"> 
        <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>�����տ���ʣ�%��</td>
      <td><input type="text" name="bqfkbl" value="" size="20" maxlength="9" >      </td>
      <td align="right"><span class="STYLE1">*</span>�ۼ��տ���ʣ�%��</td>
      <td><input type="text" name="yfkbl" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><span class="STYLE1">*</span>�տʽ</td>
      <td colspan="3">
		<INPUT type="radio" name="lx" value="1">����ǰ�տ�(����������)<BR>
		<INPUT type="radio" name="lx" value="2">����ǰ�տ��������һ����ȡ��<BR>
		<INPUT type="radio" name="lx" value="3">����ǰ�տ��������ִ���ȡ��<BR><BR>

		<INPUT type="radio" name="lx" value="6">���ۺ��տ�(����������)<BR>
		<INPUT type="radio" name="lx" value="7">���ۺ��տ��������һ����ȡ��<BR>
		<INPUT type="radio" name="lx" value="8">���ۺ��տ��������ִ���ȡ��<BR><BR>

		<INPUT type="radio" name="lx" value="A">��ǰ������<BR>
		<INPUT type="radio" name="lx" value="B">�ۺ�������<BR>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>�Ƿ�ʵ�ʷ����ܶ��տ�</td>
      <td><INPUT type="radio" name="sfsjfsesk" value="Y">
      ��
        <input type="radio" name="sfsjfsesk" value="N">
        ����ȫ������</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFFF"><span class="STYLE1"><strong>���������ȫ�����á�����ѡ������ѡ��</strong></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ񺬹��̷�</td>
      <td><%
	cf.radioToken(out, "sfbhgcf","N+������&Y+����","");
%></td>
      <td align="right">�Ƿ���Ʒ�</td>
      <td><%
	cf.radioToken(out, "sfbhsjf","N+������&Y+����","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ񺬼�ҵ��������</td>
      <td><%
	cf.radioToken(out, "sfbhjrqtf","N+������&Y+����","");
%></td>
      <td align="right">�Ƿ񺬲���ҵ��������</td>
      <td><%
	cf.radioToken(out, "sfbhbjrqtf","N+������&Y+����","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�տ��Ƿ���������</td>
      <td>
		<INPUT type="radio" name="sfbhglf" value="N">������
		<INPUT type="radio" name="sfbhglf" value="Y">����	  </td>
      <td align="right">�տ��Ƿ����˰��</td>
      <td>
		<INPUT type="radio" name="sfbhsj" value="N">������
		<INPUT type="radio" name="sfbhsj" value="Y">����	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ����ķ�</td>
      <td><%
	cf.radioToken(out, "sfbhzcf","N+������&Y+����","");
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
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
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("��ѡ��[�����]��");
		FormName.fkfabm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "�տ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("������[�ۼ��տ���ʣ�%��]��");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "�ۼ��տ���ʣ�%��"))) {
		return false;
	}
	if(	javaTrim(FormName.bqfkbl)=="") {
		alert("������[�����տ���ʣ�%��]��");
		FormName.bqfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bqfkbl, "�����տ���ʣ�%��"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[�տʽ]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfsjfsesk)) {
		alert("��ѡ��[�Ƿ�ʵ�ʷ����ܶ��տ�]��");
		FormName.sfsjfsesk[0].focus();
		return false;
	}

	if (FormName.sfsjfsesk[1].checked)
	{
		if(	!radioChecked(FormName.sfbhgcf)) {
			alert("��ѡ��[�Ƿ񺬹��̷�]��");
			FormName.sfbhgcf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhjrqtf)) {
			alert("��ѡ��[�Ƿ񺬼�ҵ��������]��");
			FormName.sfbhjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhbjrqtf)) {
			alert("��ѡ��[�Ƿ񺬲���ҵ��������]��");
			FormName.sfbhbjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsjf)) {
			alert("��ѡ��[�Ƿ���Ʒ�]��");
			FormName.sfbhsjf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhglf)) {
			alert("��ѡ��[�տ��Ƿ���������]��");
			FormName.sfbhglf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsj)) {
			alert("��ѡ��[�տ��Ƿ����˰��]��");
			FormName.sfbhsj[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhzcf)) {
			alert("��ѡ��[�Ƿ����ķ�]��");
			FormName.sfbhzcf[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
