<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ztbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" value="" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" value="" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="01">��Ƹ</option>
    <option value="02">��ѵ</option>
    <option value="03">�䶯</option>
    <option value="04">��������</option>
    <option value="06">������ְ</option>
    <option value="07">��������</option>
    <option value="08">�Ӱ�����</option>
    <option value="09">���ڿ�������</option>
    <option value="10">��ٵ�</option>
    <option value="11">��������</option>
    <option value="12">�����λ����</option>
    <option value="13">��ְ����</option>
    <option value="14">�˻���Ա����</option>
    </select>
  </td>
  <td align="right" width="15%">���޸�����״̬</td> 
  <td width="35%"> 
     <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"02+��������&03+����ͨ��&04+����ȡ��","");
%>
    </select>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.ztbm)=="") {
		alert("������[״̬����]��");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmc)=="") {
		alert("������[״̬����]��");
		FormName.ztmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztlx)=="") {
		alert("��ѡ��[״̬����]��");
		FormName.ztlx.focus();
		return false;
	}
	if(	javaTrim(FormName.sqzt)=="") {
		alert("������[���޸�����״̬]��");
		FormName.sqzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
