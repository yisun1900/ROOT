<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<form method="post" action="" name="dwform">
<table width="100%" border="0">
  <tr>
    <td height="30" colspan="2" align="center"><p>���SQL�Ƿ���ȷ</p>
      <p>�磺<strong>SELECT</strong> bj_tcbjxmmx.xmbh,xmmc,jldwmc,dj <strong>FROM</strong> bj_tcbjxmmx,bj_bjxmmx
      <BR>�ɰ����·�ʽ¼�룬��¼�������SQL���</td>
  </tr>
  <tr>
    <td width="27%" align="right">SELECT</td>
    <td width="73%"><textarea name="selectStr" cols="71" rows="5">bj_tcbjxmmx.xmbh,xmmc,jldwmc,dj</textarea></td>
  </tr>
  <tr>
    <td align="right">FROM</td>
    <td><textarea name="fromStr" cols="71" rows="5">bj_tcbjxmmx,bj_bjxmmx</textarea></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
	<input type="button"  value="��ʼ���" onClick="f_fo(dwform)">	</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>


		
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_fo(FormName)
{
	if(	FormName.selectStr.value=="") {
		alert("��¼��SQL��select���֣�");
		FormName.selectStr.focus();
		return false;
	}
	if(	FormName.fromStr.value=="") {
		alert("��¼��SQL��from���֣�");
		FormName.fromStr.focus();
		return false;
	}

	FormName.action="startCheckField.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
