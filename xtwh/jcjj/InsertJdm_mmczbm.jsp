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

<form method="post" action="SaveInsertJdm_mmczbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ľ�Ų��ʱ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mmczbm" value="" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">��ɫ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ysmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ľ�Ų�������</td>
              <td colspan="3"> 
                <input type="text" name="mmczmc" value="" size="73" maxlength="50" >
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
	if(	javaTrim(FormName.mmczbm)=="") {
		alert("������[ľ�Ų��ʱ���]��");
		FormName.mmczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmczmc)=="") {
		alert("������[ľ�Ų�������]��");
		FormName.mmczmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysmc)=="") {
		alert("������[��ɫ����]��");
		FormName.ysmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
