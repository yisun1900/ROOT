<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�Ų�������ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<div align="center">
  <p><font color="red"><b>Ⱥ�������ֻ������м���Ӣ�Ķ���(,)����</b></font></p>
  </div>
        <form method="post" name="selectform">
		<DIV align="center">
  <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">�ֻ�����</td>
      <td width="75%"> 
        <input type="txt" value="" name="jssj" size="55">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">��Ϣ����</td>
      <td width="75%"> 
        <textarea name="dxnr" rows="5" cols="55"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center">
          <input type="button"  value="����" onClick="f_ph(selectform)" name="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset"  value="����" name="reset">
        </div>
      </td>
    </tr>
  </table>
  </DIV>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[�ֻ�����]��");
		FormName.jssj.focus();
		return false;
	}
	if(	javaTrim(FormName.dxnr)=="") {
		alert("������[��Ϣ����]��");
		FormName.dxnr.focus();
		return false;
	}

	FormName.action="fs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
