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
<form method="post" action="HyKHzL.jsp" name="selectform">
<div align="center">
  <p>��ԭ�ͻ���Ϣ</p>
  <p>�������ݿ⣭��>��ǰ���ݿ� </p>
<table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td height="36" colspan="2" align="center" bgcolor="#CCCCCC"><strong>��ѡ��ԭ��Χ</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="36" align="right">¼��ʱ�� �� </td>
  <td><input type="text" name="qslrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="40%" height="27" align="right">��</td>
  <td width="60%"><input type="text" name="qzlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
<tr align="center"> 
  <td colspan="2"> 
    <input type="button"  value="��ʼ��ԭ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</div>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.qslrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.qslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qslrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qzlrsj2)=="") {
		alert("������[¼��ʱ��]��");
		FormName.qzlrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.qzlrsj2, "¼��ʱ��"))) {
		return false;
	}

	if ( !confirm("ȷʵҪ������?") )	
	{
		return;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
