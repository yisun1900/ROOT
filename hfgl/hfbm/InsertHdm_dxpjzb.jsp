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
<form method="post" action="SaveInsertHdm_dxpjzb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�طö���</td>
  <td><select name="hfdxbm" style="FONT-SIZE:12PX;WIDTH:462PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc||'---��'||hfdxflmc||'��' from hdm_hfdxbm,hdm_hfdxflbm where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="28%">�طö�������ָ�����</td> 
  <td width="72%"> 
    <input type="text" name="dxpjzbbm" value="" size="20" maxlength="6" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�طö�������ָ��</td>
  <td><input type="text" name="dxpjzb" value="" size="50" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="28%">���</td> 
  <td width="72%"><input type="text" name="xh" value="" size="20" maxlength="8" ></td>
  </tr>
    <tr align="center"> 
      <td colspan="2"> 
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
	if(	javaTrim(FormName.dxpjzbbm)=="") {
		alert("������[�طö�������ָ�����]��");
		FormName.dxpjzbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dxpjzb)=="") {
		alert("������[�طö�������ָ��]��");
		FormName.dxpjzb.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxbm)=="") {
		alert("��ѡ��[�طö���]��");
		FormName.hfdxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
