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
<form method="post" action="SaveInsertDm_rwflbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">����</td>
    <td><select name="dl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="rwflbm.value=this.value">
        <option value=""></option>
        <option value="1">һ��</option>
        <option value="2">����</option>
        <option value="3">����</option>
        <option value="4">����</option>
        <option value="5">����</option>
        <option value="6">�µ�</option>
        <option value="7">���</option>
        <option value="8">�ͻ�</option>
        <option value="9">��װ</option>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������(2λ)</td> 
  <td width="32%"> 
    <input type="text" name="rwflbm" value="" size="20" maxlength="2" >  </td>
  <td align="right" width="17%">�����������</td> 
  <td width="33%"> 
    <input type="text" name="rwflmc" value="" size="20" maxlength="50" >  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.dl)=="") {
		alert("��ѡ��[����]��");
		FormName.dl.focus();
		return false;
	}
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("������[����������]��");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwflmc)=="") {
		alert("������[�����������]��");
		FormName.rwflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
