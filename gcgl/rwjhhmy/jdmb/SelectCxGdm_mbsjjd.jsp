<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Gdm_mbsjjdCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ģ�����</td> 
  <td width="32%"> 
    <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb order by mbbm","");
%>
    </select>
  </td>
  <td align="right" width="18%">ģ������</td> 
  <td width="32%"> 
    <input type="text" name="mbmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <select name="rwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm order by rwbm","");
%>
    </select>
  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="rwmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="rwsfsj" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="rwxh" size="20" maxlength="8" >
  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.rwsfsj, "������ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.rwxh, "�������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
