<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjtcjgb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ײ�����</td> 
  <td width="32%"> 
    <input type="text" name="tcmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ƽ�׵���</td> 
  <td width="32%"> 
    <input type="text" name="mjpmdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������С�Ƽ����</td> 
  <td width="32%"> 
    <input type="text" name="tnzxjjmj" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="cfdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������׼���</td> 
  <td width="32%"> 
    <input type="text" name="cfbzmj" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���������������</td> 
  <td width="32%"> 
    <input type="text" name="cfccmjdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����䵥��</td> 
  <td width="32%"> 
    <input type="text" name="wsjdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�������׼���</td> 
  <td width="32%"> 
    <input type="text" name="wsjbzmj" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����䳬���������</td> 
  <td width="32%"> 
    <input type="text" name="wsjccmjdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>Ϳ�ϸ�Ϊ��ֽ�����</td> 
  <td width="32%"> 
    <input type="text" name="tlgbzjmj" value="" size="20" maxlength="17" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("������[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.mjpmdj)=="") {
		alert("������[���ƽ�׵���]��");
		FormName.mjpmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjpmdj, "���ƽ�׵���"))) {
		return false;
	}
	if(	javaTrim(FormName.tnzxjjmj)=="") {
		alert("������[������С�Ƽ����]��");
		FormName.tnzxjjmj.focus();
		return false;
	}
	if(!(isNumber(FormName.tnzxjjmj, "������С�Ƽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cfdj)=="") {
		alert("������[��������]��");
		FormName.cfdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfdj, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.cfbzmj)=="") {
		alert("������[������׼���]��");
		FormName.cfbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.cfbzmj, "������׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.cfccmjdj)=="") {
		alert("������[���������������]��");
		FormName.cfccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cfccmjdj, "���������������"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjdj)=="") {
		alert("������[�����䵥��]��");
		FormName.wsjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjdj, "�����䵥��"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjbzmj)=="") {
		alert("������[�������׼���]��");
		FormName.wsjbzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.wsjbzmj, "�������׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.wsjccmjdj)=="") {
		alert("������[�����䳬���������]��");
		FormName.wsjccmjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.wsjccmjdj, "�����䳬���������"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjmj)=="") {
		alert("������[Ϳ�ϸ�Ϊ��ֽ�����]��");
		FormName.tlgbzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjmj, "Ϳ�ϸ�Ϊ��ֽ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
