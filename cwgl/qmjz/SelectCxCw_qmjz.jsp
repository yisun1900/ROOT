<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_qmjzCxList.jsp" name="selectform">
<div align="center">ҵ����ĩ��ת</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ҵ����תʱ��</td> 
  <td width="35%"> 
    <input type="text" name="jzrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��ת��</td> 
  <td width="35%"> 
    <input type="text" name="jzr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ڽ�ת����</td> 
  <td width="35%"> 
    <input type="text" name="sqjzrq" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.jzrq, "ҵ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqjzrq, "���ڽ�ת����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
