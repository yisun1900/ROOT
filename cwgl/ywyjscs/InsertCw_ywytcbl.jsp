<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_ywytcbl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">�ֶ�����</td> 
  <td width="35%"> 
    <input type="text" name="fdmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��㣨>��</td> 
  <td width="35%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�յ㣨<=��</td> 
  <td width="35%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ɰٷֱ�</td> 
  <td width="35%"> 
    <input type="text" name="tcbfb" value="" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">ǩ������</td> 
  <td width="35%"> 
    <select name="qdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��װ</option>
    <option value="3">��װ</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
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
	if(	javaTrim(FormName.fdmc)=="") {
		alert("������[�ֶ�����]��");
		FormName.fdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("������[��㣨>��]��");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "��㣨>��"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("������[�յ㣨<=��]��");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "�յ㣨<=��"))) {
		return false;
	}
	if(	javaTrim(FormName.tcbfb)=="") {
		alert("������[��ɰٷֱ�]��");
		FormName.tcbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tcbfb, "��ɰٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.qdlx)=="") {
		alert("��ѡ��[ǩ������]��");
		FormName.qdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
