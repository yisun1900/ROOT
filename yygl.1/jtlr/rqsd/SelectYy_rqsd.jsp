<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_rqsdList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="zqs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">�������ڿ�ʼ</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_szs" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ڽ���</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_sze" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">�������ڿ�ʼ</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_bzs" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ڽ���</td> 
  <td width="35%"> 
    <input type="text" name="yy_rqsd_bze" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(!(isNumber(FormName.zqs, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_szs, "�������ڿ�ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_sze, "�������ڽ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bzs, "�������ڿ�ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bze, "�������ڽ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
