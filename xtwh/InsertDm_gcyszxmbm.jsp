<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertDm_gcyszxmbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td width="20%" align="right"><span class="STYLE1">*</span>������������Ŀ����</td>
  <td width="30%"><input type="text" name="gcyszxmbm" value="" size="20" maxlength="2" ></td>
  <td width="20%" align="right"><span class="STYLE1">*</span>���շ���</td>
  <td width="30%"><select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="2">���Ͻ�������</option>
    <option value="3">���ι�������</option>
    <option value="4">��������</option>
    <option value="5">�깤����</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������������Ŀ����</td>
  <td colspan="3"><input type="text" name="gcyszxmmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�ط�</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+��&N+��","");
%></td>
  <td align="right">��Ӧ���̽���</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
</tr>

            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gcyszxmbm)=="") {
		alert("������[������������Ŀ����]��");
		FormName.gcyszxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcyszxmmc)=="") {
		alert("������[������������Ŀ����]��");
		FormName.gcyszxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("��ѡ��[���շ���]��");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("������[�Ƿ�ط�]��");
		FormName.sfhf[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
