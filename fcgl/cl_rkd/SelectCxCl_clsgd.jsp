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
<form method="post" action="Cl_clsgdCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�깺����</td> 
  <td width="35%"> 
    <input type="text" name="sgph" size="20" maxlength="11" >
  </td>
  <td align="right" width="15%">�깺��λ</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
		%> 
	</select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�깺״̬</td> 
  <td width="35%"> 
	<select name="sgzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
	  <option value="1">δ�ύ</option>
	  <option value="2">���ύ</option>
	  <option value="3">�ܲ����</option>
	  <option value="4">��Ӧ���µ�</option>
	</select>
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�깺������ ��</td> 
  <td width="35%"> 
  <input type="text" name="sgzsl" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> <input type="text" name="sgzsl2" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ܲ����ʱ�� ��</td> 
  <td width="35%"> 
 <input type="text" name="zbshsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="zbshsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ӧ���µ�ʱ�� ��</td> 
  <td width="35%"> 
 <input type="text" name="gysxdsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
  <input type="text" name="gysxdsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ӧ���µ���</td> 
  <td width="35%"> 
  <input type="text" name="gysxdr" size="20" maxlength="20" ></td>
  <td align="right" width="15%">�ܲ������</td> 
  <td width="35%"> 
    <input type="text" name="zbshr" size="20" maxlength="20" >
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
	if(!(isFloat(FormName.sgzsl, "�깺������"))) {
		return false;
	}
	if(!(isFloat(FormName.sgzsl2, "�깺������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj, "�ܲ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj2, "�ܲ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gysxdsj, "��Ӧ���µ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gysxdsj2, "��Ӧ���µ�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
