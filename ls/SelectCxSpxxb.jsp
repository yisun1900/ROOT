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
<form method="post" action="SpxxbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����Ŀ</td>
      <td width="35%"> 
        <input type="text" name="spxxb_kcxm" size="20" maxlength="14" >
      </td>
      <td align="right" width="15%">��Ӧ������</td>
      <td width="35%"> 
        <input type="text" name="gysb_gysmc" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��Ʒ��������</td>
      <td colspan="3"> 
        <textarea name="spxxb_spmcms" cols="72" rows="2"></textarea>
        <BR>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ѯ�����ڴ�</td>
      <td width="35%"> 
        <input type="text" name="spxjxxb_xjrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">�� </td>
      <td width="35%"> 
        <input type="text" name="spxjxxb_xjrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ͬ��</td>
      <td width="35%"> 
        <input type="text" name="ghhtspmxb_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">��Ʒ����</td>
      <td width="35%"> 
        <input type="text" name="spxxb_spfldm" size="20" maxlength="4" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ɹ����ڴ�</td>
      <td width="35%"> 
        <input type="text" name="cghtb_qdrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="cghtb_qdrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ͬ���ڴ�</td>
      <td width="35%"> 
        <input type="text" name="ghhtb_qdrq" size="20" maxlength="10" >
        <BR>
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> <BR>
        <input type="text" name="ghhtb_qdrq2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.spxjxxb_xjrq, "ѯ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.spxjxxb_xjrq2, "ѯ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cghtb_qdrq, "ǩ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cghtb_qdrq2, "ǩ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ghhtb_qdrq, "ǩ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.ghhtb_qdrq2, "ǩ������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
