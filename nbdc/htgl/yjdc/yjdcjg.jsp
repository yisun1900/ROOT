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
<form method="post"  name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������</td>
      <td width="35%"> <input type="text" name="wtbh" size="20" maxlength="20" > 
      </td>
      <td align="right" width="15%">��������</td>
      <td width="35%"> <input type="text" name="dcqs" size="20" maxlength="100" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td width="35%"> <input type="text" name="wtmc" size="20" maxlength="100" > 
      </td>
      <td align="right" width="15%">�Ƿ�ɶ�ѡ</td>
      <td width="35%"> 
        <%
	cf.radioToken(out, "sfkdx","Y+�ɶ�ѡ&N+��ѡ","");
%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����Ƿ����</td>
      <td width="35%"> 
        <%
	cf.radioToken(out, "wtsfgq","Y+����&N+δ����","");
%>
      </td>
      <td align="right" width="15%">�������</td>
      <td width="35%"> <input type="text" name="wtfl" size="20" maxlength="1" > 
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="zdsj1" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="zdsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button"  value="��ѯ" onClick="f_do(selectform)"> 
	 
        <input type="reset"  value="����"> 
		  <input type="button"  value="ͳ��" onClick="f_do1(selectform)"> 
    </tr></td>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.zdsj1, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zdsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.action="Hd_ckjgList.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.zdsj1, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zdsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.action="Hd_tj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
