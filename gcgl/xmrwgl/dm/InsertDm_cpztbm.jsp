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
<form method="post" action="SaveInsertDm_cpztbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" value="" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><input type="radio" name="cplx"  value="0">
    ȫ��
      <input type="radio" name="cplx"  value="1">
      ����Ʒ
      <input type="radio" name="cplx"  value="2">
      ��Ʒ </td>
  <td align="right">������</td>
  <td><input type="radio" name="ghf"  value="�׹�">
�׹�
  <input type="radio" name="ghf"  value="��˾��">
��˾��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">״̬���</td> 
  <td width="32%"><input type="text" name="ztxh" value="" size="20" maxlength="8" ></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
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
	if(	javaTrim(FormName.cpztbm)=="") {
		alert("������[��Ʒ״̬����]��");
		FormName.cpztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpztmc)=="") {
		alert("������[��Ʒ״̬����]��");
		FormName.cpztmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("��ѡ��[������]��");
		FormName.ghf[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ztxh)=="") {
		alert("������[״̬���]��");
		FormName.ztxh.focus();
		return false;
	}
	if(!(isNumber(FormName.ztxh, "״̬���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
