<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_damxbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">������ϸ����</td> 
  <td width="33%"> 
    <input type="text" name="damxbm" size="20" maxlength="2" >  </td>
  <td align="right" width="17%">�鵵��־</td> 
  <td width="33%"><%
	cf.radioToken(out, "gdbz","Y+����鵵&N+�ɲ��鵵","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">������ϸ����</td> 
  <td colspan="3"><input type="text" name="damxmc" size="72" maxlength="50" >    </td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>