<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_gzrlList.jsp" name="selectform">
<div align="center">��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">���� ��</td>
  <td><input type="text" name="rq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="rq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="nian" size="20" maxlength="4" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��</td> 
  <td width="32%"> 
    <input type="text" name="yue" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"> 
    <input type="text" name="ri" size="20" maxlength="2" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ڼ��ձ�־</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jjrbz","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">�ڼ�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jjrlx","1+����&2+����&3+����&8+����","");
%>  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isDatetime(FormName.rq, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rq2, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
