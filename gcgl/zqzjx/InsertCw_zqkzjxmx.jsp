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
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_zqkzjxmx.jsp" name="insertform" target="_blank">
<div align="center">���ڿ���������ϸ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span><span class="STYLE2">�ͻ����</span></td> 
  <td width="34%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span>�������־</td> 
  <td width="33%"><input type="radio" name="zjxbz"  value="1">
    ����
      <input type="radio" name="zjxbz"  value="2">
      ���� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td colspan="3"><input type="text" name="mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span>���</td> 
  <td width="34%"><input type="text" name="je" value="" size="20" maxlength="17" ></td>
  <td align="right" width="17%"><span class="STYLE1">*</span>��ͬ��</td> 
  <td width="33%"><input type="text" name="ptr" value="" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������</td>
  <td colspan="3"><input type="text" name="cls" value="" size="73" maxlength="50" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.zjxbz)) {
		alert("��ѡ��[�������־]��");
		FormName.zjxbz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.mc)=="") {
		alert("������[����]��");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.cls)=="") {
		alert("������[������]��");
		FormName.cls.focus();
		return false;
	}
	if(	javaTrim(FormName.ptr)=="") {
		alert("������[��ͬ��]��");
		FormName.ptr.focus();
		return false;
	}

	if (FormName.zjxbz[1].checked)
	{
		if(	javaTrim(FormName.bz)=="") {
			alert("������[��ע]��");
			FormName.bz.focus();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
