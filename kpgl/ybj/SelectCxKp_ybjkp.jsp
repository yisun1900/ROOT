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

<form method="post" action="Kp_ybjkpCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ʩ����</div>
  </td>
  <td width="35%"> 
    <select name="kp_ybjkp_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','7','8') order by dwbh","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�ṩ���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_ybjsl" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ι۴���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgcs" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�ι�ʧ�ܴ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgsbcs" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ι۳ɹ�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_cgcgcs" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">����Ӽ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_tsjjf" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_ybjpf" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">������ʼʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_qssj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������ֹʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_jzsj" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_ybjkp_kpr" size="20" maxlength="16" >
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
	if(!(isNumber(FormName.kp_ybjkp_ybjsl, "�ṩ���������"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgcs, "�ι۴���"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgsbcs, "�ι�ʧ�ܴ���"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_cgcgcs, "�ι۳ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_tsjjf, "����Ӽ���"))) {
		return false;
	}
	if(!(isNumber(FormName.kp_ybjkp_ybjpf, "���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_ybjkp_qssj, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_ybjkp_jzsj, "������ֹʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
