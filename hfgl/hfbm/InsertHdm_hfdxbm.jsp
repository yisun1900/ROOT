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
<form method="post" action="SaveInsertHdm_hfdxbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">�طö������</td>
  <td><select name="hfdxflbm" style="FONT-SIZE:12PX;WIDTH:362PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hfdxflbm,hfdxflmc from hdm_hfdxflbm order by hfdxflbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">�طö������</td> 
  <td width="70%"> 
    <input type="text" name="hfdxbm" value="" size="20" maxlength="4" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">�طö�������</td> 
  <td width="70%"><input type="text" name="hfdxmc" value="" size="50" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">���</td> 
  <td width="70%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >  </td>
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
	if(	javaTrim(FormName.hfdxbm)=="") {
		alert("������[�طö������]��");
		FormName.hfdxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxmc)=="") {
		alert("������[�طö�������]��");
		FormName.hfdxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxflbm)=="") {
		alert("��ѡ��[�طö������]��");
		FormName.hfdxflbm.focus();
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
