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
<form method="post" action="SaveInsertGdm_mbsjjd.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ģ�����</td> 
  <td width="37%"> 
    <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:252PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb order by mbbm","");
%>
    </select>  </td>
  <td align="right" width="13%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><select name="rwbm" style="FONT-SIZE:12PX;WIDTH:252PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm order by rwbm","");
%>
  </select></td>
  <td align="right">�������</td>
  <td><input type="text" name="rwxh" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ʱ��</td>
  <td><input type="text" name="rwsfsj" value="" size="20" maxlength="8" ></td>
  <td align="right">��������</td>
  <td><input name="rwts" type="text" id="rwts" value="" size="20" maxlength="8" ></td>
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[ģ�����]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwsfsj)=="") {
		alert("������[������ʱ��]��");
		FormName.rwsfsj.focus();
		return false;
	}
	if(!(isNumber(FormName.rwsfsj, "������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.rwts)=="") {
		alert("������[��������]��");
		FormName.rwts.focus();
		return false;
	}
	if(!(isNumber(FormName.rwts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("������[�������]��");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isNumber(FormName.rwxh, "�������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
