<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khdcwtList.jsp" name="selectform">
<div align="center">�ͻ��������⣭ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="wtbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">��������</td>
      <td width="32%"> 
        <input type="text" name="wtmc" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�Ƿ�ɶ�ѡ</td>
      <td width="32%"> <%
	cf.radioToken(out, "sfkdx","1+��ѡ&2+��ѡ&3+д˵��","");
%> </td>
      <td align="right" width="18%">��Ч��־</td>
      <td width="32%"> <%
	cf.radioToken(out, "yxbz","Y+��Ч&N+��Ч","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="fbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="fbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="fbr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.wtbh, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.fbsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
