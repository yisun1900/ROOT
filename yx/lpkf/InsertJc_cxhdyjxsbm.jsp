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
<form method="post" action="SaveInsertJc_cxhdyjxsbm.jsp" name="insertform" target="_blank">
<div align="center">ҵ��ϵ�����룭¼��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ҵ��ϵ������</td> 
  <td width="35%"> 
    <input type="text" name="yjxsbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">ҵ��ϵ������</td> 
  <td width="35%"> 
    <input type="text" name="yjxsmc" value="" size="20" maxlength="40" >
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
	if(	javaTrim(FormName.yjxsbm)=="") {
		alert("������[ҵ��ϵ������]��");
		FormName.yjxsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjxsmc)=="") {
		alert("������[ҵ��ϵ������]��");
		FormName.yjxsmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
