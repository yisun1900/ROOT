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
<form method="post" action="SaveInsertKp_yzfdzpdcs.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ֹ�˾</td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">��һ��ȵ�ƽ������</td> 
  <td width="31%"> 
    <input type="text" name="pjde" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���鹤����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="grs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">�ʱ�����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="zbj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ��������Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="khmyd" value="" size="10" maxlength="9" >
    %
  </td>
  <td align="right" width="19%">������С��ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="zxzsgds" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���������ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="zdzsgds" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.pjde)=="") {
		alert("������[��һ��ȵ�ƽ������]��");
		FormName.pjde.focus();
		return false;
	}
	if(!(isFloat(FormName.pjde, "��һ��ȵ�ƽ������"))) {
		return false;
	}
	if(	javaTrim(FormName.grs)=="") {
		alert("������[���鹤����Сֵ]��");
		FormName.grs.focus();
		return false;
	}
	if(!(isNumber(FormName.grs, "���鹤����Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.zbj)=="") {
		alert("������[�ʱ�����Сֵ]��");
		FormName.zbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zbj, "�ʱ�����Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.khmyd)=="") {
		alert("������[�ͻ��������Сֵ]��");
		FormName.khmyd.focus();
		return false;
	}
	if(!(isFloat(FormName.khmyd, "�ͻ��������Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.zxzsgds)=="") {
		alert("������[������С��ʩ������]��");
		FormName.zxzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zxzsgds, "������С��ʩ������"))) {
		return false;
	}
	if(	javaTrim(FormName.zdzsgds)=="") {
		alert("������[���������ʩ������]��");
		FormName.zdzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zdzsgds, "���������ʩ������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
