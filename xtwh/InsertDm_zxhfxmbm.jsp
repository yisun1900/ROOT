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
<form method="post" action="SaveInsertDm_zxhfxmbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ط���Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="hfxmbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">�ط���Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="hfxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��Ʒ����Ƿ�����</option>
    <option value="2">���ʦ��ͨ����</option>
    <option value="3">���ʦ����</option>
    <option value="4">���̱���</option>
    <option value="5">������Ա����</option>
    <option value="6">��˾����ӡ��</option>
    <option value="7">ϣ���Ľ�����</option>
    </select>
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
	if(	javaTrim(FormName.hfxmbm)=="") {
		alert("������[�ط���Ŀ����]��");
		FormName.hfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfxmmc)=="") {
		alert("������[�ط���Ŀ����]��");
		FormName.hfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lx)=="") {
		alert("��ѡ��[����]��");
		FormName.lx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>