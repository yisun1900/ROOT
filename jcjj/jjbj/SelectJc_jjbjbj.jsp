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
<form method="post" action="" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���Ʒ��</td> 
  <td width="35%"> 
    <input type="text" name="bcpp" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��ĺ��</td> 
  <td width="35%"> 
    <input type="text" name="bchd" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="dj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">&nbsp; 
    
  </td>
  <td width="35%">&nbsp; 
    
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="��������">  </td>
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
	if(!(isNumber(FormName.bchd, "��ĺ��"))) {
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_jjbjbjList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_jjbjbjDcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
