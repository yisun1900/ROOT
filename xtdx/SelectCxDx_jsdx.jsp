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
<form method="post" action="Dx_jsdxCxList.jsp" name="selectform">
<div align="center">���Ž��ռ�¼��ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ֻ�����</td>
      <td width="35%">
        <input type="text" name="fshm" size="20" maxlength="11" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ʱ�� ��</td>
      <td width="35%"> 
        <input type="text" name="jssj" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%">
        <input type="text" name="jssj2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
