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
<form method="post" action="Dx_yfdxCxList.jsp" name="selectform">
  <div align="center">���ŷ��ͼ�¼��ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ֻ�����</td>
      <td width="35%">
        <input type="text" name="jshm" size="20" maxlength="11" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ʱ�� �� </td>
      <td width="35%">
        <input type="text" name="fcsj" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">�� </td>
      <td width="35%">
        <input type="text" name="fcsj2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������</td>
      <td width="35%">
        <input type="text" name="fsr" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">�Ƿ�ɹ�</td>
      <td width="35%"> 
        <input type="radio" name="sfcg" value="Y">
        �ɹ� 
        <input type="radio" name="sfcg" value="N">
        ʧ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���ͷ�ʽ</td>
      <td width="35%"> 
        <select name="fsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">�˹�����</option>
          <option value="0">��ʱ����</option>
        </select>
      </td>
      <td align="right" width="15%">���ͽ�� </td>
      <td width="35%"> 
        <select name="fsjg" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">�ɹ�����</option>
          <option value="-100">����ʧ��</option>
          <option value="-2">����������</option>
          <option value="-3">�û��������벻��ȷ</option>
          <option value="-4">�û��˺�����</option>
          <option value="8">δ֪ԭ��ʧ��</option>
          <option value="9">�޷���ֵ</option>
        </select>
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
	if(!(isDatetime(FormName.fcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.fcsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
