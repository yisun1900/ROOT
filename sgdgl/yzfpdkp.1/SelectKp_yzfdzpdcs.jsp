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
<form method="post" action="Kp_yzfdzpdcsList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ֹ�˾</td> 
  <td width="31%"> 
    <select name="kp_yzfdzpdcs_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="19%">��һ��ȵ�ƽ������</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_pjde" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���鹤����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_grs" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">�ʱ�����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zbj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ��������Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_khmyd" size="20" maxlength="9" >
  </td>
  <td align="right" width="19%">������С��ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zxzsgds" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���������ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="kp_yzfdzpdcs_zdzsgds" size="20" maxlength="8" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
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
	if(!(isFloat(FormName.kp_yzfdzpdcs_pjde, "��һ��ȵ�ƽ������"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_grs, "���鹤����Сֵ"))) {
		return false;
	}
	if(!(isFloat(FormName.kp_yzfdzpdcs_zbj, "�ʱ�����Сֵ"))) {
		return false;
	}
	if(!(isFloat(FormName.kp_yzfdzpdcs_khmyd, "�ͻ��������Сֵ"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_zxzsgds, "������С��ʩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_yzfdzpdcs_zdzsgds, "���������ʩ������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
