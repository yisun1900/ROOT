<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_pmjjbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ƽ�׾��۱���</td> 
  <td width="35%"> 
    <input type="text" name="pmjjbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">ƽ�׾�������</td> 
  <td width="35%"> 
    <input type="text" name="pmjjmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��㣨>��</td> 
  <td width="35%"> 
    <input type="text" name="qd" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�յ㣨<����</td> 
  <td width="35%"> 
    <input type="text" name="zd" size="20" maxlength="17" >
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(!(isFloat(FormName.qd, "��㣨>��"))) {
		return false;
	}
	if(!(isFloat(FormName.zd, "�յ㣨<����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
