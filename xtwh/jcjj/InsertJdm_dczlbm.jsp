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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJdm_dczlbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ز��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dczlbm" value="" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">�ز���������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dczlmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�زĺ�ȣ�mm��</td>
              <td width="35%"> 
                <input type="text" name="dzhd" value="" size="20" maxlength="8" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
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
	if(	javaTrim(FormName.dczlbm)=="") {
		alert("������[�ز��������]��");
		FormName.dczlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dczlmc)=="") {
		alert("������[�ز���������]��");
		FormName.dczlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dzhd)=="") {
		alert("������[�زĺ��]��");
		FormName.dzhd.focus();
		return false;
	}
	if(!(isNumber(FormName.dzhd, "�زĺ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
