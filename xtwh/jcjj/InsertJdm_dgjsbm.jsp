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

<form method="post" action="SaveInsertJdm_dgjsbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dgjsbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">���������������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dgjsmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���ڣ�mm��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dy" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">С�ڵ��ڣ�mm��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xydy" value="" size="20" maxlength="8" >
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
	if(	javaTrim(FormName.dgjsbm)=="") {
		alert("������[��������������]��");
		FormName.dgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgjsmc)=="") {
		alert("������[���������������]��");
		FormName.dgjsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dy)=="") {
		alert("������[���ڣ�mm��]��");
		FormName.dy.focus();
		return false;
	}
	if(!(isNumber(FormName.dy, "���ڣ�mm��"))) {
		return false;
	}
	if(	javaTrim(FormName.xydy)=="") {
		alert("������[С�ڵ��ڣ�mm��]��");
		FormName.xydy.focus();
		return false;
	}
	if(!(isNumber(FormName.xydy, "С�ڵ��ڣ�mm��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
