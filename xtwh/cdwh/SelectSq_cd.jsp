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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_cdList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdbh" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxh" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵���ʾ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxsmc" size="20" maxlength="100" >
  </td>
  <td width="15%"> 
    <div align="right">���˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fcdbh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�Ƿ�ĩ���˵�</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "sfmjcd","Y+��&N+��","");
%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.cdxh, "�˵����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
