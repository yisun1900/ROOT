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
<form method="post" action="Crm_tsbxgzjlCxList.jsp" name="selectform">
<div align="center">��ѯ������Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ټ�¼��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_gzjlh" size="20" maxlength="12" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"><%
	cf.radioToken(out, "crm_tsbxgzjl_lx","1+����רԱ&2+�ͷ�","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ͷ�߱��޼�¼��</td> 
  <td width="32%"><input type="text" name="crm_tsbxgzjl_tsjlh" size="20" maxlength="10" ></td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"><input type="text" name="crm_tsbxgzjl_khbh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_tsbxgzjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_tsbxgzjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_lrbm" size="20" maxlength="5" >  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_tsbxgzjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxgzjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
