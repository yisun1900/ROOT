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
<form method="post" action="Cmp_cmpjlList.jsp" name="selectform">
<div align="center">��Ȩ��¼ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">������״̬</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cmp_cmpjl_cmpzt","1+δ��д&2+����д","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���������</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_cmpbh" size="20" maxlength="5" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cmp_cmpjl_lx","1+�깤����","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="cmp_cmpjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="cmp_cmpjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ����дʱ�� ��</td> 
  <td width="32%"><input type="text" name="cmp_cmpjl_sjtxsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cmp_cmpjl_sjtxsj2" size="20" maxlength="10" >  </td>
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
	if(!(isDatetime(FormName.cmp_cmpjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_sjtxsj, "ʵ����дʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_sjtxsj2, "ʵ����дʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
