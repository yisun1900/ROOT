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

<form method="post" action="SaveInsertJdm_mlx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�����ͱ���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="mlx" value="" size="20" maxlength="1" >
              </td>
              <td width="18%"> 
                <div align="right">����������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="mlxmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�߶Ȳ�С�ڣ�MM��</td>
              <td width="32%"> 
                <input type="text" name="gdbxy" size="20" maxlength="8"  value="" >
              </td>
              <td width="18%" align="right">�߶Ȳ����ڣ�MM��</td>
              <td width="32%"> 
                <input type="text" name="gdbdy" size="20" maxlength="8"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ȳ�С�ڣ�MM��</td>
              <td width="32%"> 
                <input type="text" name="kdbxy" size="20" maxlength="8"  value="" >
              </td>
              <td width="18%" align="right">��Ȳ����ڣ�MM��</td>
              <td width="32%"> 
                <input type="text" name="kdbdy" size="20" maxlength="8"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td colspan="3"> 
                <textarea name="tx" rows="3" cols="71"></textarea>
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
	if(	javaTrim(FormName.mlx)=="") {
		alert("������[�����ͱ���]��");
		FormName.mlx.focus();
		return false;
	}
	if(	javaTrim(FormName.mlxmc)=="") {
		alert("������[����������]��");
		FormName.mlxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdbxy)=="") {
		alert("������[�߶Ȳ�С��]��");
		FormName.gdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbxy, "�߶Ȳ�С��"))) {
		return false;
	}
	if(	javaTrim(FormName.gdbdy)=="") {
		alert("������[�߶Ȳ�����]��");
		FormName.gdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbdy, "�߶Ȳ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbxy)=="") {
		alert("������[��Ȳ�С��]��");
		FormName.kdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbxy, "��Ȳ�С��"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbdy)=="") {
		alert("������[��Ȳ�����]��");
		FormName.kdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbdy, "��Ȳ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
