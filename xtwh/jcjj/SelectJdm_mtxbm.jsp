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
<form method="post" action="Jdm_mtxbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����߱���</td> 
  <td width="35%"> 
    <input type="text" name="mtxbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">����������</td> 
  <td width="35%"> 
    <input type="text" name="mtxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����żӼ���</td> 
  <td width="35%"> 
    <input type="text" name="ztmjjl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">�ƿڼӼ���</td> 
  <td width="35%"> 
    <input type="text" name="ykjjl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���׼Ӽ���</td> 
  <td width="35%"> 
    <input type="text" name="ctjjl" size="20" maxlength="9" >
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
	if(!(isFloat(FormName.ztmjjl, "�����żӼ���"))) {
		return false;
	}
	if(!(isFloat(FormName.ykjjl, "�ƿڼӼ���"))) {
		return false;
	}
	if(!(isFloat(FormName.ctjjl, "���׼Ӽ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
