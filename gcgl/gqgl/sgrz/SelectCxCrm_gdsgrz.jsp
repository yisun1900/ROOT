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
<form method="post" action="Crm_gdsgrzCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ǼǱ��</td> 
  <td width="35%"> 
    <input type="text" name="djbh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="lrsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ı�־</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sybz","N+δ��&Y+������","");
%>
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="syr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="sysj" size="20" maxlength="10" >
  <BR>��<input type="text" name="sysj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sysj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sysj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
