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
<form method="post" action="SaveInsertRs_ksbl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ʷ�Χ</td> 
  <td width="35%"> 
    <input type="text" name="gzfw" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="gzxx" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="gzsx" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">��˰����</td> 
  <td width="35%"> 
    <input type="text" name="gsbl" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�̶�˰��</td> 
  <td width="35%"> 
    <input type="text" name="gdsj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.gzfw)=="") {
		alert("������[���ʷ�Χ]��");
		FormName.gzfw.focus();
		return false;
	}
	if(	javaTrim(FormName.gzxx)=="") {
		alert("������[��������]��");
		FormName.gzxx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzxx, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gzsx)=="") {
		alert("������[��������]��");
		FormName.gzsx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzsx, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gsbl)=="") {
		alert("������[��˰����]��");
		FormName.gsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsbl, "��˰����"))) {
		return false;
	}
	if(	javaTrim(FormName.gdsj)=="") {
		alert("������[�̶�˰��]��");
		FormName.gdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdsj, "�̶�˰��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
