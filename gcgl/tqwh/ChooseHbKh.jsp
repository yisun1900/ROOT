<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ѡ��ϲ��ͻ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=request.getParameter("ssfgs");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4" height="68">
        <b><font size="4">������ϲ��ͻ���Ϣ</font></b>
        <BR><b><font color="#FF0000" size="4">������ɾ�����ɿͻ���������װ�ͻ���</font></b>
      </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" height="37" bgcolor="#CCCCFF"><b>ɾ���ͻ�</b></td>
    <td colspan="2" align="center" height="37" bgcolor="#CCFFCC"><b>�����ͻ�</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">��ͬ��</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="hth1" size="20" maxlength="20">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">��ͬ��</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="hth2" size="20" maxlength="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">�ͻ����</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="khbh1" size="20" maxlength="20">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">�ͻ����</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="khbh2" size="20" maxlength="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">�ͻ�����</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="khxm1" size="20" maxlength="50">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">�ͻ�����</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="khxm2" size="20" maxlength="50">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="fwdz1" size="20" maxlength="100">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">���ݵ�ַ</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="fwdz2" size="20" maxlength="100">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="4" bgcolor="#FFFFFF" height="55"> 
		<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
      <input type="button"  value="����" onClick="f_do(selectform)" name="button">
      <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.hth1)=="" && javaTrim(FormName.khbh1)=="" && javaTrim(FormName.khxm1)=="" && javaTrim(FormName.fwdz1)=="" ) 
	{
		alert("������[ɾ���ͻ�����]��");
		FormName.khxm1.select();
		return false;
	}

	if(	javaTrim(FormName.hth2)=="" && javaTrim(FormName.khbh2)=="" && javaTrim(FormName.khxm2)=="" && javaTrim(FormName.fwdz2)=="" ) 
	{
		alert("������[�����ͻ�����]��");
		FormName.khxm2.select();
		return false;
	}

	FormName.action="XsKhxxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
