<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_cpztbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="radio" name="cplx"  value="0">ȫ��
    <input type="radio" name="cplx"  value="1">����Ʒ
    <input type="radio" name="cplx"  value="2">��Ʒ
  </td>
  <td align="right" width="18%">������  </td>
  <td width="32%"><input type="radio" name="ghf"  value="�׹�">
�׹�
  <input type="radio" name="ghf"  value="��˾��">
��˾��  </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
