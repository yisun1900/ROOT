<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ѡ��ͻ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="0">
    <tr> 
      <td height="55" colspan="3"> 
        <div align="center">��ѡ������</div>      </td>
    </tr>
    <tr> 
      <td width="16%" height="34" align="right" valign="top">&nbsp;</td>
      <td width="46%" valign="top">
	  <input type="radio" name="xclbz" value="1" onClick="xllb.style.display ='block';">
        �Ƕ���ʽ������Ʒ�� <P>
        <input type="radio" name="xclbz" value="2" onClick="xllb.style.display ='none';">
        ����ʽ������Ʒ�� 
</td>
      <td height="34" width="38%" valign="middle"> 
        <table width="100%" border="0" bgcolor="#FFFFCC"  id="xllb" style="display:none">
          <tr> 
		  <td > 
          <input type="radio" name="zt" value="2" checked>
          ǩ��װ��ͬ�ͻ� </td>
    </tr>
  </table>      </td>
    </tr>
    <tr> 
      <td height="48" colspan="3"> 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(selectform)">
        </div>      </td>
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
	if(	!radioChecked(FormName.xclbz)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.xclbz[0].focus();
		return false;
	}

	if (FormName.xclbz[0].checked)
	{
		FormName.action="SelectCxCrm_khxx.jsp";
	}
	else if (FormName.xclbz[2].checked)
	{
		FormName.action="/jcjj/kczcdd/SelectCxCrm_khxx.jsp";
	}
	else{
		FormName.action="SelectXgClJc_zcdd.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
