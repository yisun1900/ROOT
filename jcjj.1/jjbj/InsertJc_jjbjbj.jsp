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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">���Ʒ��</td> 
      <td width="33%"> 
        <input type="text" name="bcpp" value="" size="20" maxlength="50" >
  </td>
      <td align="right" width="17%">�������</td>    <td width="33%">
        <input type="text" name="bclx" value="" size="20" maxlength="50" >
      </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">��ĺ�ȣ�mm��</td>
      <td width="33%"> 
        <input type="text" name="bchd" value="" size="20" maxlength="8" >
      </td>    
      <td align="right" width="17%">����</td>
      <td width="33%"> 
        <input type="text" name="dj" value="" size="20" maxlength="17" >
      </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onClick="f_drnewExcel(insertform)"  value="���ӼҾ߰�����ۣ�Excel��" >      
		<P><A HREF="�Ҿ߰������.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>
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
	if(	javaTrim(FormName.bcpp)=="") {
		alert("������[���Ʒ��]��");
		FormName.bcpp.focus();
		return false;
	}
	if(	javaTrim(FormName.bclx)=="") {
		alert("������[�������]��");
		FormName.bclx.focus();
		return false;
	}
	if(	javaTrim(FormName.bchd)=="") {
		alert("������[��ĺ��]��");
		FormName.bchd.focus();
		return false;
	}
	if(!(isNumber(FormName.bchd, "��ĺ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	FormName.action="SaveInsertJc_jjbjbj.jsp";
	FormName.submit();
	return true;
}

function f_drnewExcel(FormName)//����FormName:Form������
{
	FormName.action="ImpAddDataJjbj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
