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

<form method="post" action="" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">װ�޼�λ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">װ�޼�λ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >
  </td>
  <td width="15%"> 
    <div align="right">�յ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
				  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="button" type="button" onClick="f_gx(insertform)"  value="���¡�װ�޼�λ����Ϣ">
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
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("������[װ�޼�λ����]��");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwmc)=="") {
		alert("������[װ�޼�λ����]��");
		FormName.zxjwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("������[���]��");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("������[�յ�]��");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "�յ�"))) {
		return false;
	}

	FormName.action="SaveInsertDm_zxjwbm.jsp";
	FormName.submit();
	return true;
}

function f_gx(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )	
	{
		FormName.action="UpdateKhxxZxjwbm.jsp";
		FormName.submit();
		return true;
	}

}
//-->
</SCRIPT>
