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
    <td height="55"> 
      <div align="center">��ѡ��ͻ�����</div>
    </td>
  </tr>
  <tr> 
    <td height="103"> 
      <div align="center">
        <p>ǩ��װ��ͬ�ͻ� 
           <input type="radio" name="zt" value="2" checked>
        </p>
        <p>�Ǽ�װ�ͻ�
          <input type="radio" name="zt" value="4">
        </p>
      </div>
    </td>
  </tr>
  <tr> 
    <td height="48"> 
      <div align="center">
		<input type="button"  value="����" onClick="f_do(selectform)">
      </div>
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
	if(	!radioChecked(FormName.zt)) {
		alert("��ѡ��[�ͻ�����]��");
		FormName.zt[0].focus();
		return false;
	}

	if (FormName.zt[0].checked)
	{
		FormName.action="SelectCxCrm_khxx.jsp";
	}
	else{
		FormName.action="SelectCxCrm_zxkhxx.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
