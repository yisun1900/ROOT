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

<form method="post" action="Qh_lfcxdjb1List.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ʒ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_lfcxdjb_zpnr" size="20" maxlength="50" >
  </td>
  <td width="15%"> 
    <div align="right">�ͻ�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�Ǽ����ڴ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_lfcxdjb_djrq" value=<%=cf.firstDayDate()%> size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">��</div>
  </td>
  <td width="35%"> 
  <input type="text" name="qh_lfcxdjb_djrq2" size="20" value=<%=cf.today()%> maxlength="10" >
  </td> 
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <p align="right">���ʦ
  </td>
  <td width="35%"> 
    <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <p align="right">��</p>
  </td>
  <td width="35%"> 
    ��
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
	if(!(isDatetime(FormName.qh_lfcxdjb_djrq, "�Ǽ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qh_lfcxdjb_djrq2, "�Ǽ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
