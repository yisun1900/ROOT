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
<form method="post" action="SaveInsertJdm_cpjjmc.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ʒ�Ҿ����Ʊ���</td> 
  <td width="35%"> 
    <input type="text" name="cpjjmcbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">��Ʒ�Ҿ�����</td> 
  <td width="35%"> 
    <input type="text" name="cpjjmc" value="" size="20" maxlength="50" >
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
	if(	javaTrim(FormName.cpjjmcbm)=="") {
		alert("������[��Ʒ�Ҿ����Ʊ���]��");
		FormName.cpjjmcbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjmc)=="") {
		alert("������[��Ʒ�Ҿ�����]��");
		FormName.cpjjmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
