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
<form method="post" action="SaveInsertCrm_xmflbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��Ŀ�������(2λ)</td>
      <td width="30%"> 
        <input type="text" name="xmflbm" value="" size="20" maxlength="2" >
      </td>
      <td align="right" width="19%">��Ŀ����</td>
      <td width="31%"> 
        <input type="text" name="xmfl" value="" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ʾ���</td>
      <td width="30%"> 
        <input type="text" name="xskd" size="20" maxlength="8"  value="" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
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
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("������[��Ŀ�������]��");
		FormName.xmflbm.focus();
		return false;
	}
	if (FormName.xmflbm.value.length!=2)
	{
		alert("[��Ŀ�������]ӦΪ2λ��");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmfl)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmfl.focus();
		return false;
	}
	if(	javaTrim(FormName.xskd)=="") {
		alert("������[��ʾ���]��");
		FormName.xskd.focus();
		return false;
	}
	if(!(isNumber(FormName.xskd, "��ʾ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
